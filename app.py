import sys

from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def root():
    version = f"{sys.version_info.major}.{sys.version_info.minor}"
    return jsonify({"name": "flask-example-app", "python": version})


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
