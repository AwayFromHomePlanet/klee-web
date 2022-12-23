import datetime
import json
import os

from api.permissions import IsInClass
from django.contrib import messages, auth
from django.contrib.auth.decorators import login_required
from django.forms.utils import ErrorList
from django.http import HttpResponse, HttpResponseNotFound
from django.shortcuts import render, redirect
from django.urls import reverse
from django.views.decorators.csrf import csrf_exempt, ensure_csrf_cookie
from django.views.static import serve
from rest_framework import viewsets
from rest_framework.decorators import api_view, list_route
from rest_framework.generics import get_object_or_404
# from djangorestframework_camel_case.parser import CamelCaseJSONParser
from rest_framework.response import Response

from .forms import SubmitJobForm, UserCreationForm, UserChangePasswordForm
from .models import Task
from .serializers import ClassroomSerializer, Category, Challenge, Classroom, \
    ChallengeSerializer, CategorySerializer


# from worker.worker import submit_code
# from worker.worker_config import WorkerConfig


class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer
    http_method_names = ['get']

    # Category instances are specified by their name.
    # e.g. "basic_problems"
    lookup_field = "name"

    def retrieve(self, request, *args, **kwargs):
        cat_name = kwargs.get("name", None)
        cat = Category.objects.get(name=cat_name)
        filtered_challenges = Challenge.objects.filter(category=cat)
        filt_chall_json = ChallengeSerializer(filtered_challenges, many=True)
        return Response(filt_chall_json.data)

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


class ChallengeViewSet(viewsets.ModelViewSet):
    queryset = Challenge.objects.all()
    serializer_class = ChallengeSerializer
    http_method_names = ['get']

    lookup_field = "name"


class ClassroomViewSet(viewsets.ModelViewSet):
    permission_classes = (IsInClass,)
    queryset = Classroom.objects.all()
    serializer_class = ClassroomSerializer

    # TODO: Calculate due coursework for specific instance views.
    # def list(self, request):
    #     serializer = ClassroomSerializer(self.queryset, many=True)
    #     user = get_object_or_404(User, pk=1)
    #     print(serializer.data)

    #     for i in range(len(serializer.data)):
    #         assignments = json.load(serializer.data[i].assignments)
    #         serializer.data[i].pop('assignments')
    #         serializer.data[i].pop('announcements')
    #         serializer.data[i]['due_coursework'] = len(assignments)

    #     return Response(serializer.data)


"""
class ChallengeViewSet(viewsets.ViewSet):
    permission_classes = (IsAuthenticatedOrReadOnly, )
    parser_classes = (MultiPartParser, FormParser)
    queryset = File.objects.all()
    serializer_class = FileSerializer

    def list(self, request, project_pk=None):
        files = self.queryset.filter(project=project_pk)
        serializer = FileSerializer(files,
                                    many=True,
                                    context={"request": request})
        return Response(serializer.data)

    def create(self, request, project_pk=None):
        project = get_object_or_404(Project, pk=project_pk, owner=request.user)

        serializer = FileSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save(project=project)
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    def update(self, request, pk=None, project_pk=None):
        project = get_object_or_404(Project, pk=project_pk, owner=request.user)
        instance = File.objects.get(pk=pk, project=project)
        serializer = FileSerializer(instance, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

    def delete(self, request, pk=None, project_pk=None):
        project = get_object_or_404(Project, pk=project_pk, owner=request.user)
        instance = File.objects.get(pk=pk, project=project)
        instance.delete()
        return Response("")

    @list_route(methods=['POST'])
    def upload(self, request, project_pk=None):
        project = get_object_or_404(Project, pk=project_pk, owner=request.user)
        f = request.FILES['file']
        uploaded_file = File()
        uploaded_file.project = project
        uploaded_file.name = f.name
        uploaded_file.code = ''.join(f.chunks())
        uploaded_file.save()
        serializer = FileSerializer(uploaded_file)
        return Response(serializer.data)
"""


class RunViewSet(viewsets.ViewSet):
    @list_route(methods=['POST'])
    def submit(self, request):
        # worker_config = WorkerConfig()
        """
        user = 'Guest'
        if request.user.is_authenticated:
            user = request.user
        code = request.data.get("code")
        email = request.data.get("email")
        args = request.data.get("run_configuration", {})

        task = submit_code.apply_async(
            [code,
             email,
             args,
             request.build_absolute_uri(reverse('jobs_notify'))],
            soft_time_limit=600
        )

        Task.objects.create(task_id=task.task_id,
                            email_address=email,
                            ip_address=get_client_ip(request),
                            created_at=datetime.datetime.now(),
                            user=user)
        """

        return Response({'task_id': 'dummy'})


