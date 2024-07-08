## flask-app-example

[![Build](https://github.com/jecklgamis/flask-app-example/actions/workflows/build.yml/badge.svg)](https://github.com/jecklgamis/flask-app-example/actions/workflows/build.yml)

An example webapp using Flask.

Run example from Docker Hub:
```bash 
docker run -p 8080:8080 -it jecklgamis/flask-app-example:main
```

## What's In The Box?

* Ubuntu Docker image
* [Gunicorn](https://gunicorn.org) WSGI server
* Build info, liveness and readiness probe endpoints
* PyTest unit tests
* HTTP/HTTPS listeners
* Kubernetes deployment (Helm chart)

## Requirements
* Python 3
* Docker
* Helm 
* Make (optional)

## Building

Install dependencies (`make install-deps`)
```bash
pip install -r requirements.txt
```

Build Docker image (`make all`)
```bash
./generate-ssl-certs.sh
./generate-build-info.sh
pytest -s
docker build -t flask-app-example:main .  
```

## Running 

Run the app in Docker (`make run`)
```bash
docker run -it flask-app-example:main
```

Run the app directly (`./run-app.sh`)
```bash
FLASK_DEBUG=true
flask run --host 0.0.0.0 --port 8080
```

Run the app directly using HTTPS (`USE_SSL=true ./run-app.sh`)
```bash
FLASK_DEBUG=true
flask run --cert  server.crt --key server.key --host 0.0.0.0 --port 8443
```

## Testing
Ensure the app is running.

Run some basic endpoint tests (`make smoke-tests`) 
```bash
./smoke-tests.py
```

## Contributing

Please raise issue or pull request.

Have fun!