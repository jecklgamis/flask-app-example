#!/bin/bash
BRANCH=$(git rev-parse --abbrev-ref HEAD)
COMMIT_ID=$(git rev-parse HEAD)
echo "{ \"version\":\"${COMMIT_ID}\", \"branch\":\"${BRANCH}\", \"name\":\"flask-app-example\"}" > build-info.json
echo "Wrote build-info.json"