# Pull the official base image
FROM python:3.10-slim

RUN apt-get update

RUN apt-get install python3-dev build-essential -y

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV VİRTUAL_ENV=/opt/venv


# Upgrade pip and install virtualenv
RUN pip install --upgrade pip
RUN pip install virtualenv && python -m virtualenv $VİRTUAL_ENV

ENV PATH="$VİRTUAL_ENV/bin:$PATH"

ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY . /WebSitem/app
WORKDIR /WebSitem/app



