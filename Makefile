SHELL		= bash

.PHONY: all test build 

all: build test


build:
	sudo docker build -t holo-zato-apitest .

# test -- rebuild the Dockerfile and run the tests
test:
	sudo docker run holo-zato-apitest  apitest run /tests