# INPUT: { user }
@api_view(['GET'])
def filter_challenges(request, cat_name):
    if request.method == 'GET':
        print(cat_name)
        cat_id = get_object_or_404(Category, name=cat_name)
        print(cat_name)
        challenges = Challenge.objects.filter(category=cat_id)
        serializer = ChallengeSerializer(challenges, many=True)
        return Response(serializer.data)
    else:
        return HttpResponseNotFound("This page only supports GET")


# INPUT: { user }
@api_view(['GET'])
def get_challenge(request, chall_name):
    if request.method == 'GET':
        challenge = Challenge.objects.get(name=chall_name)
        serializer = ChallengeSerializer(challenge)
        return Response(serializer.data)
    else:
        return HttpResponseNotFound("This page only supports GET")


# INPUT: { user }
@api_view(['GET'])
def get_classroom(request, class_name=None):
    if request.method == 'GET':
        classroom = Classroom.objects.get(name=class_name)
        return Response(classroom)
    else:
        return HttpResponseNotFound("This page only supports GET")


@ensure_csrf_cookie
def index(request):
    return render(request, 'index.html')


def capture_submission(request):
    form = SubmitJobForm()
    return render(request, 'coding.component.html', {'form': form})


def store_data(task, type, data):
    d = {'type': type, 'data': data}
    task.current_output = json.dumps(d)
    task.save()


def jobs_dl(request, file):
    if request.method == 'GET':
        fname = file + '.tar.gz'
        file_path = '/tmp/' + fname
        return serve(request, fname, os.path.dirname(file_path))
    else:
        return HttpResponseNotFound("This page only supports GET")


@csrf_exempt
def jobs_notify(request):
    if request.method == 'POST':
        type = request.POST.get('type')
        channel = request.POST.get('channel')
        task = Task.objects.get(task_id=channel)
        task.worker_name = request.POST.get('worker_name')
        store_data(
            task,
            type,
            request.POST.get('data')
        )
        if type == 'job_complete' or type == 'job_failed':
            """try:
                location = GeoIP.city(task.ip_address)
                task.location = "{0}, {1}".format(location['city'],
                                                  location['country_name'])
            # If the IP is local or we cannot find a match in the database,
            # Just set the location to something
            except:"""
            task.location = 'Non public IP'
            task.completed_at = datetime.datetime.now()

            task.save()
            return HttpResponse('Ok!')
    else:
        return HttpResponseNotFound("This page only supports POST")


def jobs_status(request, channel):
    if request.method == 'GET':
        task = Task.objects.get(task_id=channel)
        return HttpResponse(task.current_output)
    else:
        return HttpResponseNotFound("This page only supports GET")


@ensure_csrf_cookie
def login(request):
    if request.method == 'POST':
        pass

    return render(request, 'index.html')


def register(request):
    if request.method == 'POST':
        user_form = UserCreationForm(request.POST)
        if user_form.is_valid():
            user_form.save()
            user_data = user_form.cleaned_data
            user = auth.authenticate(username=user_data['username'],
                                     password=user_data['password2'])
            auth.login(request, user)
            return redirect(reverse('index'))
    else:
        user_form = UserCreationForm()

    return render(request, 'registration/register.html', {
        'form': user_form,
    })


@login_required
def settings(request):
    if request.method == 'POST':
        user_form = UserChangePasswordForm(request.POST)
        if user_form.is_valid():
            if request.user.check_password(
                    user_form.cleaned_data['old_password']):
                new_password = user_form.cleaned_data['password1']
                request.user.set_password(new_password)
                request.user.save()

                username = request.user.username
                auth.logout(request)
                user = auth.authenticate(username=username,
                                         password=new_password)
                auth.login(request, user)

                messages.success(request, 'Password successfully changed')
            else:
                errors = \
                    user_form._errors.setdefault('old_password', ErrorList())
                errors.append('Incorrect Password')
    else:
        user_form = UserChangePasswordForm()

    return render(request, 'frontend/settings.html', {
        'form': user_form,
    })
