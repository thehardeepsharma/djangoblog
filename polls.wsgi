import os
import sys
from django.core.handlers.wsgi import WSGIHandler

os.environ['DJANGO_SETTINGS_MODULE'] = 'polls.polls_settings'
application = WSGIHandler()