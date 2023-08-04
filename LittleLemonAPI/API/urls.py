from rest_framework.routers import DefaultRouter
from django.urls import include, path
from . import views
from django.shortcuts import redirect, reverse
from django.http import request


app_name = "api"


urlpatterns = [
    path("cart/menu-items/", views.CartView.as_view()),
    path("menu-items/<int:id>", views.MenuItemView.as_view()),
    path("menu-items/", views.MenuItemsView.as_view(), name="menu-items"),
    path("category/", views.CategoryView.as_view()),
    path('groups/manager/users', views.Managers.as_view()),
    path('groups/manager/users/<int:id>', views.delete_manager),
    path('groups/delivery-crew/users', views.DeliveryCrew.as_view()),
    path('orders/', views.OrdersViews.as_view()),
    path('orders/<int:id>', views.OrderView.as_view()),

]
