# Base Python image
FROM python:3.10-slim

# Don't write pyc files and show logs in real-time
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Container ke andar ka working directory
WORKDIR /app

# Requirements copy karo aur install karo
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Code copy karo
COPY . /app/

# Server run command
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
