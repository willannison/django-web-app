FROM python:3.9-slim

WORKDIR /app

# Copy project files
COPY manage.py .
COPY requirements.txt .
COPY mywebapp ./mywebapp

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DJANGO_SETTINGS_MODULE=mywebapp.mywebapp.settings

# Install dependencies
RUN pip install --no-cache-dir "django>=3.2,<4.0"

# Update manage.py settings path
RUN sed -i 's/mywebapp.settings/mywebapp.mywebapp.settings/' manage.py

EXPOSE 8000

# Run migrations and start server
CMD python manage.py migrate && python manage.py runserver 0.0.0.0:8000