from django.apps import apps
from django.contrib import admin
from django.apps import apps
from API.models import Cart, Category, MenuItems, User, OrderItem,Order 

all_models = [Cart, Category, MenuItems, User, OrderItem,Order]

for model in all_models:
    try:
        admin.site.register(model)
    except admin.sites.AlreadyRegistered:
        pass
