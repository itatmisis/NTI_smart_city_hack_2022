from pydantic import BaseModel
from tortoise.contrib.pydantic import pydantic_model_creator

from .models import Entry

EntrySchema = pydantic_model_creator(
    Entry, name="EntrySchema", exclude=(), include=()
)
# CreateEntry = pydantic_model_creator(
#     Entry, name="CreateEntry", exclude=('id', 'date', 'user')
# )


class CreateEntry(BaseModel):
    text: str
    attachments: str


class DeleteSuccess(BaseModel):
    ok: bool
