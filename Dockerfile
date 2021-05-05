# Dockerfile for building application container

# Starting container image
FROM python:3.9.5

# Working directory
WORKDIR /app

# Copy source code to working directory
COPY . main.py /app/

# Install packages from requirements.txt
RUN pip install --upgrade pip &&\
    pip install -r requirements.txt
