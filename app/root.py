import io
import json

from flask import Blueprint
from flask import jsonify

bp = Blueprint('/', __name__, url_prefix='/')


@bp.route('/', methods=['GET'])
def index():
    return jsonify({"name": "flask-app-example", "message": "It works on my machine!"})


@bp.route('/build-info', methods=['GET'])
def build_info():
    info = json.loads(io.open('build-info.json').read())
    return jsonify(info)
