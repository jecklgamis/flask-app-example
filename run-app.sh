#!/usr/bin/env bash

USE_SSL=$1

export FLASK_APP=app
export FLASK_DEBUG=true

if [ "$USE_SSL" = "true" ]; then
  flask run --cert  server.crt --key server.key --host 0.0.0.0 --port 8443
else
  flask run --host 0.0.0.0 --port 8080
fi
