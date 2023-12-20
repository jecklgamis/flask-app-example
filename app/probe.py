from flask import Blueprint

bp = Blueprint('probe', __name__, url_prefix='/probe')
from flask import jsonify


@bp.route('/live', methods=['GET'])
def live():
    return jsonify({"message": "I'm alive!"})


@bp.route('/ready', methods=['GET'])
def ready():
    return jsonify({"message": "I'm ready!"})
