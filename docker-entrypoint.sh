#!/usr/bin/env bash
# exec gunicorn --bind 0.0.0.0:8443 --certfile server.crt --keyfile server.key 'app:create_app()'
exec gunicorn --bind 0.0.0.0:8080 'app:create_app()'
