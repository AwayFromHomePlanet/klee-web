from django.contrib import admin

from .models import Task, Category, Challenge, File

admin.site.register(Task)
admin.site.register(Category)
admin.site.register(Challenge)
admin.site.register(File)
