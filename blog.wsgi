import os
import sys
from django.core.handlers.wsgi import WSGIHandler

os.environ['DJANGO_SETTINGS_MODULE'] = 'blog.blog_settings'
application = WSGIHandler()