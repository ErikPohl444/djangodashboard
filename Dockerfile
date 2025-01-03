FROM python:slim

WORKDIR /app

COPY requirements.txt requirements.txt
RUN set -xe && apt-get -yqq update && apt-get -yqq install python3-pip && pip3 install --upgrade pip && pip install -r requirements.txt

COPY ./ ./

EXPOSE 8000

WORKDIR /app/djangodashboard

CMD ["python", "./manage.py", "runserver", "0.0.0.0:8000"]
