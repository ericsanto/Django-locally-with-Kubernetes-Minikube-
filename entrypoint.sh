#!/bin/bash

APP_PORT=${PORT:-8000}

cd /django-kubernetes/

gunicorn app.wsgi:application --bind "0.0.0.0:8000"