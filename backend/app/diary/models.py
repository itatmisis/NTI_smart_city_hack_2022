from tortoise import Model, fields


class Entry(Model):
    id = fields.UUIDField(pk=True)
    text = fields.TextField()
    attachments = fields.TextField()  # TODO: fields.ForeignKeyField(Attachment)
    date = fields.IntField()
    user = fields.ForeignKeyField('users.User', related_name='diary')

    class PydanticMeta:
        exclude = ['user']

