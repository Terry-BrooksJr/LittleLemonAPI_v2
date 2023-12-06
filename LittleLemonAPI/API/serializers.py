"""
Module Docstring: API Serializers

This module contains the serializers for the API models including Category, MenuItems, LittleLemoner, Cart, Order, and OrderItem.

Classes:
- MenuItemSerializer
- ManagerSerializer
- CartSerializer
- OrderSerializer
- OrderItemSerializer

Each serializer class is responsible for serializing and deserializing the corresponding model data for use in the API.

Usage:
To use these serializers, import them into your views or viewsets and use them to serialize and deserialize data for the API endpoints.
"""
from rest_framework import serializers
from drf_writable_nested.serializers import WritableNestedModelSerializer
from rest_framework.validators import UniqueValidator
from django.contrib.auth.password_validation import validate_password
from API.models import Cart, MenuItems, Order, OrderItem, LittleLemoner
from django.db import IntegrityError
from loguru import logger

CATEGORY = ((2, "Dessert"), (3, "Entree"), (4, "Drink"), (5, "Side Order"))


class MenuItemSerializer(serializers.ModelSerializer):
    category = serializers.SerializerMethodField()

    class Meta:
        model = MenuItems
        fields = ("id", "title", "price", "featured", "category")

    def update(self, instance, validated_data):
        instance.title = validated_data.get("title", instance.title)
        instance.price = validated_data.get("price", instance.price)
        instance.featured = validated_data.get("featured", instance.featured)
        instance.category = validated_data.get("catagory", instance.catagory)
        instance.category.save()
        instance.save()
        return instance

    def get_category(self, obj):
        return obj.get_category_display()


class ManagerSerializer(serializers.ModelSerializer):
    class Meta:
        model = LittleLemoner
        fields = "__all__"


class CartSerializer(serializers.ModelSerializer):
    user_id = ManagerSerializer(read_only=True)
    menuitems = MenuItemSerializer(read_only=True)
    quantity = serializers.IntegerField(max_value=1)
    unit_price = serializers.HiddenField(default=None)
    price = serializers.HiddenField(default=None)

    class Meta:
        model = Cart
        fields = ("user" "menuitems", "quantity", "price", "unit_price")


class OrderSerializer(serializers.ModelSerializer):
    user = serializers.StringRelatedField()
    delivery_crew = serializers.StringRelatedField()

    class Meta:
        model = Order
        fields = ("user", "delivery_crew", "status", "total", "date")


class OrderItemSerializer(serializers.ModelSerializer):
    order = serializers.StringRelatedField()
    menuitem = serializers.StringRelatedField(many=True)
    price = serializers.SerializerMethodField("get_price")

    def get_price(self, obj):
        return obj.quantity * obj.unit_price

    class Meta:
        model = OrderItem
        fields = ("order", "menuitem", "quantity", "unit_price", "get_price")


class OrderSerializer(serializers.ModelSerializer):
    user = serializers.StringRelatedField()
    category = serializers.StringRelatedField()
    delivery_crew = serializers.StringRelatedField()

    class Meta:
        model = Order
        fields = [field.name for field in model._meta.fields]


class CartSerializer(serializers.ModelSerializer):
    user = serializers.StringRelatedField()

    class Meta:
        model = Cart
        fields = [field.name for field in model._meta.fields]


class OrderItemSerializer(serializers.ModelSerializer):
    order = serializers.StringRelatedField()
    menuitem = serializers.StringRelatedField()

    class Meta:
        model = OrderItem
        fields = [field.name for field in model._meta.fields]
