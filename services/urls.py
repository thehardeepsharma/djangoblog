from django.conf.urls import url, include
from rest_framework import routers
from .views import (SnippetViewSet,
					PostViewSet,
					CommentViewSet,
					UserList,
					UserDetail)

router = routers.DefaultRouter()
router.register(r'snippet', SnippetViewSet)
router.register(r'post', PostViewSet)
router.register(r'comment', CommentViewSet)

# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.
urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^users/$', UserList.as_view()),
	url(r'^users/(?P<pk>[0-9]+)/$', UserDetail.as_view()),
]