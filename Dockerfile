FROM ubuntu:24.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt update -y && apt install -y curl dumb-init python3 python3-venv python3-pip && rm -rf /var/lib/apt/lists/*
RUN python3 -m venv /python3env

COPY requirements.txt /
RUN /python3env/bin/pip3 install --trusted-host pypi.python.org -r /requirements.txt

ENV APP_HOME /app

COPY app/* $APP_HOME/app/
COPY build-info.json $APP_HOME
COPY server.crt $APP_HOME
COPY server.key $APP_HOME

EXPOSE 8080
EXPOSE 8443

WORKDIR $APP_HOME

COPY docker-entrypoint.sh /
ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["/docker-entrypoint.sh"]
