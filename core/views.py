from django.shortcuts import render

# Create your views here.

def index(request):
    return render(request, 'index.html')  # Eğer index.html farklı bir klasördeyse, yolu düzenleyin
