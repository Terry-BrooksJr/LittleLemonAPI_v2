import json

import django_filters
from API.models import Cart, MenuItems, Order, OrderItem, LittleLemoner
from API.permissions import _has_group_permission, _is_in_group
from API.utils import process_menu_item_update
from django.db.utils import IntegrityError
from django.contrib.auth.models import Group
from django.core.serializers import serialize
from django.http import JsonResponse, request
from django.shortcuts import get_object_or_404
from django_filters import rest_framework as filters
from django_filters.rest_framework import DjangoFilterBackend
from furl import furl
from loguru import logger
from rest_framework import mixins, status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.filters import SearchFilter
from rest_framework.generics import (
    GenericAPIView,
    ListAPIView,
    RetrieveAPIView,
    RetrieveDestroyAPIView,
    RetrieveUpdateDestroyAPIView,
)
from rest_framework.permissions import (
    AllowAny,
    IsAdminUser,
    IsAuthenticated,
    IsAuthenticatedOrReadOnly,
)
from rest_framework.response import Response

from . import serializers


class CartView(ListAPIView, mixins.CreateModelMixin, mixins.DestroyModelMixin):
    serializer_class = serializers.CartSerializer
    permission_classes = [
        IsAuthenticated,
    ]

    def get_queryset(self):
        return Cart.objects.filter(user=self.request.user).select_related("menuitems")

    def post(self, request, *args, **kwargs):
        unit_price = float(
            MenuItems.objects.get(id=request.data.get("menuitems")).price
        )
        item = MenuItems.objects.get(id=request.data.get("menuitems"))
        data = {
            "menuitems": item,
            "quantity": int(request.data.get("quantity")),
            "unit_price": unit_price,
            "price": unit_price * int(request.data.get("quantity")),
            "user": request.user,
        }
        logger.debug(data)
        try:
            new_cart_item = Cart(**data)
            new_cart_item.save()
            serializer = self.get_serializer(data=data)
            # serializer.is_valid(raise_exception=True)
            # self.perform_create(serializer)
            return Response("Item Added to Cart", status=status.HTTP_201_CREATED)
        except IntegrityError:
            return Response("Item Already In Cart", status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, *args, **kwargs):
        instance = Cart.objects.filter(user=self.request.user).select_related(
            "menuitems"
        )
        instance.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class MenuItemsFilter(filters.FilterSet):
    class Meta:
        model = MenuItems
        fields = (
            "price",
            "category",
            "featured",
        )


class MenuItemView(RetrieveAPIView, mixins.UpdateModelMixin, mixins.DestroyModelMixin):
    queryset = MenuItems.objects.all()
    lookup_field = "id"
    serializer_class = serializers.MenuItemSerializer
    permission_classes = (IsAuthenticated,)

    def put(self, request, *args, **kwargs):
        if request.user.groups.filter(name="Manager").exists():
            partial = kwargs.pop("partial", False)
            instance = self.get_object()
            serializer = self.get_serializer(
                instance, data=request.data, partial=partial
            )
            serializer.is_valid(raise_exception=True)
            self.perform_update(serializer)
            return Response(serializer.data)
        else:
            return Response(status=status.HTTP_403_FORBIDDEN)

    def delete(self, request, *args, **kwargs):
        if request.user.groups.filter(name="Manager").exists():
            instance = self.get_object()
            self.perform_destroy(instance)
            return Response(status=status.HTTP_204_NO_CONTENT)
        else:
            return Response(status=status.HTTP_403_FORBIDDEN)


class MenuItemsView(ListAPIView, mixins.CreateModelMixin):
    queryset = MenuItems.objects.all()
    serializer_class = serializers.MenuItemSerializer
    permission_classes = (IsAuthenticated,)
    filter_backends = (filters.DjangoFilterBackend, SearchFilter)
    filterset_class = MenuItemsFilter
    search_fields = ["title"]

    def post(self, request, *args, **kwargs):
        if request.user.groups.filter(name="Manager").exists():
            return self.create(request, *args, **kwargs)
        else:
            return Response(status=status.HTTP_403_FORBIDDEN)


