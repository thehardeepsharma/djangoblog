from django.db import models
from django.contrib.auth.models import User

class Post(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    content = models.TextField()    
    pub_date = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.title
        
class Comment(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    comment_author = models.CharField(max_length=100)
    comment = models.TextField()
    comment_date = models.DateTimeField(auto_now=True)
