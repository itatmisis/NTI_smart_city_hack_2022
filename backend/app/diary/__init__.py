from tortoise import Tortoise

from .controllers import router


def init(app):
    app.include_router(router, prefix="/diary", tags=["Diary"])
    Tortoise.init_models(["app.diary.models"], "diary")
    # return ("app.diary.models", "diary")
