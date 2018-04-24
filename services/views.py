from django.shortcuts import render
from django.conf.urls import url, include
from django.contrib.auth.models import User, Group
from django.http import Http404
from blog.models import Post, Comment
from snippets.models import Snippet
from rest_framework import viewsets, status
from rest_framework.views import APIView
from rest_framework import generics
from .serializers import (snippet,
                         post,
                         comment,
                         user)



class SnippetViewSet(viewsets.ModelViewSet):
    queryset = Snippet.objects.all()
    serializer_class = snippet.SnippetSerializer


# class SnippetList(APIView):
#     """
#     List all snippets, or create a new snippet.
#     """
#     def get(self, request, format=None):
#         snippets = Snippet.objects.all()
#         serializer = snippet.SnippetSerializer(snippets, many=True)
#         return Response(serializer.data)

#     def post(self, request, format=None):
#         serializer = snippet.SnippetSerializer(data=request.data)
#         if serializer.is_valid():
#             serializer.save()
#             return Response(serializer.data, status=status.HTTP_201_CREATED)
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class PostViewSet(viewsets.ModelViewSet):
    queryset = Post.objects.all()
    serializer_class = post.PostSerializer


class CommentViewSet(viewsets.ModelViewSet):
    queryset = Comment.objects.all()
    serializer_class = comment.CommentSerializer

class UserList(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = user.UserSerializer


class UserDetail(generics.RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = user.UserSerializer