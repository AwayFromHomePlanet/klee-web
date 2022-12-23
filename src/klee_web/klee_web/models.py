from django.contrib.auth.models import AbstractUser
from django.contrib.postgres.fields import JSONField
from django.db import models


class User(AbstractUser):
    scores = JSONField()
    assignment_scores = JSONField()


class Task(models.Model):
    task_id = models.CharField(max_length=255, unique=True)
    ip_address = models.GenericIPAddressField()
    email_address = models.EmailField(null=True)
    created_at = models.DateTimeField(auto_created=True)
    completed_at = models.DateTimeField(null=True)
    current_output = models.TextField(null=True)
    worker_name = models.CharField(max_length=255, default='')
    location = models.CharField(max_length=255, default='None')
    user = models.CharField(max_length=255, default='Guest')


class Category(models.Model):
    name = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    description = models.TextField()
    nr_problems = models.IntegerField(default=0)

    def __unicode__(self):
        return self.name


class Challenge(models.Model):
    name = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    tags = JSONField()
    statement = models.TextField()
    input = models.TextField()
    output = models.TextField()
    difficulty = models.TextField()
    restrictions = models.TextField()
    sample_solution = models.TextField()

    def __unicode__(self):
        return self.name


class Classroom(models.Model):
    name = models.TextField()
    created = models.DateTimeField(auto_now_add=True)
    teacher_id = models.ForeignKey(User, db_column='teacher_id',
                                   on_delete=models.CASCADE)
    teacher_img = models.URLField()
    nr_of_members = models.IntegerField()  # number of students in class
    members = JSONField()  # list of all students in the class
    assignments = JSONField()
    announcements = JSONField()

    def __unicode__(self):
        return self.name


class Submission(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    challenge = models.ForeignKey(Challenge, on_delete=models.CASCADE)
    correct = models.BooleanField()


class File(models.Model):
    # project = models.ForeignKey(Project, on_delete=models.CASCADE)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    name = models.TextField()
    code = models.TextField()

    num_files = models.IntegerField(default=0)
    size_files = models.IntegerField(default=0)

    size_sym_in = models.IntegerField(default=0)

    min_sym_args = models.IntegerField(default=0)
    max_sym_args = models.IntegerField(default=0)
    size_sym_args = models.IntegerField(default=0)

    options = models.TextField(null=True)
    arguments = models.TextField(null=True)

    last_modified = models.DateTimeField(auto_now=True)

    def __unicode__(self):
        return self.name
