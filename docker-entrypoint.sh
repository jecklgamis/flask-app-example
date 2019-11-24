#!/usr/bin/env bash
cd /app
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
FLASK_APP=flask-example-app
flask run --host 0.0.0.0 --port 8080


