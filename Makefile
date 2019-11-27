IMAGE_NAME:=jecklgamis/flask-example-app
IMAGE_TAG:=latest

default:
	echo $(IMAGE_TAG)
	cat ./Makefile
dist:
	 @./generate-ssl-certs.sh
	 @./generate-server-info.sh
image:
	 docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
run-bash:
	 @docker run -i -t $(IMAGE_NAME):$(IMAGE_TAG) /bin/bash
run:
	 @docker run -p 8443:8443 -it $(IMAGE_NAME):$(IMAGE_TAG)

all : dist unit-tests image
up: all run

run-dev-mode:
	 @./run-app-dev-mode.sh
run-dev-mode-ssl:
	 @./run-app-dev-mode.sh ssl
smoke-tests:
	 @./smoke-tests.py
unit-tests:
	 pytest -s
