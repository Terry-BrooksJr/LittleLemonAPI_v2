from rest_framework.routers import DefaultRouter
from django.urls import include, path
from . import views

app_name = "api"


urlpatterns = [
    path("cart/menu-items/", views.Cart.as_view()),
    path("users/", views.RegisterUserAPIView.as_view()),
    path('menu-items/<int:id>',views.MenuItem.as_view()),
    path('menu-items/', views.MenuItems.as_view()),

]