# syntax=docker/dockerfile:1
FROM python:3
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
COPY . /app/


ADD . .

RUN python manage.py collectstatic --noinput --clear
CMD gunicorn core.wsgi:application --bind 0.0.0.0:$PORT