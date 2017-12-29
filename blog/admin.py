from django.contrib import admin
from .models import Post, Comment

class PostAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,            {'fields': ['user','title','content']}),
        ('Date information', {'fields': ['pub_date']}),
    ]
    list_display = ('title', 'pub_date')
    list_filter = ['pub_date']
    search_fields = ['title']
    
class CommentAdmin(admin.ModelAdmin):
    fieldsets = [
        (None,            {'fields': ['post','comment_author','comment']}),
        ('Date information', {'fields': ['comment_date']}),
    ]
    list_display = ('post','comment_author', 'comment')
    list_filter = ['comment_date']
    search_fields = ['comment']    
    
admin.site.register(Comment, CommentAdmin)
admin.site.register(Post, PostAdmin)
    
