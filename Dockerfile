FROM alpine:3.10.3
RUN apk update && apk add --no-cache bash curl dumb-init
RUN apk update && apk add --no-cache python3
RUN pip3 install --upgrade pip

WORKDIR /app

COPY app.py /app
COPY docker-entrypoint.sh /
COPY requirements.txt /
RUN pip3 install --trusted-host pypi.python.org -r /requirements.txt

EXPOSE 8080
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/docker-entrypoint.sh"]
