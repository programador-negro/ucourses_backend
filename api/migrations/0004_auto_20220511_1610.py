# Generated by Django 3.0.7 on 2022-05-11 21:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0003_auto_20220511_1605'),
    ]

    operations = [
        migrations.AlterField(
            model_name='posible_answers',
            name='is_correct',
            field=models.BooleanField(null=True, verbose_name='es correcta'),
        ),
        migrations.AlterField(
            model_name='questions',
            name='created_at',
            field=models.DateTimeField(auto_created=True),
        ),
        migrations.AlterField(
            model_name='questions',
            name='updated_at',
            field=models.DateTimeField(auto_now=True),
        ),
    ]
