release: python manage.py migrate

web: gunicorn djheroku.wsgi --log-file -

worker: python manage.py runserver 0.0.0.0:8000