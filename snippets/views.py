from django.shortcuts import render
from .serializers import SnippetSerializer
from .models import Snippet
from rest_framework import viewsets

class SnippetViewSet(viewsets.ModelViewSet):
    queryset = Snippet.objects.all()
    serializer_class = SnippetSerializer
