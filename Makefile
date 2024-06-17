IMAGE_NAME:=flask-app-example
IMAGE_TAG:=$(shell git rev-parse --abbrev-ref HEAD)

default:
	@cat ./Makefile
install-deps:
	 @pip3 install -r requirements.txt
build:
	 @./generate-ssl-certs.sh
	 @./generate-build-info.sh
image:
	 docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
run:
	 @docker run -p 8080:8080 -p 8443:8443  -it $(IMAGE_NAME):$(IMAGE_TAG)
run-shell:
	 @docker run -it $(IMAGE_NAME):$(IMAGE_TAG) /bin/bash
exec-shell:
	docker exec -it `docker ps | grep $(IMAGE_NAME) | awk '{print $$1}'` /bin/bash
all: build check image
up: all run
run-smoke-tests:
	 @./smoke-tests.py
check:
	 @pytest -s
clean:
	@find . -name build-info.json | xargs rm -f
	@find . -name server.key | xargs rm -f
	@find . -name server.crt | xargs rm -f
	@find . -name *.log| xargs rm -f
