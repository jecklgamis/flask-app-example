import io
import json

from flask import Blueprint

bp = Blueprint('/', __name__, url_prefix='/')
from flask import jsonify


@bp.route('/', methods=['GET'])
def index():
    return jsonify({"name": "flask-example-app", "message": "It works in my machine!"})


@bp.route('/server_info', methods=['GET'])
def server_info():
    info = json.loads(io.open('server_info.json').read())
    return jsonify(info)
