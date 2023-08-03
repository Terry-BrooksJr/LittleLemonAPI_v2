import json

import django_filters
from API.models import Cart, Category, MenuItems
from API.permissions import _has_group_permission, _is_in_group
from API.utils import process_menu_item_update
from django.contrib.auth.models import User
from django.http import request
from django.shortcuts import get_object_or_404
from django_filters import rest_framework as filters
from django_filters.rest_framework import DjangoFilterBackend
from loguru import logger
from rest_framework import mixins, status
from django_filters import rest_framework as filtersj
from rest_framework.filters import SearchFilter
from rest_framework.generics import (
    ListAPIView,
    RetrieveAPIView,
    RetrieveDestroyAPIView,
    RetrieveUpdateDestroyAPIView,
)
from rest_framework.permissions import (
    AllowAny,
    IsAuthenticated,
    IsAuthenticatedOrReadOnly,
)
from rest_framework.response import Response

from . import serializers


class Cart(RetrieveUpdateDestroyAPIView):
    queryset = Cart.objects.all()
    serializer_class = serializers.CartSerializer
    permission_classes = IsAuthenticated

    def get_queryset(self):
        return Response(
            Cart.object.all()
            .filter(user=self.request.user)
            .select_related("menuitems"),
            status=status.HTTP_200_OK,
        )

    def put(self, request):
        serializer = serializers.CartSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def delete(self):
        pass


class MenuItemsFilter(filters.FilterSet):
    class Meta:
        model = MenuItems
        fields = (
            "price",
            "category",
            "featured",
        )


class MenuItem(RetrieveAPIView, mixins.UpdateModelMixin, mixins.DestroyModelMixin):
    queryset = MenuItems.objects.all()
    lookup_field = "id"
    serializer_class = serializers.MenuItemSerializer
    permission_classes = (IsAuthenticated,)

    def put(self, request, *args, **kwargs):
        if request.user.groups.filter(name="Manager").exists():
            partial = kwargs.pop('partial', False)
            instance = self.get_object()
            serializer = self.get_serializer(instance, data=request.data, partial=partial)
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

class MenuItems(ListAPIView, mixins.CreateModelMixin):
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


class CategoryView(ListAPIView):
    queryset = Category.objects.all()
    serializer_class = serializers.CategorySerializer
