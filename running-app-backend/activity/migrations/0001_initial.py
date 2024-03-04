# Generated by Django 3.2.7 on 2024-03-02 11:08

from django.conf import settings
import django.core.validators
from django.db import migrations, models
import django.db.models.deletion
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('account', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Club',
            fields=[
                ('id', models.UUIDField(db_index=True, default=uuid.uuid4, primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=150)),
                ('avatar', models.ImageField(default='', upload_to='')),
                ('cover_photo', models.ImageField(default='', upload_to='')),
                ('sport_type', models.CharField(choices=[('RUNNING', 'Running'), ('CYCLING', 'Cycling'), ('SWIMMING', 'Swimming')], max_length=15)),
                ('description', models.TextField(blank=True, null=True, validators=[django.core.validators.MaxLengthValidator(255, 'The field can contain at most 200 characters')])),
                ('participate_freely', models.BooleanField(default=True)),
                ('organization', models.CharField(choices=[('SPORT_CLUB', 'Sport Club'), ('BUSINESS', 'Business'), ('SCHOOL', 'School')], default='', max_length=15)),
            ],
        ),
        migrations.CreateModel(
            name='Event',
            fields=[
                ('id', models.UUIDField(db_index=True, default=uuid.uuid4, primary_key=True, serialize=False)),
                ('name', models.CharField(db_index=True, max_length=100, unique=True)),
                ('started_at', models.DateTimeField()),
                ('ended_at', models.DateTimeField()),
                ('regulations', models.JSONField(blank=True, default=dict)),
                ('description', models.TextField(blank=True, null=True, validators=[django.core.validators.MaxLengthValidator(255, 'The field can contain at most 200 characters')])),
                ('contact_information', models.CharField(blank=True, max_length=16, null=True)),
                ('banner', models.ImageField(default='', upload_to='')),
                ('sport_type', models.CharField(choices=[('RUNNING', 'Running'), ('CYCLING', 'Cycling'), ('SWIMMING', 'Swimming')], default='RUNNING', max_length=15)),
                ('is_group', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Group',
            fields=[
                ('id', models.UUIDField(db_index=True, default=uuid.uuid4, primary_key=True, serialize=False)),
                ('name', models.CharField(db_index=True, max_length=100)),
                ('description', models.TextField(blank=True, null=True, validators=[django.core.validators.MaxLengthValidator(255, 'The field can contain at most 200 characters')])),
                ('avatar', models.ImageField(default='', upload_to='')),
                ('event', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='groups', to='activity.event')),
            ],
        ),
        migrations.CreateModel(
            name='UserParticipationEvent',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_admin', models.BooleanField(default=False)),
                ('participated_at', models.DateTimeField(auto_now_add=True)),
                ('event', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='activity.event')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='account.activity')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='UserParticipationClub',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_admin', models.BooleanField(default=False)),
                ('participated_at', models.DateTimeField(auto_now_add=True)),
                ('club', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='activity.club')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='account.activity')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='UserGroup',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('participated_at', models.DateTimeField(auto_now_add=True)),
                ('is_admin', models.BooleanField(default=False)),
                ('group', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='user_memberships', to='activity.group')),
                ('user', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='group_membership', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='group',
            name='users',
            field=models.ManyToManyField(blank=True, through='activity.UserGroup', to=settings.AUTH_USER_MODEL),
        ),
        migrations.CreateModel(
            name='ActivityRecord',
            fields=[
                ('id', models.UUIDField(db_index=True, default=uuid.uuid4, primary_key=True, serialize=False)),
                ('distance', models.DecimalField(decimal_places=3, max_digits=6)),
                ('duration', models.DurationField()),
                ('completed_at', models.DateTimeField(auto_now_add=True)),
                ('sport_type', models.CharField(choices=[('RUNNING', 'Running'), ('CYCLING', 'Cycling'), ('SWIMMING', 'Swimming')], default='RUNNING', max_length=15)),
                ('description', models.TextField(blank=True, null=True, validators=[django.core.validators.MaxLengthValidator(255, 'The field can contain at most 200 characters')])),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='activity_record', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
