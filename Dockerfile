FROM alpine:3.10.3
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apk update && apk add --no-cache bash curl dumb-init
RUN apk update && apk add --no-cache python3
RUN pip3 install --upgrade pip

COPY requirements.txt /
RUN pip3 install --trusted-host pypi.python.org -r /requirements.txt

WORKDIR /
COPY app/* /app/
COPY server_info.json /

COPY docker-entrypoint.sh /
COPY server.crt /
COPY server.key /

EXPOSE 8080
EXPOSE 8443

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/docker-entrypoint.sh"]
