from django.shortcuts import render
from django.http import request
def welcome_page(request):
    return render(request, "welcome.html", {}  )