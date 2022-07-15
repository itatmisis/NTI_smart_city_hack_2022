from tortoise import Tortoise

from .controllers import router


def init(app):
    app.include_router(router, prefix="/dreams", tags=["Dreams"])
    Tortoise.init_models(["app.dreams.models"], "dreams")
