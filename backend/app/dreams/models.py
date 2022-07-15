from tortoise import fields, Model


class Dream(Model):
    id = fields.UUIDField(pk=True)
    name = fields.CharField(max_length=128)
    additional_data = fields.TextField()
    attachments = fields.TextField()  # TODO: fields.ForeignKeyField(Attachment)
    user = fields.ForeignKeyField('users.User', related_name='dreams')
    created_date = fields.IntField()

    # id = fields.IntField(pk=True)

    class PydanticMeta:
        exclude = ['user_id']