class Managers(GenericAPIView, mixins.ListModelMixin):
    permission_classes = (IsAdminUser,)
    lookup_field = "username"
    queryset = LittleLemoner.objects.filter(groups__name="Manager")
    serializer_class = serializers.ManagerSerializer

    def post(self, request):
        username = request.data["username"]
        if username:
            user = get_object_or_404(LittleLemoner, username=username)
            managers = Group.objects.get(name="Manager")
            managers.user_set.add(user)
            return Response(
                {"Status": "LittleLemoner Added to Manager's Group"},
                status.HTTP_201_CREATED,
            )
        else:
            return Response(
                {"ERROR": "Unable to Add - LittleLemoner Not Found"},
                status.HTTP_404_NOT_FOUND,
            )

    def get(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)


@api_view(["DELETE"])
@permission_classes([IsAdminUser])
def delete_manager(request, *args, **kwargs):
    user_id = furl(request.build_absolute_uri()).path.segments[-1]
    logger.debug(user_id)
    user = get_object_or_404(LittleLemoner, id=user_id)
    if user:
        managers = Group.objects.get(name="Manager")
        managers.user_set.remove(user)
        return Response(
            {"Status": "LittleLemoner Removed From Manager's Group"},
            status.HTTP_201_CREATED,
        )
    else:
        return Response(
            {"ERROR": "Unable From Remove - LittleLemoner Not Found"},
            status.HTTP_404_NOT_FOUND,
        )


class DeliveryCrew(GenericAPIView, mixins.ListModelMixin):
    permission_classes = (IsAuthenticated,)
    lookup_field = "username"
    queryset = LittleLemoner.objects.filter(groups__name="Delivery Crew")
    serializer_class = serializers.ManagerSerializer

    def post(self, request):
        if request.user.groups.filter(name="Manager") or request.user.IsAdminUser:
            username = request.data["username"]
            if username:
                user = get_object_or_404(LittleLemoner, username=username)
                managers = Group.objects.get(name="Delivery Crew")
                managers.user_set.add(user)
                return Response(
                    {"Status": "LittleLemoner Added to Delivery Crew Group"},
                    status.HTTP_201_CREATED,
                )
            else:
                return Response(
                    {"ERROR": "Unable to Add - LittleLemoner Not Found"},
                    status.HTTP_404_NOT_FOUND,
                )
        else:
            return Response("Manager and Admin", status.HTTP_403_FORBIDDEN)

    def get(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)


@api_view(["DELETE"])
@permission_classes([IsAdminUser])
def delete_delivery(request, *args, **kwargs):
    user_id = furl(request.build_absolute_uri()).path.segments[-1]
    logger.debug(user_id)
    user = get_object_or_404(LittleLemoner, id=user_id)
    if user:
        managers = Group.objects.get(name="Delivery Crew")
        managers.user_set.remove(user)
        return Response(
            {"Status": "LittleLemoner Removed From Delivery Crew Group"},
            status.HTTP_201_CREATED,
        )
    else:
        return Response(
            {"ERROR": "Unable From Remove - LittleLemoner Not Found"},
            status.HTTP_404_NOT_FOUND,
        )


class OrdersViews(ListAPIView, mixins.CreateModelMixin, mixins.UpdateModelMixin):
    serializer_class = serializers.OrderSerializer
    permission_classes = (IsAuthenticated,)

    def get_queryset(self):
        user = self.request.user
        return Order.filter(order=user)


class OrderView(RetrieveUpdateDestroyAPIView):
    serializer_class = serializers.OrderItemSerializer
    permission_classes = (IsAuthenticated,)
    lookup_field = "id"

    def get_queryset(self):
        user = self.request.user
        return Order.objects.filter(order=user)
