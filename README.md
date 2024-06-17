## flask-app-example

[![Build](https://github.com/jecklgamis/flask-app-example/actions/workflows/build.yml/badge.svg)](https://github.com/jecklgamis/flask-app-example/actions/workflows/build.yml)

An example Flask app.

Docker : `docker run -p 8080:8080 -it jecklgamis/flask-app-example:main`

## What's In The Box?

* Ubuntu Docker image
* [Gunicorn](https://gunicorn.org) WSGI server
* Build info, liveness and readiness probes
* PyTest unit tests
* HTTP/HTTPS listeners

## Requirements

* Python 3
* Docker
* Make

## Building

Run `make install-deps` or `pip install -r requirements.txt` to install Python dependencies

## Building

Build Docker image
```
make all 
```
This  does a couple of things:
* It generates self-signed SSL certificates (`server.key` and `server.crt`)
* It generates `build-info.json` that is served by the `/build-info` endpoint
* It runs tests
* It generates a Docker image

Explore the `Makefile` for details.

## Running
To run the app in Docker:
```
make run
```

To run the app directly without using Docker:

```
flask run --host 0.0.0.0 --port 8080
```

## Testing The EndPoints
```
make smoke-tests
```

## Contributing

Please raise issue or pull request.

Have fun!