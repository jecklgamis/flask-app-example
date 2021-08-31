FROM alpine:3.10.3
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apk update && apk add --no-cache bash curl dumb-init
RUN apk update && apk add --no-cache python3
RUN pip3 install --upgrade pip

COPY requirements.txt /
RUN pip3 install --trusted-host pypi.python.org -r /requirements.txt

ENV APP_HOME /app

COPY app/* ${APP_HOME}/app/
COPY server_info.json ${APP_HOME}

COPY server.crt ${APP_HOME}
COPY server.key ${APP_HOME}

EXPOSE 8080
EXPOSE 8443

WORKDIR ${APP_HOME}

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/docker-entrypoint.sh"]
