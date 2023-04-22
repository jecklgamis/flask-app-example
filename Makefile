IMAGE_NAME:=jecklgamis/flask-app-example
IMAGE_TAG:=main

default:
	echo $(IMAGE_TAG)
	cat ./Makefile
dist:
	 @./generate-ssl-certs.sh
	 @./generate-server-info.sh
image:
	 docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
run-shell:
	 @docker run -i -t $(IMAGE_NAME):$(IMAGE_TAG) /bin/bash
run:
	 @docker run -p 8443:8443 -p 8080:8080 -it $(IMAGE_NAME):$(IMAGE_TAG)

all : dist tests image
up: all run

install-deps:
	 @pip3 install -r requirements.txt
	 @pip3 install -r requirements-dev.txt
run-app-dev-mode:
	 @./run-app-dev-mode.sh
run-app-dev-mode-ssl:
	 @./run-app-dev-mode.sh ssl
smoke-tests:
	 @./smoke-tests.py
.PHONY: tests
tests:
	 pytest -s
