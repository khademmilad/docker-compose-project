# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

ENV PYTHONUNBUFFERED=1

RUN apt-get update && \
    apt-get install -y gettext

# Set the working directory to /app
WORKDIR /app

COPY ./src ./

# Install any needed packages specified in requirements.txt
RUN pip install --upgrade pip --no-cache-dir

RUN pip install -r /app/requirements.txt --no-cache-dir

# Copy the files from src to the working directory
COPY . .

EXPOSE 9000