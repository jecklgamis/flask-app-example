from flask import Blueprint

bp = Blueprint('api', __name__, url_prefix='/api')
from flask import jsonify


@bp.route('/', methods=['GET'])
def index():
    return jsonify({"message": "This is the /api endpoint"})
