## flask-app-example

[![Build](https://github.com/jecklgamis/flask-app-example/actions/workflows/build.yml/badge.svg)](https://github.com/jecklgamis/flask-app-example/actions/workflows/build.yml)

An example Flask app using Python 3 and Docker.

Docker : `docker run -p 8080:8080 -it jecklgamis/flask-app-example:main`

What's in the box?

* Ubuntu Linux based Docker image
* SSL/TLS listener
* Modular route handlers using [Flask Blueprints](https://flask.palletsprojects.com/en/1.1.x/blueprints/) 
* [Gunicorn](https://gunicorn.org) WSGI server
* Flask tests (under `tests` directory) using `pytest` and a `smoke-tests.py` for basic endpoint testing

## Preparing Your Environment
* Ensure [Python 3](https://www.python.org/downloads/), [Docker](https://www.docker.com/), and 
[GNU Make](https://www.gnu.org/software/make/) are installed

Install Python dependencies:
```
make install-deps
```
## Building 
To build the app:
```
make all 
```
This  does a couple of things:
* It generates self-signed SSL certificates (`server.key` and `server.crt`)
* It generates `server_info.json` that is served by the `/server_info` endpoint
* It runs tests using `pytest`
* It generates a Docker image

Explore the `Makefile` for details.

## Running
To run the app in Docker:
```
make run
```

To run the app directly without using Docker:
```
make run-app-dev-mode
make run-app-dev-mode-ssl
```

## Testing The EndPoints
```
make smoke-tests
```

## Contributing
Please raise issue or pull request. Thanks for contributing!

Have fun!