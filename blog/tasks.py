from celery import shared_task
from .models import Post

@shared_task
def write_post(title, content, pub_date):
    """
    Write a post entry to the database
    """
    print('Save Post!1111')
    post = Post(title=title, content=content, pub_date=pub_date, user_id=1)
    post.save()
    print('Save Post')