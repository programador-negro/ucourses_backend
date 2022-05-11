from django.db import models
from django.contrib.auth.models import User

class Courses(models.Model):
    '''
    todos los cursos en general de la plataforma
    '''
    title = models.CharField(max_length=200)
    duration = models.IntegerField()
    author = models.ForeignKey(User, models.CASCADE)
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        '''
        Function to return the field like string in the admin site,
        and don't show a object
        '''
        return self.title

    class Meta:
        verbose_name_plural = "Courses"

class Topics(models.Model):
    course_id = models.ForeignKey(Courses, models.DO_NOTHING)
    title = models.CharField(max_length=150)
    content = models.TextField()
    author = models.ForeignKey(User, models.CASCADE)
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        '''
        Function to return the field like string in the admin site,
        and don't show a object
        '''
        return self.title

    class Meta:
        verbose_name_plural = "Topics"

class Exams(models.Model):
    '''
    todos los examenes en general de la plataforma
    '''
    title = models.CharField(max_length=200)
    course_id = models.ForeignKey('Courses', models.DO_NOTHING)
    time = models.TimeField()
    minimun_correct_answers =  models.IntegerField()
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self) -> str:
        '''
        Function to return the field like string in the admin site,
        and don't show a object
        '''
        return self.title
    
    class Meta:
        verbose_name_plural = "Exams"

class Questions(models.Model):
    '''
    todas las preguntas
    '''
    question = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_created=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        '''
        Function to return the field like string in the admin site,
        and don't show a object
        '''
        return self.question

    class Meta:
        verbose_name_plural = "Questions"

class Exam_Answers(models.Model):
    '''
    todas las opciones de respuesta
    '''
    question_id = models.ForeignKey('Questions', models.DO_NOTHING)
    answer = models.CharField(max_length=200)
    is_correct = models.BooleanField(verbose_name="es correcta")
    created_at = models.DateTimeField(auto_created=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        '''
        Function to return the field like string in the admin site,
        and don't show a object
        '''
        return self.answer

    class Meta:
        verbose_name_plural = "Posible Answers"

class User_Courses(models.Model):
    '''
    many to many relationship
    '''
    user_id = models.ForeignKey(User, models.CASCADE)
    course_id = models.ForeignKey(Courses, models.DO_NOTHING)
    course_state =  models.BooleanField()

    class Meta:
        verbose_name_plural = "User Courses"

class User_Answers(models.Model):
    user_id = models.ForeignKey(User, models.DO_NOTHING)
    exam_id = models.ForeignKey(Exams, models.DO_NOTHING)
    question_id = models.ForeignKey(Questions, models.DO_NOTHING)
    answer_id = models.ForeignKey(Exam_Answers, models.DO_NOTHING)

    class Meta:
        verbose_name_plural = "User Answers"


