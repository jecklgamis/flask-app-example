import io
import json

from flask import Blueprint
from flask import jsonify

bp = Blueprint('/', __name__, url_prefix='/')


@bp.route('/', methods=['GET'])
def index():
    return jsonify({"name": "flask-app-example", "message": "It works on my machine!"})


@bp.route('/server_info', methods=['GET'])
def server_info():
    info = json.loads(io.open('server_info.json').read())
    return jsonify(info)
