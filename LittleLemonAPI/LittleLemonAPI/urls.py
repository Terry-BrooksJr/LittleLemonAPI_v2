"""
URL configuration for LittleLemonAPI project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from API import urls
from django.contrib import admin
from django.urls import include, path
from django.shortcuts import redirect, reverse
from django.http import request
from API import views
from LittleLemonAPI.views import welcome_page

urlpatterns = [
    path("admin/", admin.site.urls),
    path("__debug__/", include("debug_toolbar.urls")),
    path("", include("djoser.urls.authtoken")),
    path("api/", include("djoser.urls")),
    path("api/", include("API.urls")),
    path("", welcome_page),
]
