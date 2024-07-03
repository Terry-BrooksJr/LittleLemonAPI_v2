from API.models import Cart, LittleLemoner, MenuItems, Order, OrderItem
from django.contrib import admin

all_models = [Cart, MenuItems, LittleLemoner, OrderItem, Order]

for model in all_models:
    try:
        admin.site.register(model)
    except admin.sites.AlreadyRegistered:
        pass
