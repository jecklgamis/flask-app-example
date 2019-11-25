#!/bin/bash
BRANCH_NAME=$(git branch | awk '{ print $2 }')
COMMIT_ID=$(git rev-parse HEAD)
echo "{ \"version:\" :\"${COMMIT_ID}\", \"branch\":\"${BRANCH_NAME}\", \"name\":\"flask-example-app\"}" > server_info.json
echo "Wrote server_info.json"