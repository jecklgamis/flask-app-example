#!/usr/bin/env bash

USE_SSL=$1

export FLASK_APP=app
export FLASK_ENV=development

if [ ! -z "${USE_SSL}" ]; then
  echo "Starting app using SSL"
  flask run --cert  server.crt --key server.key --host 0.0.0.0 --port 8443
else
  echo "Starting app"
  flask run --host 0.0.0.0 --port 8080
fi
