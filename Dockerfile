FROM python:3.12 AS builder

WORKDIR /data

RUN pip install --upgrade pip setuptools


RUN pip install django==3.2

FROM debian:bookworm-slim

COPY . .

RUN python manage.py migrate

EXPOSE 8000

ENTRYPOINT ["python" , "manage.py"]

CMD ["runserver","0.0.0.0:8000"]
