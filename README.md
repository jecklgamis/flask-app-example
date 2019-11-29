## flask-example-app 

[![CircleCI](https://circleci.com/gh/jecklgamis/flask-example-app.svg?style=svg)](https://circleci.com/gh/jecklgamis/flask-example-app)

An example Flask app using Python 3 and Docker. This is a fairly complete template if you want to bootstrap a REST 
API server quickly.

What's in the box? 
* Alpine Linux based Docker image
* SSL/TLS listener
* Modular route handlers using [Flask Blueprints](https://flask.palletsprojects.com/en/1.1.x/blueprints/) 
* [Gunicorn](https://gunicorn.org) WSGI server
* Flask tests (under `tests` directory) using `pytest` and a `smoke-tests.py` for basic endpoint testing

## Preparing Your Environment
* Ensure [Python 3](https://www.python.org/downloads/) is installed
* Ensure [Docker](https://www.docker.com/) is installed
* Ensure [GNU Make](https://www.gnu.org/software/make/) is installed.

Install Python dependencies
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

## Customizing This Template
* Change all references of `flask-example-app` to suit your project name
* Provide your own server certificates (`server.key` and `server.crt`)
* Add more tests in `smoke-test.py` 

## Contributing
Please raise issue or pull request. Thanks for contributing!

Have fun!