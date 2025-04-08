FROM python:3.7-slim
RUN mkdir /app
COPY requirements.txt /app
RUN pip install --upgrade pip
RUN pip install -r /app/requirements.txt --no-cache-dir
COPY . /app
WORKDIR /app
CMD [ "gunicorn", "hello_docker.wsgi:application", "--bind", "0:8000" ]
LABEL author="test@ya.ru" version=1.1