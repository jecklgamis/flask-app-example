# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build and Development Commands

```bash
# Install dependencies
make install-deps

# Build (generates SSL certs and build-info.json)
make build

# Run tests
make check                    # or: pytest -v

# Run locally
./run-app.sh                  # HTTP on port 8080
USE_SSL=true ./run-app.sh     # HTTPS on port 8443

# Docker
make image                    # Build Docker image
make run                      # Run container (8080 HTTP, 8443 HTTPS)

# Full pipeline
make up                       # Build, test, create image, and run

# Smoke tests (against running instance)
make run-smoke-tests

# Clean generated files
make clean
```

### Helm/Kubernetes (from deployment/k8s/helm/)

```bash
make install      # Deploy to cluster
make upgrade      # Update deployment
make uninstall    # Remove deployment
make dry-run      # Debug without deploying
```

## Architecture

Flask application using a **blueprint-based modular architecture**:

```
app/
├── __init__.py   # create_app() factory, logging setup, blueprint registration
├── root.py       # Root blueprint: / and /build-info endpoints
├── api.py        # API blueprint: /api/ endpoint
└── probe.py      # Probe blueprint: /probe/live and /probe/ready (K8s health checks)
```

**Entry point:** `create_app()` in `app/__init__.py` configures logging, initializes Flask, and registers all blueprints.

**Production server:** Gunicorn (configured in docker-entrypoint.sh)

## Testing

Tests use pytest with a shared Flask test client fixture defined in `tests/conftest.py`:
- `test_root.py` - Root endpoint tests
- `test_api.py` - API endpoint tests
- `test_probe.py` - Kubernetes probe tests

## Deployment

- **Docker:** Ubuntu 24.04 base, Python venv, Gunicorn WSGI server
- **Kubernetes:** Helm chart in `deployment/k8s/helm/chart/` with nginx ingress, TLS via cert-manager, liveness/readiness probes
- **CI/CD:** GitHub Actions workflow builds, tests, and pushes to Docker Hub on main branch
