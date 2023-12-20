FROM ubuntu:22.04
MAINTAINER Jerrico Gamis <jecklgamis@gmail.com>

RUN apt update -y && apt install -y curl dumb-init python3 python3-pip && rm -rf /var/lib/apt/lists/*
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
