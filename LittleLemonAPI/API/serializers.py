from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from django.contrib.auth.password_validation import validate_password
from .models import Cart, Category, MenuItems, Order, OrderItem, User
from django.db import IntegrityError
from loguru import logger
import pendulum


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ("id", "title")
        


class MenuItemSerializer(serializers.ModelSerializer):
    category = CategorySerializer()

    class Meta:
        model = MenuItems
        fields = ("title", "price", "featured", "category")

    def save(self, validated_data):
        logger.debug(validated_data)
        try:
            new_items = MenuItems(
                title=self.validated_data["title"],
                price=self.validated_data["price"],
                featured=self.validated_data["featured"],
                category=Category(
                    title=self.validated_data["category"]["title"],
                ),
            )
            new_items.category.save()
            new_items.save()
            return new_items
        except IntegrityError as e:
            raise serializers.ValidationError({"errors": str(e)})

    def update(self, instance, validated_data):
        instance.title = validated_data.get("title", instance.title)
        instance.price = validated_data.get("price", instance.price)
        instance.featured = validated_data.get("featured", instance.featured)
        instance.category = validated_data.get("category", instance.category)
        instance.save()
        return instance


class CartSerializer(serializers.ModelSerializer):
    user = serializers.StringRelatedField()
    menuitems = serializers.StringRelatedField(many=True)
    quantity = serializers.IntegerField(max_value=1)
    unit_price = serializers.DecimalField(max_digits=6, decimal_places=2)
    price = serializers.SerializerMethodField("get_price")

    def get_price(self, obj):
        return obj.quantity * obj.unit_price

    class Meta:
        model = Cart
        fields = ("user" "menuitems", "quantity", "unit_price", "get_price")


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


