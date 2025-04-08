#!/bin/bash

echo "Collect static"
python manage.py collectstatic --noinput

echo "Create database"
python manage.py makemigrations --noinput

echo "Apply model database"
python manage.py migrate --noinput

echo "Runserver"
gunicorn hello_docker.wsgi:application --bind 0.0.0.0:8000