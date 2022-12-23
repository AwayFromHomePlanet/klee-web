from django.conf.urls import url
from django.contrib.auth import views as auth_views
from django.urls import path, include
from klee_web import views
from rest_framework.routers import DefaultRouter

router = DefaultRouter()

router.register(r'categories', views.CategoryViewSet, basename="category")
router.register(r'challenges', views.ChallengeViewSet)
router.register(r'classrooms', views.ClassroomViewSet, basename="classroom")
router.register(r'run', views.RunViewSet, basename='run')

urlpatterns = [
    # Homepage
    url(r'^$', views.index, name='index'),

    # Router handles ViewSet URL configuration (categories & classrooms).
    path("", include(router.urls)),

    # Web hooks
    url(r'^run/notify/$', views.jobs_notify, name='jobs_notify'),
    # Callback URL for KLEE workers
    url(r'^run/status/([a-z0-9-]+)/$', views.jobs_status, name='jobs_status'),
    # Status of current KLEE job
    url(r'^run/dl/([a-z0-9-]+)\.tar\.gz', views.jobs_dl, name='jobs_dl'),
    # Downloads tests?

    url(r'^category/(?P<cat_name>[a-z_]*)/$', views.filter_challenges,
        name='filter_challenges'),

    # TODO: Are we keeping the specific challenge endpoint?
    url(r'^challenge/(?P<chall_name>[a-z_]+)/$', views.get_challenge,
        name='get_challenge'),

    # User account
    url(r'^api/user/login/$', views.login, name='login'),
    url(r'^api/user/settings/$', views.settings, name='settings'),
    url(r'^api/user/register/$', views.register, name="register"),
    url(r'^api/user/logout/$', auth_views.LogoutView.as_view(), name='logout')
]
