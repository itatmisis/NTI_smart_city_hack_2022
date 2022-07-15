# "Дневник мечты API"

## Обзор

---

Используя программные интерфейсы Вдохновителей (vdohway.ru), мы сделали публичное API для взаимодействия с сервисом "Дневник мечты". 
В качестве основного технологического стека использовался [python](https://www.python.org/) и 
[fastapi](https://fastapi.tiangolo.com/) framework для создания **backend** части приложения.

## URI и версионность

---

Мы надеемся со временем усовершенствовать API. 
Первая итерация будет иметь URI с префиксом `https://{domain}/v0/` и будет иметь структуру, описанную ниже. 
В настоящее время нет ограничений по скорости.

## Структура

---

```
.
├── __init__.py
├── app
│   ├── __init__.py
│   ├── app.py
│   ├── attachments
│   │   ├── __init__.py
│   │   ├── controllers.py
│   │   └── models.py
│   ├── config.py
│   ├── db
│   │   ├── prod
│   │   └── test
│   ├── diary
│   │   ├── __init__.py
│   │   ├── controllers.py
│   │   ├── models.py
│   │   └── schemas.py
│   ├── dreams
│   │   ├── __init__.py
│   │   ├── controllers.py
│   │   ├── models.py
│   │   └── schemas.py
│   ├── settings.py
│   ├── task
│   │   ├── __init__.py
│   │   ├── controllers.py
│   │   ├── models.py
│   │   └── schemas.py
│   └── users
│       ├── __init__.py
│       ├── auth.py
│       ├── controllers.py
│       ├── mailer.py
│       ├── models.py
│       ├── schemas.py
│       └── template.html
├── assets
│   └── logo.png
└── main.py
```

API v0 - это, по сути, начальная точка в которой реализован весь базовый функционал для работы сервиса.
Для упрощения работы над сервисом была реализована модульная структура, где каждый модуль отвечает за свой набор функций:
- `users` - модуль, отвечающий за аутентификацию пользователей с помощью "Beaver token" и отслеживания сессии пользователя в сервисе
- `diary` - модуль, отвечающий за функционал Дневника Чемпиона
- `dreams` - модуль, отвечающий за функционал Мечты. Сохранение / редактирование мечт. Формирование целей из мечт.
- `task` - модуль, отвечающий за функционал Целей и Задач. После преобразования мечты в цель помогает отслеживать процесс с помощью задач.
- `attachments`  **работа в процессе** модуль, отвечающий за все вложения в приложении: фотографии, видео, ссылки.

С настоящей структурой БД приложение отлично работает при малом количестве пользователей. Она реализована на sqlite3,
который идеально подходит для первоначального прототипа. Мы знаем что наш публичный API не идеальный, но это тот, который мы смогли выпустить за то время, которое у нас было.


## Users

---

Основная модель в сервисе, которая соответствует пользователю сервиса:

### Модель пользователя

---

Поле | Описание
------|------------
**id** | уникальный `id` пользователя.
fio | Фамилия Имя Отчество.
phone_number | номер телефона пользователя.
email | электронная почта пользователя .
auth_token | Актуальный `Bearer` токен.
avatar | `attachment` - фотография профиля.
hashed_password | закодированный пароль пользователя.

### Методы для работы с моделью пользователя

---

`[POST] /users/` 

Конечная точка для создания нового пользователя.

формат запроса JSON
```json
{
  "username": "string",
  "password": "string"
}
```

ответ в формате **JSON**
```json
{
	"access_token": "32bit string token",
	"token_type": "Bearer"
}
```

---

`[POST] /users/token`

Конечная точка для обновления токена доступа к приложению

формат запроса JSON
```json
{
  "username": "string",
  "password": "string"
}
```

ответ в формате **JSON**
```json
{
	"access_token": "32bit string token",
	"token_type": "Bearer"
}
```

---

`[POST]` /users/login

Конечная точка для повторной авторизации пользователя

формат запроса JSON
```json
{
  "username": "string",
  "password": "string"
}
```

ответ в формате **JSON**
```json
{
	"access_token": "32bit string token",
	"token_type": "Bearer"
}
```

---

`[PUT]` /users/

Конечная точка для редактирования информации о пользователе

формат запроса JSON
```json
{
  "fio": "string",
  "avatar": "string",
  "phone_number": "string",
  "email": "string"
}
```

ответ в формате **JSON**
```json
{
  "id": "string",
  "fio": "string",
  "phone_number": "string",
  "email": "string",
  "auth_token": "string",
  "avatar": "string"
}
```

---

`[GET]` /users/profile

Конечная точка для получения информации о пользователе

формат запроса JSON
```json
{

}
```

ответ в формате **JSON**
```json
{
  "id": "string",
  "fio": "string",
  "phone_number": "string",
  "email": "string",
  "auth_token": "string",
  "avatar": "string"
}
```

---

`[GET]` /users/{id}

Конечная точка для получения информации о пользователе по его `id`

формат запроса JSON
```json
{
  "id": "string"
}
```

ответ в формате **JSON**
```json
{
  "id": "string",
  "fio": "string",
  "phone_number": "string",
  "email": "string",
  "auth_token": "string",
  "avatar": "string"
}

```

---

`[GET]` /users/all

Конечная точка для получения информации о всех пользователях

формат запроса JSON
```json
{

}
```

ответ в формате **JSON**
```json
[
  {
  "id": "string",
  "fio": "string",
  "phone_number": "string",
  "email": "string",
  "auth_token": "string",
  "avatar": "string"
},
  {
  "id": "string",
  "fio": "string",
  "phone_number": "string",
  "email": "string",
  "auth_token": "string",
  "avatar": "string"
}
]

```

---

`[DELETE]` /users/

Конечная точка для удаления пользователя

ответ в формате **JSON**
```json
{
  "status" : "ok"
}

```

## Dreams

### Модель мечты


Поле | Описание
------|------------
**id** | уникальный `id` мечты.
name | Название мечты.
additional_data | Дополнительный текст - идеи и мыслы.
attachments | list[`attachment`] - вложение (картинки, ссылки, видео) .
user | `user` - владелец мечты.
created_date | Дата создания, в [Unix Time](http://en.wikipedia.org/wiki/Unix_time)..

### Методы для работы с моделью пользователя

---

`[POST] /dreams/` 

Конечная точка для создания нового пользователя.

формат запроса JSON
```json
{
  "name": "string",
  "additional_data": "string",
  "attachments": "string"
}
```

пример ответа в формате **JSON**
```json
{
"id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
"name": "string",
"additional_data": "string",
"attachments": "string",
"created_date": 2147483647
}
```

---

`[PUT] /dreams/` 

Конечная точка для редактирования мечты.

формат запроса JSON
```json
{
  "name": "string",
  "additional_data": "string",
  "attachments": "string"
}
```

пример ответа в формате **JSON**
```json
{
"id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
"name": "string",
"additional_data": "string",
"attachments": "string",
"created_date": 2147483647
}
```

---

`[Get] /dreams/all` 

Конечная точка для получения всех мечт пользователя.


пример ответа в формате **JSON**
```json
[
  {
    "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    "name": "string",
    "additional_data": "string",
    "attachments": "string",
    "created_date": 2147483647
  }
]
```

---


`[Get] /dreams/{id}` **id:str** 

Конечная точка для получения мечты по id.

пример ответа в формате **JSON**
```json
{
"id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
"name": "string",
"additional_data": "string",
"attachments": "string",
"created_date": 2147483647
}
```

---

`[DELETE]` /dreams/

Конечная точка для удаления мечты

query параметр **id** : "string" 

ответ в формате **JSON**
```json
{
  "status" : "ok"
}

```

## Task

### Модель цели

### Task

Поле | Описание
------|------------
**id** | уникальный `id` задачи.
text | более подробное описание задачи.
attachments | list[`attachment`] - вложение (картинки, ссылки, видео) .
due_date | Дата создания, в [Unix Time](http://en.wikipedia.org/wiki/Unix_time)..

---

`[POST]` /task/

Конечная точка для создания задания

формат запроса JSON
```json
{
  "name": "string",
  "additional_data": "string",
  "attachments": "string"
}
```

пример ответа в формате **JSON**
```json
{
"id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
"name": "string",
"additional_data": "string",
"attachments": "string",
"created_date": 2147483647
}
```

### Goal

Поле | Описание
------|------------
**id** | уникальный `id` мечты.
name | название/краткое описание цели.
tasks | [`Task`] список всех задач, для достижения цели
user | пользователь, которвый создал цель 
due_date | Дата создания, в [Unix Time](http://en.wikipedia.org/wiki/Unix_time)..

    
