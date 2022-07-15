from pydantic import BaseModel
from tortoise.contrib.pydantic import pydantic_model_creator

from .models import Dream

# ItemsSchema = pydantic_model_creator(
#     Item, name='ItemsSchema', exclude=(), include=()
# )

DreamSchema = pydantic_model_creator(
    Dream, name='DreamSchema', exclude=(), include=()
)


class CreateDream(BaseModel):
    name: str
    additional_data: str
    attachments: str
    # user_id: str


class DeleteSuccess(BaseModel):
    ok: bool
