from datetime import datetime as dt
from .utilities import utils
import requests
import json

from rest_framework.permissions import IsAuthenticated
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status

from django.contrib.auth import authenticate
from django.contrib.auth.models import User
# from django.core import serializers
# from django.db import connection
# from django.conf import settings

from .models import Courses, Questions, Exam_Answers, Topics, Exams, User_Courses, User_Answers


class UserAuthentication(APIView):
    def post(self, request):
        '''
        TARGET:
            Auntenticar al usuario administrador y generar un token

        PARAMS: request:
            User
            Password
        '''
        try:

            username, password = request.data.get('username'), request.data.get('password')

            user = authenticate(username=username, password=password)

            if not user:

                return Response({'type': 'error', 'detail': 'invalid user or password'})

            token, created = Token.objects.get_or_create(
                user=user)  # Genera token para el usuario logueado
            return Response({
                'type': 'ok', 
                'detail': {
                    'token': str(token.key), 'id': user.id}})
        
        except Exception as ex:
            return Response({
                'type': 'error', 
                'detail': ex})

class courses(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            title = request.data.get('title')
            duration = request.data.get('duration')
            author = request.data.get('author')
            created_at = request.data.get('created_at')
            updated_at = request.data.get('updated_at')

            if title is None: 
                return Response({
                    'type':'error', 
                    'detail': 'title was not sent'})
            if duration is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'duration was not sent'})
            if author is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'author was not sent'})
            if created_at is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'created_at was not sent'})
            if updated_at is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'updated_at was not sent'})
            
            search = Courses.objects.filter(
                title=title,
                duration=duration,
                author=author)

            if len(search) >= 1:
                return Response({
                    'type': 'error', 
                    'detail': {
                        'message': 'this course exist', 
                        'content': utils.json_serializer(search)}})
            user = User.objects.get(pk=author)
            if not user or user is None or len(user) == 0:
                return Response({
                    'type': 'error', 
                    'detail': 'user or author was not fount'})
            new = Courses(
                title = title, 
                duration = duration, 
                author = user, 
                created_at = created_at, 
                updated_at = updated_at).save()
            return Response({
                'type': 'ok', 
                'detail': {
                    'message': 'New courses created successfully',
                    'content': utils.json_serializer(new)}})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
    def get(self, request):
        try:
            pk = self.request.query_params.get('pk')
            if pk is not None:
                data = Courses.objects.filter(pk = pk)
                if len(data)>=1:
                    return Response({'type': 'ok', 'detail': utils.json_serializer(data)})
                else:
                    return Response({'type': 'ok', 'detail': 'No exist course in the data base with that id'})
            else:
                data = Courses.objects.all()
                return Response({
                    'type': 'ok', 
                    'detail': utils.json_serializer(data)})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})

class questions(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            question = request.data.get('question')
            created_at = request.data.get('created_at')
            updated_at = request.data.get('updated_at')

            if question is None: 
                return Response({
                    'type':'error', 
                    'detail': 'question was not sent'})
            if created_at is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'created_at was not sent'})
            if updated_at is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'updated_at was not sent'})
            
            new = Questions(
                question = question, 
                created_at = created_at, 
                updated_at = updated_at).save()
        
            return Response({
                'type': 'ok', 
                'detail': {
                    'message': 'New question has been created', 
                    'content': utils.json_serializer(new)} })
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})

    def get_object(self, pk):
        try:
            return Questions.objects.get(pk=pk)
        except Questions.DoesNotExist:
            raise "doesn't exist"

    def get(self, request):
        try:
            print('QUERY PARAMS', self.request.query_params)
            exam_id = self.request.query_params.get('exam_id')
            
            if exam_id is not None:
                data = Questions.objects.filter(exam_id = exam_id)
                if len(data)>=1:
                    return Response({'type': 'ok', 'detail': utils.json_serializer(data)})
                else:
                    return Response({'type': 'error', 'detail': 'No exist questions in the data base with that id'}, status = status.HTTP_200_OK)
            else:
                data = Questions.objects.all()
                return Response({
                    'type': 'ok', 
                    'detail': utils.json_serializer(data)})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex}, status = status.HTTP_200_OK)
