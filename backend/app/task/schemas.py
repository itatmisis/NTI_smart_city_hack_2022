from typing import Optional

from pydantic import BaseModel
from tortoise.contrib.pydantic import pydantic_model_creator

from .models import Goal, Task

TaskSchema = pydantic_model_creator(
    Task, name="TaskSchema"
)

GoalSchema = pydantic_model_creator(
    Goal, name="GoalSchema"
)


class CreateGoal(BaseModel):
    name: str


class CreateTask(BaseModel):
    text: str
    attachments: str
    complition_date: Optional[int] = None


class DeleteSuccess(BaseModel):
    ok: bool
