from django.apps import apps
from django.contrib import admin
from django.apps import apps
from API.models import Cart, MenuItems, LittleLemoner, OrderItem, Order

all_models = [Cart, MenuItems, LittleLemoner, OrderItem, Order]

for model in all_models:
    try:
        admin.site.register(model)
    except admin.sites.AlreadyRegistered:
        pass
