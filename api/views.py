from .models import Courses, Questions, Exam_Answers, Topics, Exams, User_Courses, User_Answers, All_User_Answers

from datetime import datetime as dt
from .utilities import utils

from rest_framework.permissions import IsAuthenticated
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status

from django.contrib.auth import authenticate
from django.contrib.auth.models import User


class UserAuthentication(APIView):
    def post(self, request):
        '''
        target:
            Auntenticar al usuario administrador y generar un token

        params: request:
            User
            Password
        '''

        try:
            username, password = request.data.get('username'), request.data.get('password')

            user = authenticate(username=username, password=password)

            if not user:
                return Response({'type': 'error', 'detail': 'usuario o contraseña incorrecto'})

            token, created = Token.objects.get_or_create(user=user)  # Genera token para el usuario logueado
            
            return Response({
                'type': 'ok', 
                'detail': {
                    'token': str(token.key), 'id': user.id}})
        
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})

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
                    'detail': 'title, no fue enviado'})
            if duration is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'duration, no fue enviado'})
            if author is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'author, no fue enviado'})
            if created_at is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'created_at, no fue enviado'})
            if updated_at is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'updated_at, no fue enviado'})
            
            search = Courses.objects.filter(
                title=title,
                duration=duration,
                author=author)

            if len(search) >= 1:
                return Response({
                    'type': 'error', 
                    'detail': {
                        'message': 'este curso existe', 
                        'content': utils.json_serializer(search)}})

            user = User.objects.get(pk=author)

            if not user or user is None or len(user) == 0:
                return Response({
                    'type': 'error', 
                    'detail': 'user o author, no fue encontrado'})

            new = Courses(
                title = title, 
                duration = duration, 
                author = user, 
                created_at = created_at, 
                updated_at = updated_at).save()

            return Response({
                'type': 'ok', 
                'detail': {
                    'message': 'Nuevo curso creado',
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
                    return Response({'type': 'ok', 'detail': 'No existe un curso en la base de datos con ese Id'})
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
                    'detail': 'question, no fue enviado'})
            if created_at is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'created_at, no fue enviado'})
            if updated_at is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'updated_at, no fue enviado'})
            
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

    def get(self, request):
        try:
            exam_id = self.request.query_params.get('exam_id')
            
            if exam_id is not None:
                data = Questions.objects.filter(exam_id = exam_id)
                if len(data)>=1:

                    # myquestions = {'questions': []}
                    
                    # for quest in data:
                    #     options = Exam_Answers.objects.filter(question_id = quest.id)
                    #     myquestions['questions'].append({'quesion': quest.question, 'options': [ option for option in options]})

                    return Response({'type': 'ok', 'detail': utils.json_serializer(data)})
                    # return Response({'type': 'ok', 'detail': myquestions })
                else:
                    return Response({'type': 'error', 'detail': 'No existe una pregunta en la base de datos con ese Id'}, status = status.HTTP_200_OK)
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
                    'detail': 'question_id, no fue enviado'})
            if answer is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'answer, no fue enviado' })
            if is_correct is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'is_correct, no fue enviado'})
            if created_at is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'created_at, no fue enviado'})
            if updated_at is None: 
                return Response({
                    'type': 'error', 
                    'detail': 'updated_at, no fue enviado'})
            
            exist_exam_answers = Exam_Answers.objects.get(
                question_id = question_id, 
                answer = answer)

            if len(exist_exam_answers) >= 1:
                return Response({
                    'type': 'error', 
                    'detail':{
                        'message':'esta opción de respuesta existe para la pregunta que necesitas', 
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
                    'message': 'Nueva opción de respuesta de examen creada',
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
                return Response('course_id, no fue enviado')
            if title is None: 
                return Response('title, no fue enviado')
            if content is None: 
                return Response('content, no fue enviado')
            if author is None: 
                return Response('author, no fue enviado')
            if created_at is None: 
                return Response('created_at, no fue enviado')
            if updated_at is None: 
                return Response('updated_at, no fue enviado')

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
                    'message': 'Nuevo tema creado',
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
                    return Response({'type': 'ok', 'detail': 'No existe un tema en la base de datos con ese Id'})
            
            elif course_id is not None:   
                data = Topics.objects.filter(course = course_id)
                if len(data)>=1:
                    return Response({'type': 'ok', 'detail': utils.json_serializer(data)})
                else:
                    return Response({'type': 'ok', 'detail': 'No existe un tema en la base de datos con ese Id de curso'})

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

class user_answers(APIView):

    def post(self, request):
        try:
            result = request.data.get('result')
            print('RESULT: ', result['question'])
            # AGREGAR VALIDACIONES
            # ...

            # RESPONSE EXAMPLE
            # {'user': '1', 'course': 1, 'question': '¿que siginifica int?', 'is_correct': 1}
            try:
                All_User_Answers.objects.raw(f"DELETE * FROM api_all_user_answers WHERE user = {result['user']} AND course = {result['course']}")
            except Exception as ex:
                print('EXEPT', ex)

            data = All_User_Answers(
                user = result['user'],
                course = result['course'],
                exam_name = result['exam_name'],
                question = result['question'],
                is_correct = result['is_correct']).save()

            return Response({'type': 'ok', 'detail': {
                'message': 'las preguntas del usuario fueron guardadas exitosamente',
                'content': utils.json_serializer(data)
            }})

        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})

    def get(self, request):
        '''
        target:
            obtener las respuestas del usuario segun  el id de usuario y id de curso
        params: query params:
            course
            user
        '''

        try:
            course = self.request.query_params.get('course')
            user = self.request.query_params.get('user')

            if course is not None:
                data = All_User_Answers.objects.filter(course = course, user = user)
                if len(data)>=1:
                    return Response({'type': 'ok', 'detail': utils.json_serializer(reversed(data[:3]))})
                else:
                    return Response({'type': 'error', 'detail': 'las respuestas de usuario no se encontraron con ese Id' })
            else:
                data = All_User_Answers.objects.all()
                return Response({'type': 'ok', 'detail': utils.json_serializer(data[-3:])})

        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})