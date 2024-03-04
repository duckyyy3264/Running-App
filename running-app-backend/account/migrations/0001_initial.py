# Generated by Django 3.2.7 on 2024-03-02 11:08

from django.conf import settings
import django.contrib.auth.models
import django.contrib.auth.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('first_name', models.CharField(blank=True, max_length=150, verbose_name='first name')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('id', models.UUIDField(default=uuid.uuid4, editable=False, primary_key=True, serialize=False)),
                ('email', models.EmailField(max_length=254, unique=True)),
                ('is_verified_email', models.BooleanField(db_index=True, default=False)),
                ('username', models.CharField(blank=True, db_index=True, max_length=150, null=True, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()])),
                ('phone_number', models.CharField(blank=True, db_index=True, default=None, max_length=16, null=True, unique=True)),
                ('is_verified_phone', models.BooleanField(db_index=True, default=False)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'verbose_name': 'user',
                'verbose_name_plural': 'users',
                'abstract': False,
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
        migrations.CreateModel(
            name='Activity',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
        ),
        migrations.CreateModel(
            name='Profile',
            fields=[
                ('id', models.UUIDField(db_index=True, default=uuid.uuid4, primary_key=True, serialize=False)),
                ('avatar', models.ImageField(default='', upload_to='')),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('country', models.CharField(blank=True, db_index=True, max_length=150, null=True)),
                ('city', models.CharField(blank=True, db_index=True, max_length=150, null=True)),
                ('gender', models.CharField(choices=[('MALE', 'male'), ('FEMALE', 'female')], max_length=10)),
                ('date_of_birth', models.DateField()),
                ('height', models.IntegerField()),
                ('weight', models.IntegerField()),
                ('shirt_size', models.CharField(choices=[('XS', 'extra small'), ('S', 'small'), ('M', 'medium'), ('L', 'large'), ('XL', 'extra large'), ('XXL', 'extra extra large')], max_length=10)),
                ('trouser_size', models.CharField(choices=[('XS', 'extra small'), ('S', 'small'), ('M', 'medium'), ('L', 'large'), ('XL', 'extra large'), ('XXL', 'extra extra large')], max_length=10)),
                ('shoe_size', models.IntegerField()),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='profile', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Privacy',
            fields=[
                ('id', models.UUIDField(db_index=True, default=uuid.uuid4, primary_key=True, serialize=False)),
                ('follow_privacy', models.CharField(choices=[('APPROVAL', 'Approval'), ('NO_APPROVAL', 'No Approval')], max_length=20)),
                ('activity_privacy', models.CharField(choices=[('EVERYONE', 'Everyone'), ('FOLLOWER', 'Follower'), ('ONLY ME', 'Only me')], max_length=20)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='privacy', to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Performance',
            fields=[
                ('id', models.UUIDField(db_index=True, default=uuid.uuid4, primary_key=True, serialize=False)),
                ('user', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='performance', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
