from flask import Blueprint
app_views = Blueprint('app_views', __name__, url_prefix='/api/v1')
app_template_views = Blueprint('app_template_views', __name__, template_folder='templates')
from views.index import *  # noqa
from views.gpio import *  # noqa
from views.motor import *  # noqa
from views.servo import *  # noqa
# from views.camera import *  # noqa
