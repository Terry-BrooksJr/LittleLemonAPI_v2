from rest_framework import serializers

from .models import Cart, Category, MenuItems, Order, OrderItem


class MenuItemSerializer(serializers.ModelSerializer):
    category = serializers.StringRelatedField()

    class Meta:
        model = MenuItems
        fields = [field.name for field in model._meta.fields]


class OrderSerializer(serializers.ModelSerializer):
    user = serializers.StringRelatedField()
    category = serializers.StringRelatedField()
    delivery_crew = serializers.StringRelatedField()

    class Meta:
        model = Order
        fields = [field.name for field in model._meta.fields]


class CartSerializer(serializers.ModelSerializer):
    user = serializers.StringRelatedField()
    menuitems = serializers.StringRelatedField()
    quantity = serializers.SmallIntegerField(max_value=1)
    unit_price = serializers.DecimalField(max_digits=6, decimal_places=2)
    price = quantity * unit_price   
    class Meta:
        model = Cart
        fields = [field.name for field in model._meta.fields]


class CategtorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = [field.name for field in model._meta.fields]


class OrderItemSerializer(serializers.ModelSerializer):
    order = serializers.StringRelatedField()
    menuitem = serializers.StringRelatedField()

    class Meta:
        model = OrderItem
        fields = [field.name for field in model._meta.fields]
