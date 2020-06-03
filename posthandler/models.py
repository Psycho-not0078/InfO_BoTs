# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Channels(models.Model):
    cid = models.IntegerField(primary_key=True)
    name = models.CharField(unique=True, max_length=45)
    taglist = models.TextField(blank=True, null=True)
    rules = models.TextField(blank=True, null=True)
    blacklist = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'channels'


class ChannelsModerators(models.Model):
    channels_cid = models.OneToOneField(Channels, models.DO_NOTHING, db_column='channels_cid', primary_key=True)
    moderators_mid = models.ForeignKey('Moderators', models.DO_NOTHING, db_column='moderators_mid')

    class Meta:
        managed = False
        db_table = 'channels_moderators'
        unique_together = (('channels_cid', 'moderators_mid'),)


class ChannelsUser(models.Model):
    chan_cid = models.OneToOneField(Channels, models.DO_NOTHING, db_column='chan_cid', primary_key=True)
    users_uid = models.ForeignKey('User', models.DO_NOTHING, db_column='USers_uid')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'channels_user'
        unique_together = (('chan_cid', 'users_uid'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Fol(models.Model):
    following_id = models.IntegerField(primary_key=True)
    user1 = models.ForeignKey('User', models.DO_NOTHING, db_column='user1')
    user2 = models.ForeignKey('User', models.DO_NOTHING, db_column='user2')

    class Meta:
        managed = False
        db_table = 'fol'


class Moderators(models.Model):
    mid = models.IntegerField(primary_key=True)
    moderatortype = models.CharField(db_column='moderatorType', max_length=45)  # Field name made lowercase.
    user_uid = models.ForeignKey('User', models.DO_NOTHING, db_column='USER_uid')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'moderators'


class Msg(models.Model):
    mid = models.IntegerField(primary_key=True)
    msg = models.TextField()
    timestamp = models.DateTimeField()
    sender = models.ForeignKey('User', models.DO_NOTHING)
    receiver = models.ForeignKey('User', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'msg'


class Post(models.Model):
    pid = models.IntegerField(primary_key=True)
    post = models.TextField()
    anonumus = models.IntegerField()
    poster = models.ForeignKey('User', models.DO_NOTHING)
    channels_cid = models.ForeignKey(Channels, models.DO_NOTHING, db_column='channels_cid')

    class Meta:
        managed = False
        db_table = 'post'


class User(models.Model):
    uid = models.IntegerField(primary_key=True)
    username = models.CharField(max_length=45)
    name = models.CharField(max_length=45)
    email = models.CharField(unique=True, max_length=45)
    role = models.CharField(max_length=45, blank=True, null=True)
    passwd = models.CharField(max_length=45)
    additional_info = models.TextField(db_column='additional info', blank=True, null=True)  # Field renamed to remove unsuitable characters.
    api_key = models.BigIntegerField(db_column='API_Key')  # Field name made lowercase.
    api_time = models.DateTimeField(db_column='API_Time')  # Field name made lowercase.
    timestap_of_join = models.DateTimeField(db_column='timestap of join')  # Field renamed to remove unsuitable characters.

    class Meta:
        managed = False
        db_table = 'user'
