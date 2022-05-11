from dataclasses import field
from django.contrib import admin
from .models import Questions, Courses, Topics, Exams, Exam_Answers, User_Courses, User_Answers 

class QuestionsAdmin(admin.ModelAdmin):
    fields = (
        'question',
        'created_at',
    )

    list_display = (
        'question',
        'created_at',
        'updated_at'
    )

class CoursesAdmin(admin.ModelAdmin):
    fields = (
        'title',
        'duration',
        'author',
        'created_at',
    )
    list_display = (
        'title',
        'duration',
        'author',
        'created_at',
        'updated_at'
    )

class TopicsAdmin(admin.ModelAdmin):
    fields = (
        'course_id',
        'title',
        'content',
        'author',
        'created_at',
    )

    list_display = ('course_id',
        'title',
        'content',
        'author',
        'created_at',
        'updated_at')

class ExamsAdmin(admin.ModelAdmin):
    fields = (
        'title',
        'course_id',
        'time',
        'minimun_correct_answers',
        'created_at',
    )
    list_display = (
        'title',
        'course_id',
        'time',
        'minimun_correct_answers',
        'created_at',
        'updated_at'
    )

class Exam_AnswersAdmin(admin.ModelAdmin):
    fields = (
        'question_id',
        'answer',
        'is_correct',
        'created_at',
        
    )
    list_display = (
        'question_id',
        'answer',
        'is_correct',
        'created_at',
        'updated_at'
    )

class User_CoursesAdmin(admin.ModelAdmin):
    fields = (
        'user_id',
        'course_id',
        'course_state'
    )
    list_display = (
        'user_id',
        'course_id',
        'course_state'
    )

class User_AnswersAdmin(admin.ModelAdmin):
    fields = (
        'user_id',
        'exam_id',
        'question_id',
        'answer_id'
    )
    list_display = (
        'user_id',
        'exam_id',
        'question_id',
        'answer_id'
    )

admin.site.register(Questions, QuestionsAdmin)
admin.site.register(Courses, CoursesAdmin)
admin.site.register(Topics, TopicsAdmin)
admin.site.register(Exams, ExamsAdmin)
admin.site.register(Exam_Answers, Exam_AnswersAdmin)
admin.site.register(User_Courses, User_CoursesAdmin)
admin.site.register(User_Answers, User_AnswersAdmin)