#!/usr/bin/env bash
source /python3env/bin/activate

if [ "$USE_SSL" = "true" ]; then
  exec gunicorn --bind 0.0.0.0:8443 --certfile server.crt --keyfile server.key 'app:app'
else
  exec gunicorn --bind 0.0.0.0:8080 'app:app'
fi
