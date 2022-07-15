import datetime
from typing import List

from fastapi import APIRouter, Depends, HTTPException

from .models import Dream
from .schemas import CreateDream, DreamSchema, DeleteSuccess
from ..users.auth import get_user
from ..users.models import User

router = APIRouter()


async def check_dream(id: str, user: User = Depends(get_user)):
    """
    Проверка, записи в БД
    """
    dream = await Dream.get_or_none(id=id, user=user)
    if dream is None:
        raise HTTPException(404, 'Item not found')
    # if dream.user_id != user.id:
    #     raise HTTPException(403, 'User does not have access to this')
    return dream


@router.get('/all', response_model=List[DreamSchema])
async def get_all(user: User = Depends(get_user)):
    """
    Получение всех мечт пользователя
    """
    return await DreamSchema.from_queryset(Dream.filter(user=user))


@router.post('/', response_model=DreamSchema)
async def create_item(new_dream: CreateDream, user: User = Depends(get_user)):
    """
    Создание мечты пользователем
    """
    dream = await Dream.create(
        **new_dream.dict(),
        created_date=datetime.datetime.timestamp(datetime.datetime.now()),
        user=user
    )
    return await DreamSchema.from_tortoise_orm(dream)


@router.get('/{id}', response_model=DreamSchema)
async def get_my(dream: Dream = Depends(check_dream)):
    return await DreamSchema.from_tortoise_orm(dream)


@router.put('/', response_model=DreamSchema)
async def edit_item(edited_dream: CreateDream, dream: Dream = Depends(check_dream)):
    await dream.update_from_dict(edited_dream.dict())
    await dream.save()
    return await DreamSchema.from_tortoise_orm(dream)


@router.delete('/')
async def delete_item(dream: Dream = Depends(check_dream)):
    await dream.delete()
    return DeleteSuccess(ok=True)



