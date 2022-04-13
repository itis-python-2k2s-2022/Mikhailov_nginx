FROM python:3.10

WORKDIR app/

COPY ./requirements.txt .

RUN pip install -r requirements.txt

RUN pip freeze -> requirements.txt
RUN pip freeze

COPY . .

ENV FLASK_APP "app/flask_app/app.py"

CMD gunicorn --bind 0.0.0.0:5000 wsgi:app

