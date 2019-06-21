FROM python:2.7.16-stretch

RUN python

RUN apt-get update

RUN apt-get install -y \
	libpq-dev \
	libxml2-dev \
	libxslt1-dev \
	python-dev \
	libyaml-dev

RUN pip install zato-apitest

COPY ./tests /tests
