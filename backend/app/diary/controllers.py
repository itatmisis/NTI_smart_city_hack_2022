import datetime
from typing import List

from fastapi import APIRouter, Depends, HTTPException

from .models import Entry
from .schemas import CreateEntry, EntrySchema, DeleteSuccess
from ..users.auth import get_user
from ..users.models import User

router = APIRouter()


async def check_entry(id: str, user: User = Depends(get_user)):
    """
    Проверка записи в бд
    """
    entry = await Entry.get_or_none(id=id, user=user)
    if entry is None:
        raise HTTPException(404, 'Item not found')
    return entry


@router.get('/all', response_model=List[EntrySchema])
async def get_all(user: User = Depends(get_user)):
    """
    Получение всех записей из дневника Чемпиона,
    требуется для реализации раздела "дневник чемпиона" в мобильном приложении
    """
    return await EntrySchema.from_queryset(Entry.filter(user=user))


@router.post('/', response_model=EntrySchema)
async def create_entry(new_entry: CreateEntry, user : User = Depends(get_user)):
    """
    Создание записи в дневнике
    """
    entry = await Entry.create(
        **new_entry.dict(),
        date=datetime.datetime.timestamp(datetime.datetime.now()),
        user=user
    )
    return await EntrySchema.from_tortoise_orm(entry)


@router.get('/{id}', response_model=EntrySchema)
async def get_by_id(entry: Entry = Depends(check_entry)):
    return await EntrySchema.from_tortoise_orm(entry)


@router.put('/', response_model=EntrySchema)
async def edit_entry(edited_entry: CreateEntry, entry: Entry = Depends(check_entry)):
    await entry.update_from_dict(edited_entry.dict())
    await entry.save()
    return await EntrySchema.from_tortoise_orm(entry)


@router.delete('/')
async def delete_item(entry: Entry = Depends(check_entry)):
    await entry.delete()
    return DeleteSuccess(ok=True)
