from django.http import request
from django.shortcuts import render


def welcome_page(request):
    return render(request, "welcome.html", {})
