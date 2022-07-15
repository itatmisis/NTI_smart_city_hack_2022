from tortoise import fields, Model


class Task(Model):
    id = fields.UUIDField(pk=True)
    text = fields.TextField()
    attachments = fields.TextField()
    due_date = fields.IntField()


class Goal(Model):
    id = fields.UUIDField(pk=True)
    name = fields.TextField()
    # tasks = fields.ManyToManyField('models.Task', related_name='tasks', through='goal_task')

    user = fields.ForeignKeyField('users.User', related_name='goals')
