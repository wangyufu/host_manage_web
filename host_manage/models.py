from django.db import models

# Create your models here.


class User_msg(models.Model):
    name = models.CharField(max_length=30)
    username = models.CharField(max_length=30)
    password = models.CharField(max_length=60)
    u_h = models.ManyToManyField("Host")

    def __str__(self):
        return self.username


# 业务线ORM
class LOB(models.Model):
    title = models.CharField(max_length=20)

    def __str__(self):
        return self.title


class Host(models.Model):
    ip = models.CharField(max_length=15)
    port = models.IntegerField()
    host_user = models.CharField(max_length=30)
    host_password = models.CharField(max_length=30)
    lob = models.ForeignKey('LOB', null=True)

    def __str__(self):
        return self.ip

