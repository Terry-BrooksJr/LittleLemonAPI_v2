import json

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
from rest_framework.filters import SearchFilter
from rest_framework.generics import (ListAPIView, RetrieveDestroyAPIView,
                                     RetrieveUpdateDestroyAPIView, RetrieveAPIView)
from rest_framework.permissions import (AllowAny, IsAuthenticated,
                                        IsAuthenticatedOrReadOnly)
from rest_framework.response import Response

from . import serializers


# Create your views here.
class Cart(RetrieveUpdateDestroyAPIView):
    queryset = Cart.objects.all()
    serializer_class = serializers.CartSerializer
    permission_classes = (IsAuthenticated)

    def get_queryset(self):
        return Response(
            Cart.object.all()
            .filter(user=self.request.user)
            .select_related("menuitems"), status=status.HTTP_200_OK
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

class MenuItem(RetrieveAPIView, mixins.UpdateModelMixin):
    queryset = MenuItems.objects.all()
    serializer_class = serializers.MenuItemSerializer
    permission_classes = (IsAuthenticatedOrReadOnly,)
    lookup_field = "id"
    # search_fields = ("category")



    # def post(self, request, *args, **kwargs):
    #     if _is_in_group(request.user, 'Manager'):
    #         body = json.loads(request.body.decode('utf-8'))
    #         logger.debug(body)
    #         logger.debug(request.user)
    #         return process_menu_item_update(self.body, self.serializer_class)
            
    #     else:
    #         logger.warning(request.user)
    #         raise Response(status=status.HTTP_403_FORBIDDEN)
    def put(self, request, *args, **kwargs):
        if _is_in_group(request.user, 'Manager'):
            partial = kwargs.pop('partial', False)
            instance = self.get_object()
            serializer = self.get_serializer(instance, data=request.data, partial=partial)
            serializer.is_valid(raise_exception=True)
            self.perform_update(serializer)
            return Response(serializer.data,status=204)
        else:
            return Response(status=status.HTTP_403_FORBIDDEN)



class MenuItems(ListAPIView):
    queryset = MenuItems.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = serializers.MenuItemSerializer
    filter_backends = (DjangoFilterBackend, SearchFilter)
    search_fields = ("title")
    filter_class = MenuItemsFilter

    ordering_fields = (
        'category',
        'title'
    )

    def post(self, request, *args, **kwargs):
        if _is_in_group(request.user, 'Manager'):
            body = json.loads(request.body.decode('utf-8'))
            logger.debug(body)
            logger.debug(request.user)
            return process_menu_item_update(body, self.serializer_class)
            
        else:
            logger.warning(request.user)
            return Response(status=status.HTTP_403_FORBIDDEN)
        
class CategoryView(ListAPIView):
     queryset = Category.objects.all()
     serializer_class = serializers.CategorySerializer
    