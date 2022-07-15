import json
import os
from glob import glob
# from config import ALGORITHM, ACCESS_TOKEN_EXPIRE_MINUTES, SECRET_KEY

current_path = os.path.dirname(os.path.realpath(__file__))

with open(os.path.join(current_path, '.gitignore'), 'r', encoding='utf8') as file:
    exclude = set(file for file in file.read().split('\n'))

folders = list(
    set([folder.replace('\\', '/').replace("app/", "").strip('/') for folder in glob('app/*/')]) - exclude
)

apps = [
    folder.replace("/", ".") for folder in folders
]

tortoise_apps = {
    folder: {
        'models': [f'app.{folder.replace("/", ".")}.models']
    }
    for folder in folders
}

PROD_TORTOISE_ORM = {
    'connections': {'default': f'sqlite://{current_path}/db/prod/db.sqlite3'},
    'apps': tortoise_apps,
    # 'apps': {'models': model_paths},
}

TEST_TORTOISE_ORM = {
    'connections': {'default': f'sqlite://{current_path}/db/test/db.sqlite3'},
    'apps': tortoise_apps,
    # 'apps': {'models': model_paths},
}

# with open(os.path.join(current_path, 'secrets.json')) as file:
#     secrets = json.load(file)

SDATABASE_URL='db.sqlite'
ACCESS_TOKEN_EXPIRE_MINUTES='30'
ALGORITHM='HS256'
SECRET_KEY='eyJhbGciOiJIUzI1NiJ9.eyJSb2xlIjoiQWRtaW4iLCJJc3N1ZXIiOiJJc3N1ZXIiLCJVc2VybmFtZSI6IkphdmFJblVzZSIsImV4cCI6MTY1Nzg3NjM3MywiaWF0IjoxNjU3ODc2MzczfQ.oM174h2BGvM_t5vvSgDjEd-CKupavEfT9z4Hoc0RxnQ'
CORS_ORIGINS = ['*']
IS_PROD = False #os.getenv('IS_PROD', False)
DOMAIN = 'localhost.local'# os.getenv('DOMAIN', 'set.prod.domain.com')

