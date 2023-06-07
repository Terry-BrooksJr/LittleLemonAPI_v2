from rest_framework.routers import DefaultRouter
from django.urls import include, path

from . import views

app_name = "api"
router = DefaultRouter(trailing_slash=False)


urlpatterns = [
    path("cart/menu-items/", views.Cart.as_view())
]
