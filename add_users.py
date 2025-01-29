import os
import django



os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'mywebapp.mywebapp.settings')
django.setup()

from django.contrib.auth.models import User

for i in range(1, 11):  # Create 10 users
    username = f'testuser{i}'
    email = f'{username}@example.com'
    password = 'testpassword123'
    User.objects.create_user(username=username, email=email, password=password)
    print(f"User '{username}' created.")