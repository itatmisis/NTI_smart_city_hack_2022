from tortoise import fields, Model


class User(Model):
    id = fields.UUIDField(pk=True)
    fio = fields.CharField(null=True, max_length=128)
    phone_number = fields.CharField(null=True, max_length=12)
    email = fields.CharField(unique=True, max_length=512)
    auth_token = fields.CharField(null=True, max_length=1024)
    avatar = fields.CharField(null=True, max_length=512)
    hashed_password = fields.CharField(max_length=512)

    def __repr__(self):
        return str(self.fio)

    class PydanticMeta:
        exclude = ["hashed_password"]


class Token(Model):
    id = fields.IntField(pk=True)
    login_token = fields.CharField(max_length=2048)
    is_used = fields.BooleanField(default=False)
