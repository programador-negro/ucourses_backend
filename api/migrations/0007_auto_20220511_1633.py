# Generated by Django 3.0.7 on 2022-05-11 21:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0006_auto_20220511_1617'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Posible_Answers',
            new_name='Exam_Answers',
        ),
        migrations.AlterField(
            model_name='courses',
            name='updated_at',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='exams',
            name='updated_at',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='topics',
            name='updated_at',
            field=models.DateTimeField(auto_now=True),
        ),
    ]
