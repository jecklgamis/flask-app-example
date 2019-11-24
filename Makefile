IMAGE_NAME:=jecklgamis/flask-example-app
IMAGE_TAG:=latest

default:
	echo $(IMAGE_TAG)
	cat ./Makefile
image:
	 docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
run-bash:
	 docker run -i -t $(IMAGE_NAME):$(IMAGE_TAG) /bin/bash
run:
	 docker run -p 8080:8080 -it $(IMAGE_NAME):$(IMAGE_TAG)
