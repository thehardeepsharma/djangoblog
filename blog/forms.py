from django import forms

from .models import Post, Comment

class PostForm(forms.ModelForm):

    class Meta:
        model  = Post
        fields = ('user','title','content')
        
    def __init__(self, *args, **kwargs):
        super(PostForm, self).__init__(*args, **kwargs)
        self.fields['user'].widget.attrs\
            .update({
                'placeholder': 'Author Name',
                'class': 'form-control'
            })
        self.fields['title'].widget.attrs\
            .update({
                'placeholder': 'Post Title',
                'class': 'form-control'
            })
        self.fields['content'].widget.attrs\
            .update({
                'placeholder': 'Post Content',
                'class': 'form-control'
            })
        
class CommentForm(forms.ModelForm):

    class Meta:
        model  = Comment
        fields = ('comment_author','comment')
        
    def __init__(self, *args, **kwargs):
        super(CommentForm, self).__init__(*args, **kwargs)
        self.fields['comment_author'].widget.attrs\
            .update({
                'placeholder': 'Author Name',
                'class': 'form-control'
            })
        self.fields['comment'].widget.attrs\
            .update({
                'placeholder': 'Comment',
                'class': 'form-control'
            })