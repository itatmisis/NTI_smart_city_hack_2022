import os
from pathlib import Path
import shutil

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.openapi.utils import get_openapi
from rich.console import Console
from tortoise import Tortoise

from . import users
from .settings import apps, CORS_ORIGINS, DOMAIN, IS_PROD, PROD_TORTOISE_ORM, TEST_TORTOISE_ORM


console = Console(color_system="windows")

if IS_PROD:
    config_var = PROD_TORTOISE_ORM
else:
    config_var = TEST_TORTOISE_ORM


def prepare_db():
    # Удаляем папку с тестовой базой данных при запуске и импорте
    current_path = os.path.dirname(os.path.realpath(__file__))
    test_db_path = os.path.join(current_path, "db", "test")
    prod_db_path = os.path.join(current_path, "db", "prod")
    try:
        shutil.rmtree(test_db_path)
    except FileNotFoundError:
        console.print('Directory "db" is not detected', style='bold red')

    for path in [test_db_path, prod_db_path]:
        Path(path).mkdir(parents=True, exist_ok=True)


async def startup():
    try:
        await Tortoise.init(config=config_var)
        await Tortoise.generate_schemas(safe=True)
    except Exception as ex:
        console.print('Error:', ex, style='bold red')


async def shutdown():
    await Tortoise.close_connections()


def custom_openapi(app):
    if app.openapi_schema:
        return app.openapi_schema
    openapi_schema = get_openapi(
        title="Дневник мечты",
        version="0.1.1",
        description='''
        BackEnd сторона сервиса "Дневник мечты", который реализует весь функционал приложения.
                    
        ''',
        routes=app.routes,
    )
    openapi_schema["info"]["x-logo"] = {
        "url": "https://pic.rutubelist.ru/user/6d/0b/6d0b6aa23567b3a3616b407f301724b2.jpg"
    }
    app.openapi_schema = openapi_schema


def create_app():
    app = FastAPI()
    app.add_middleware(
        CORSMiddleware,
        allow_origins=CORS_ORIGINS,
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )


    prepare_db()

    # Init order is important! Init required apps firstly
    users.init(app)

    for module in apps:
        if module == 'users':
            continue
        module = __import__(f'app.{module}', fromlist=[module])
        module.init(app)

    app.add_event_handler("startup", startup)
    app.add_event_handler("shutdown", shutdown)

    if IS_PROD:
        console.print(f'Docs link: https://{DOMAIN}/docs', style='bold blue')
    else:
        console.print('Docs link: http://localhost:8000/docs', style='bold blue')

    # формирование документации
    custom_openapi(app)
    return app
