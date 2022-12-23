from django.conf.urls import url, include
from django.contrib import admin, auth
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from klee_web import urls

urlpatterns = [
    url(r'^api/', include(urls)),
    url(r'^api/', include(urls.router.urls)),
    # url(r'^klee_web/', include(klee_web.urls.file_router.urls)),
    url(r'^admin/', admin.site.urls),
    # url(r'^manage/', include('control_panel.urls',
    # namespace="control_panel")),
    url(r'^accounts/login/$', auth.views.LoginView,
        {'template_name': 'control_panel/login.html'}),
    url(r'^soc/', include('rest_framework_social_oauth2.urls')),
    url(r'^', include('klee_web.frontend_urls'))
]

urlpatterns += staticfiles_urlpatterns()
