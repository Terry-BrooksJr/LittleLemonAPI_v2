import json

import django_filters
from API.models import Cart, Category, MenuItems
from API.permissions import _has_group_permission, _is_in_group
from API.utils import process_menu_item_update
from django.contrib.auth.models import Group, User
from django.core.serializers import serialize
from django.http import JsonResponse, request
from django.shortcuts import get_object_or_404
from django_filters import rest_framework as filters
from django_filters import rest_framework as filtersj
from django_filters.rest_framework import DjangoFilterBackend
from loguru import logger
from rest_framework import mixins, status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.filters import SearchFilter
from rest_framework.generics import (GenericAPIView, ListAPIView,
                                     RetrieveAPIView, RetrieveDestroyAPIView,
                                     RetrieveUpdateDestroyAPIView)
from rest_framework.permissions import (AllowAny, IsAdminUser, IsAuthenticated,
                                        IsAuthenticatedOrReadOnly)
from rest_framework.response import Response

from . import serializers
from furl import furl


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


# def create_managers(request):
#     username = request.data['username']
#     if username: 
#         user = get_object_or_404(User, username=username)
#         managers = Group.objects.get(name="Manager")
#         managers.user_set.add(user)
#         return Response({"Status":"User Added to Manager's Group"}, status.HTTP_201_CREATED)

#     return Response({"ERROR": "Unable to Add User"}, status.HTTP_400_BAD_REQUEST)


class Managers(GenericAPIView, mixins.ListModelMixin):
    permission_classes = (IsAdminUser,)
    lookup_field = "username"
    queryset = User.objects.filter(groups__name='Manager')
    serializer_class = serializers.ManagerSeralizer
    
    def post(self, request): 
        username = request.data['username']
        if username: 
            user = get_object_or_404(User, username=username)
            managers = Group.objects.get(name="Manager")
            managers.user_set.add(user)
            return Response({"Status":"User Added to Manager's Group"}, status.HTTP_201_CREATED)
        else:
            return Response({"ERROR": "Unable to Add - User Not FDound"}, status.HTTP_404_NOT_FOUND)
    
    def get(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

@api_view(['DELETE'])
@permission_classes([IsAdminUser])  
def delete_manager(request, *args, **kwargs):
    user_id = furl(request.build_absolute_uri()).path.segments[-1]
    logger.debug(user_id)
    user = get_object_or_404(User, id=user_id)
    if user:
        managers = Group.objects.get(name="Manager")
        managers.user_set.remove(user)
        return Response({"Status":"User Removed From Manager's Group"}, status.HTTP_201_CREATED)
    else:
        return Response({"ERROR": "Unable From Remove - User Not Found"}, status.HTTP_404_NOT_FOUND)


class DeliveryCrew(GenericAPIView, mixins.ListModelMixin):
    permission_classes = (IsAdminUser,)
    lookup_field = "username"
    queryset = User.objects.filter(groups__name='Delivery Crew')
    serializer_class = serializers.ManagerSeralizer
    
    def post(self, request): 
        username = request.data['username']
        if username: 
            user = get_object_or_404(User, username=username)
            managers = Group.objects.get(name="Delivery Crew")
            managers.user_set.add(user)
            return Response({"Status":"User Added to Delivery Crew Group"}, status.HTTP_201_CREATED)
        else:
            return Response({"ERROR": "Unable to Add - User Not FDound"}, status.HTTP_404_NOT_FOUND)
    
    def get(self, request, *args, **kwargs):
        queryset = self.filter_queryset(self.get_queryset())

        page = self.paginate_queryset(queryset)
        if page is not None:
            serializer = self.get_serializer(page, many=True)
            return self.get_paginated_response(serializer.data)

        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)
    
@api_view(['DELETE'])
@permission_classes([IsAdminUser])  
def delete_delivery(request, *args, **kwargs):
    user_id = furl(request.build_absolute_uri()).path.segments[-1]
    logger.debug(user_id)
    user = get_object_or_404(User, id=user_id)
    if user:
        managers = Group.objects.get(name="Delivery Crew")
        managers.user_set.remove(user)
        return Response({"Status":"User Removed From Delivery Crew Group"}, status.HTTP_201_CREATED)
    else:
        return Response({"ERROR": "Unable From Remove - User Not Found"}, status.HTTP_404_NOT_FOUND)
    

class CartViews(RetrieveUpdateDestroyAPIView):
    queryset = Cart.objects.all()
    lookup_field = "id"
    serializer_class = serializers.CartSerializer
    permission_classes = (IsAuthenticated,)