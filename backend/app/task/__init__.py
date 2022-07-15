from tortoise import Tortoise

from .controllers import router


def init(app):
    app.include_router(router, prefix="/task", tags=["Task"])
    Tortoise.init_models(["app.task.models"], "task")
