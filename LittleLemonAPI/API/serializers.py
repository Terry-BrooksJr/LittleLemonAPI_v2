from rest_framework import serializers
from rest_framework.validators import UniqueValidator
from django.contrib.auth.password_validation import validate_password
from .models import Cart, Category, MenuItems, Order, OrderItem, User
import pendulum

class CategtorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ("slug", "title")


class MenuItemSerializer(serializers.ModelSerializer):
    category = serializers.StringRelatedField()

    class Meta:
        model = MenuItems
        fields = ("title", "price", "featured", "category")


class CartSerializer(serializers.ModelSerializer):
    user = serializers.StringRelatedField()
    menuitems = serializers.StringRelatedField(many=True)
    quantity = serializers.IntegerField(max_value=1)
    unit_price = serializers.DecimalField(max_digits=6, decimal_places=2)
    price = serializers.SerializerMethodField('get_price')

    def get_price(self, obj):
        return obj.quantity * obj.unit_price

    class Meta:
        model = Cart
        fields = ("user" "menuitems","quantity","unit_price", "get_price")

    
class OrderSerializer(serializers.ModelSerializer):
    user = serializers.StringRelatedField()
    delivery_crew = serializers.StringRelatedField()
   
    class Meta:
        model = Order
        fields = ("user", "delivery_crew", "status", "total", "date" )

#Serializer to Register User
class RegisterSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(
    required=True, validators=[UniqueValidator(queryset=User.objects.all())])
    password = serializers.CharField( write_only=True, required=True, validators=[validate_password])
    username = serializers.CharField(required=True, validators=[UniqueValidator(queryset=User.objects.all())])
    
    class Meta:
        model = User
        fields = ('username', 'password',
            'email')

    def create(self, validated_data):
        user = User.objects.create(
        username=validated_data['username'],
        email=validated_data['email'],
        is_superuser=False,
        is_active=True,
        is_staff=False,
        date_joined=pendulum.now()
        )
        user.set_password(validated_data['password'])
        return user



class OrderItemSerializer(serializers.ModelSerializer):
    order = serializers.StringRelatedField()
    menuitem = serializers.StringRelatedField(many=True)
    price = serializers.SerializerMethodField('get_price')

    def get_price(self, obj):
        return obj.quantity * obj.unit_price
    class Meta:
        model = OrderItem
        fields = ("order", "menuitem", "quantity", "unit_price","get_price" )
