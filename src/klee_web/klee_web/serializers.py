from rest_framework.generics import get_object_or_404
from rest_framework.serializers import ModelSerializer, \
    SerializerMethodField, Field

from .models import User, Challenge, Classroom, Category


class CategorySerializer(ModelSerializer):
    score = SerializerMethodField()
    user_scores = get_object_or_404(User, pk=1).scores

    class Meta:
        model = Category
        fields = [field.name for field in model._meta.fields]
        fields.append('score')

    def get_score(self, obj):
        completed = len(
            {(n, c) for (n, c) in self.user_scores[obj.name].items() if
             c == 1})
        return completed


class ChallengeSerializer(ModelSerializer):
    completed = SerializerMethodField()
    user_scores = get_object_or_404(User, pk=1).scores

    class Meta:
        model = Challenge
        fields = [field.name for field in model._meta.fields]
        fields.append('completed')

    def get_completed(self, obj):
        return self.user_scores[obj.category.name][obj.name]


class ClassroomSerializer(ModelSerializer):
    due = SerializerMethodField()
    cws_due = get_object_or_404(User, pk=1).assignment_scores

    class Meta:
        model = Classroom
        fields = ['name', 'description', 'teacher_name', 'teacher_img',
                  'nr_of_members', 'due_coursework']

    def get_due(self, obj):
        due = len(
            {(n, c) for (n, c) in self.cws_due[obj.name].items() if c == 1})
        return due


class RunConfigurationField(Field):
    def get_attribute(self, obj):
        return obj

    def to_representation(self, obj):
        return {
            'sym_args': {
                'range': [obj.min_sym_args, obj.max_sym_args],
                'size': obj.size_sym_args
            },
            'sym_files': {
                'size': obj.size_files,
                'num': obj.num_files
            },
            'sym_in': {
                'size': obj.size_sym_in,
            },
            'options': obj.options,
            'arguments': obj.arguments
        }

    def to_internal_value(self, data):
        return {
            'size_files': data['sym_files']['size'],
            'num_files': data['sym_files']['num'],
            'size_sym_in': data['sym_in']['size'],
            'min_sym_args': data['sym_args']['range'][0],
            'max_sym_args': data['sym_args']['range'][1],
            'size_sym_args': data['sym_args']['size'],
            'options': data['options'],
            'arguments': data['arguments'],
        }


"""
class FileSerializer(HyperlinkedModelSerializer):
    run_configuration = RunConfigurationField()
    project_id = PrimaryKeyRelatedField(read_only=True)

    def create(self, validated_data):
        # Hack to unpack run configuration to fields in the model
        validated_data.update(validated_data['run_configuration'])
        del validated_data['run_configuration']

        return super(FileSerializer, self).create(validated_data)

    def update(self, instance, validated_data):
        validated_data.update(validated_data['run_configuration'])
        del validated_data['run_configuration']

        return super(FileSerializer, self).update(instance, validated_data)

    class Meta:
        model = File
        fields = ('id', 'name', 'code', 'run_configuration', 'project_id')
"""
