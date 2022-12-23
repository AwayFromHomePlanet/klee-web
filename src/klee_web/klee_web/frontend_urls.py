from django.conf.urls import url
from rest_framework.routers import DefaultRouter

from . import views

router = DefaultRouter()

urlpatterns = [
    url(r'^', views.index, name='index'),

    url(r'^categories/(?P<cat_name>[a-z_]*)/$', views.index,
        name='filter_challenges'),
    url(r'^challenges/(?P<chall_name>[a-z_]+)/$', views.index,
        name='get_challenge'),
    url(r'^classrooms/(?P<class_name>[a-z_]+)/$', views.index,
        name='get_classroom'),

    # User account
    url(r'^login/$', views.index, name='login'),
    url(r'^settings/$', views.index, name='settings'),
    url(r'^register/$', views.index, name="register"),
    url(r'^logout/$', views.index, name='logout')
]