class exam_answers(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            question_id = request.data.get('question_id')
            answer = request.data.get('answer')
            is_correct = request.data.get('is_correct')
            created_at = request.data.get('created_at')
            updated_at = request.data.get('updated_at')
            if question_id is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'question_id was not sent'})
            if answer is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'answer was not sent' })
            if is_correct is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'is_correct was not sent'})
            if created_at is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'created_at was not sent'})
            if updated_at is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'updated_at was not sent'})
            
            exist_exam_answers = Exam_Answers.objects.get(
                question_id = question_id, 
                answer = answer)

            if len(exist_exam_answers) >= 1:
                return Response({
                    'type': 'error', 
                    'detail':{
                        'message':'this answer option exist for the question that you need', 
                        'content': utils.json_serializer(exist_exam_answers)}})
            
            question_seeked = Questions.objects.filter(pk=question_id)
            
            new = Exam_Answers(
                question_id = question_seeked,
                answer = answer,
                is_correct = True if is_correct == 'true' else False,
                created_at = created_at,
                updated_at = updated_at).save()
            return Response({
                'type': 'ok', 
                'detail': {
                    'message': 'New exam answer created successfully',
                    'content': utils.json_serializer(new)}})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
    def get(self, request):
        try:
            data = Exam_Answers.objects.all()
            return Response({
                'type': 'ok', 
                'detail': utils.json_serializer(data)
                })
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
class user(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            ...
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
    def get(self, request):
        try:
            pk = self.request.query_params.get('pk')
            if pk is not None:
                data = User.objects.filter(pk = pk)
                if len(data)>=1:
                    return Response({'type': 'ok', 'detail': utils.json_serializer(data)})
                else:
                    return Response({'type': 'error', 'detail': 'No exist users in the data base with that id'})
            else:
                data = User.objects.all()
                if len(data)>=1:
                    return Response({'type': 'ok', 'detail': utils.json_serializer(data)})
                else:
                    return Response({'type': 'error', 'detail': 'No exist users in the data base'})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex}, status=status.HTTP_200_OK)
class topics(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            course_id = request.data.get('course_id')
            title = request.data.get('title')
            content = request.data.get('content')
            author = request.data.get('author')
            created_at = request.data.get('created_at')
            updated_at = request.data.get('updated_at')
            
            if course_id is None: 
                return Response('course_id was not sent')
            if title is None: 
                return Response('title was not sent')
            if content is None: 
                return Response('content was not sent')
            if author is None: 
                return Response('author was not sent')
            if created_at is None: 
                return Response('created_at was not sent')
            if updated_at is None: 
                return Response('updated_at was not sent')

            seeked_course = Courses.objects.get(pk = course_id)
            if len(seeked_course)<=0 or seeked_course is None:
                return Response({
                    'type': 'error', 
                    'detail': 'the course id was not fount'})
            
            new = Topics(
                course = seeked_course,
                title = title,
                content = content,
                author = author,
                created_at = created_at,
                updated_at = updated_at).save()

            return Response({
                'type': 'ok', 
                'detail': {
                    'message': 'New Topic created successfully',
                    'content': utils.json_serializer(new)}})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
    def get(self, request):
        try:
            print('QUERY', self.request.query_params)
            print('PK', self.request.query_params.get('pk'))
            print('COURSE ID', self.request.query_params.get('course_id'))

            pk = self.request.query_params.get('pk')
            course_id = self.request.query_params.get('course_id')

            if pk is not None:
                '''
                obtener todos lor temas por el id (pk: primary key)
                '''
                data = Topics.objects.filter(pk = pk)
                if len(data)>=1:
                    return Response({'type': 'ok', 'detail': utils.json_serializer(data)})
                else:
                    return Response({'type': 'ok', 'detail': 'No exist topic in the data base with that id'})
            
            elif course_id is not None:   
                data = Topics.objects.filter(course = course_id)
                if len(data)>=1:
                    return Response({'type': 'ok', 'detail': utils.json_serializer(data)})
                else:
                    return Response({'type': 'ok', 'detail': 'No exist topic in the data base with that id'})

            else:
                data = Topics.objects.all()
                return Response({'type': 'ok', 'detail': utils.json_serializer(data)})

        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
class exams(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        try:
            ...
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
    def get(self, request):
        try:
            print('QUERY PARAMS', self.request.query_params)
            exam_id = self.request.query_params.get('course_id') if self.request.query_params.get('exam_id') else None
            pk = self.request.query_params.get('pk')
            
            if exam_id is not None:
                data = Exams.objects.raw(f'''
                SELECT * FROM api_exams AS e 
                INNER JOIN api_questions as q ON e.id  = q.exam_id
                INNER JOIN api_exam_answers as ea ON q.id = ea.question_id
                WHERE q.exam_id = {str(exam_id)};
                ''')
                if len(data)>=1:
                    return Response({'type': 'ok', 'detail': utils.json_serializer(data)})
                else:
                    return Response({'type': 'ok', 'detail': 'No exist exams in the data base with that id'})

            elif pk is not None:
                data = Exams.objects.filter(pk = pk)
                return Response({
                    'type': 'ok', 
                    'detail': utils.json_serializer(data)})
            else:
                data = Exams.objects.all()
                return Response({'type': 'ok', 'detail': utils.json_serializer(data)})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})