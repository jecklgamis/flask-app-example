## flask-example-app 

[![CircleCI](https://circleci.com/gh/jecklgamis/flask-example-app.svg?style=svg)](https://circleci.com/gh/jecklgamis/flask-example-app)

An example Flask app using Python 3.

What's in the box? 
* Alpine-based Docker image
* HTTPS listener using a self-signed certificate
* Modular route handlers using [Flask Blueprints](https://flask.palletsprojects.com/en/1.1.x/blueprints/) 
* [Gunicorn](https://gunicorn.org) WSGI server
* A `smoke-tests.py` for basic endpoint testing, based on built in `unittest` module 

## Running The App

To run the app in Docker:
```
make up
```

To run the app directly in your dev machine:
```
make run-app-dev-mode
make run-app-dev-mode-ssl
```

## Testing The EndPoints

Testing using `curl` command:
```
curl -k https://localhost:8443/
curl -k https://localhost:8443/server_info
curl -k https://localhost:8443/api
```

Testing using the `smoke-tests.py` command:
```
make smoke-tests
```

## Customizing This Skeleton
* Change all references of `flask-example-app` to suit your project name
* Provide your own server certificates (`server.key` and `server.crt`) if need be
* Add more tests in `smoke-test.py` if need be
* Change WSGI server in `docker-entrypoint.sh` if need be

## Contributing
Please raise issue or pull request. Thanks for contributing!

Have fun!