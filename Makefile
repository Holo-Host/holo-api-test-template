SHELL		= bash

.PHONY: all test build init

all: build test

init:
	sudo docker run -v tests:/tests holo-zato-apitest  apitest init /tests

build:
	sudo docker build -t holo-zato-apitest .

# test -- rebuild the Dockerfile and run the tests
test:
	sudo docker run -v tests:/tests holo-zato-apitest  apitest demo
