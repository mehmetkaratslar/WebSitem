# Pull the official base image
FROM python:3.10-slim

RUN apt-get update

RUN apt-get install python3-dev build-essential -y


# Upgrade pip and install virtualenv
RUN pip install --upgrade pip
RUN pip install virtualenv && python -m virtualenv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY . /WebSitem/app
WORKDIR /WebSitem/app



