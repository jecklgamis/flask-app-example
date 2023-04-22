import logging
import os
import sys

from flask import Flask

from app import api, root


def configure_logging():
    file_handler = logging.FileHandler(filename='flask-app-example.log')
    stdout_handler = logging.StreamHandler(sys.stdout)
    logging.basicConfig(level=logging.INFO,
                        format='[%(asctime)s] {%(filename)s:%(lineno)d} %(levelname)s - %(message)s',
                        handlers=[stdout_handler, file_handler])


def create_app():
    configure_logging()
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY=os.urandom(16)
    )
    app.config.from_pyfile('config.py', silent=True)
    try:
        os.makedirs(app.instance_path)
    except OSError as e:
        pass

    app.register_blueprint(api.bp)
    app.register_blueprint(root.bp)
    return app
