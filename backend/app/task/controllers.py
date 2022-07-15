from fastapi import APIRouter, Depends, HTTPException

from .models import Goal, Task
from .schemas import GoalSchema, CreateGoal, DeleteSuccess
from backend.app.users.auth import get_user
from backend.app.users.models import User

router = APIRouter()

# Goal routes
# TODO: добавление Task в Goal


async def check_goal(id: str, user: User = Depends(get_user)):

    goal = await Goal.get_or_none(id=id, user=user)
    if goal is None:
        raise HTTPException(404, 'Item not found')
    return goal


@router.post('/goal', response_model=GoalSchema)
async def create_goal(new_goal: CreateGoal, user: User = Depends(get_user)):

    goal = await Goal.create(
        **new_goal.dict(),
        user=user
    )
    return GoalSchema.from_tortoise_orm(goal)


@router.get('/goal/{id}', response_model=GoalSchema)
async def get_goal_by_id(goal: Goal = Depends(check_goal)):
    return await GoalSchema.from_tortoise_orm(goal)


@router.put('/goal', response_model=GoalSchema)
async def create_goal(edited_goal: CreateGoal, goal: Goal = Depends(check_goal)):
    await goal.update_from_dict(edited_goal.dict())
    await goal.save()
    return await GoalSchema.from_tortoise_orm(goal)


@router.delete('/goal')
async def delete_goal(goal: Goal = Depends(check_goal)):
    await goal.delete()
    return DeleteSuccess(ok=True)


# Task routes
async def check_task(id: str, user: User = Depends(get_user)):

    task = await Task.get_or_none(id=id, user=user)
    if task is None:
        raise HTTPException(404, 'Item not found')
    return task


@router.post('/', response_model=GoalSchema)
async def create_task(new_goal: CreateGoal, user: User = Depends(get_user)):
    goal = await Goal.create(
        **new_goal.dict(),
        user=user
    )
    return GoalSchema.from_tortoise_orm(goal)


@router.get('/{id}', response_model=GoalSchema)
async def get_task_by_idl(goal: Goal = Depends(check_goal)):
    return await GoalSchema.from_tortoise_orm(goal)


@router.put('/', response_model=GoalSchema)
async def edit_task(edited_goal: CreateGoal, goal: Goal = Depends(check_goal)):
    await goal.update_from_dict(edited_goal.dict())
    await goal.save()
    return await GoalSchema.from_tortoise_orm(goal)


@router.delete('/')
async def delete_task(goal: Goal = Depends(check_goal)):
    await goal.delete()
    return DeleteSuccess(ok=True)
