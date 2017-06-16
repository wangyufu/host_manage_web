from django.shortcuts import render, HttpResponse, redirect
from host_manage.models import *
from utils.page import PageInfo
from django import forms
from django.forms import fields
from django.forms import widgets
import json


# Create your views here.

class LoginForm(forms.Form):
    username = fields.CharField(
        required=True,
        error_messages={'required': '用户名不能为空'},
        widget=widgets.TextInput(attrs={'class': 'form-control'})
    )
    password = fields.CharField(
        required=True,
        error_messages={'required': '密码不能为空'},
        widget=widgets.PasswordInput(attrs={'class': 'form-control'})
    )


class AddForm(forms.Form):
    new_lob = fields.CharField(
        required=True,
        error_messages={'required': '业务线名称不能为空'},
        widget=widgets.TextInput(attrs={'class': 'form-control'})
    )
    ip = fields.GenericIPAddressField(
        required=True,
        error_messages={
            'required': 'IP不能为空',
            'invalid': 'IP格式错误',
        },
        widget=widgets.TextInput(attrs={'class': 'form-control'})
    )  # 正则表达式,生成HTML标签
    port = fields.CharField(
        required=True,
        min_length=2,
        max_length=5,
        error_messages={
            'required': '端口不能为空',
            'min_length': "端口不能小于2个字符",
        },
        widget=widgets.TextInput(attrs={'class': 'form-control'})
    )  # 正则表达式,生成HTML标签
    username = fields.CharField(
        required=True,
        min_length=6,
        max_length=18,
        error_messages={'required': '用户名不能为空', 'min_length': "用户名不能小于6个字符"},
        widget=widgets.TextInput(attrs={'class': 'form-control'})  # 生成什么HTML插件
    )  # 正则表达式,生成HTML标签
    password = fields.CharField(
        required=True,
        error_messages={'required': '密码不能为空'},
        widget=widgets.TextInput(attrs={'class': 'form-control'})
    )  # 正则表达式,生成HTML标签


class EditForm(forms.Form):
    lob_id = fields.IntegerField(
        required=True,
        widget=widgets.Select(
            attrs={'class': 'form-control'},
            choices=[]
        )
    )

    def __init__(self, *args, **kwargs):
        super(EditForm, self).__init__(*args, **kwargs)
        self.fields['lob_id'].widget.choices = LOB.objects.values_list('id', 'title')


def auth(fun):
    def wrapper(request, *args, **kwargs):
        u = request.session.get('username')
        if not u:
            return redirect('/')
        return fun(request, u, *args, **kwargs)

    return wrapper


@auth
def create(request, u):
    user_info_obj = User_msg.objects.get(username=u)
    for i in range(1, 200):
        host_obj = Host.objects.create(
            ip='192.168.1.%s' % i,
            port=22 + i,
            host_user='root%s' % i,
            host_password='123',
            lob_id=1,
        )
        user_info_obj.u_h.add(host_obj)
    return HttpResponse('OK')


@auth
def index(request, u):
    user_obj = User_msg.objects.get(username=u)
    # order_by 排序   ， FK查询时使用select_related，连表查询
    host_obj = user_obj.u_h.all().select_related('lob').order_by('id')
    all_count = host_obj.count()
    page_info = PageInfo(request.GET.get('p'), 10, all_count, request.path_info)

    host_list = host_obj[page_info.start():page_info.end()]
    # print(host_l)
    return render(request, 'index.html', {'username': u,
                                          'host_l': host_list,
                                          'page_info': page_info,
                                          })


@auth
def delete(request, u):
    if request.method == 'GET':
        did = request.GET.get('id')
        Host.objects.filter(id=did).delete()
        return redirect('/index/lob/')


@auth
def lob(request, u):
    add_form_obj = AddForm()
    edit_form_obj = EditForm()
    user_obj = User_msg.objects.get(username=u)
    host_obj = user_obj.u_h.all().select_related('lob').order_by('id')
    all_count = host_obj.count()
    page_info = PageInfo(request.GET.get('p'), 10, all_count, request.path_info)
    host_list = host_obj[page_info.start():page_info.end()]
    return render(request, 'lob.html', {'lob_l': host_list,
                                        'page_info': page_info,
                                        'add_form_obj': add_form_obj,
                                        'edit_form_obj': edit_form_obj,
                                        })


def edit(request, hid):
    if request.method == 'POST':
        data = {'status': True, 'error': None}
        print(request.POST)
        obj = EditForm(request.POST)
        if obj.is_valid():
            print(obj.changed_data)
            Host.objects.filter(id=hid).update(lob_id=obj.cleaned_data['lob_id'])
            return HttpResponse(json.dumps(data))
        else:
            print(obj.errors['lob_id'])
        # hid = request.POST.get('id')
        # lob = request.POST.get('lob')
        # lob_obj = LOB.objects.filter(title=lob).values().first()
        # data = {'status': True, 'error': None}
        # if lob_obj:
        #     Host.objects.filter(id=hid).update(lob_id=lob_obj['id'])
        #     return HttpResponse(json.dumps(data))
        # else:
        #     data['status'] = False
        #     data['error'] = '不存在的业务线'
        #     return HttpResponse(json.dumps(data))


def lob_back(request):
    return redirect('/index/lob/')


def re_edit(request, hid):
    if request.method == 'GET':
        host_obj = Host.objects.filter(id=hid).first()
        obj = EditForm(initial={
            'lob_id': host_obj.lob.id
        })
        return render(request, 'edit.html', {'hid': hid, 'obj': obj})
    else:
        obj = EditForm(request.POST)
        print(request.POST)

        if obj.is_valid():
            print(obj.cleaned_data)
            Host.objects.filter(id=hid).update(lob_id=obj.cleaned_data['lob_id'])
            return redirect('/index/lob/')


@auth
def re_add(request, u):
    if request.method == 'GET':
        obj = AddForm()
        return render(request, 'add.html', {'obj': obj})
    else:
        # 获取用户提交的数据 request.POST
        # 数据和正则表达式进行验证
        # 1. 是否验证成功
        # 2. 成功：获取数据
        # 3. 失败：错误信息
        obj = AddForm(request.POST)
        # 1. 是否验证成功
        if obj.is_valid():
            # 2. 成功：获取数据
            # models.UserInfo.objects.create(**obj.cleaned_data)
            user_info_obj = User_msg.objects.get(username=u)
            lob_obj = LOB.objects.create(title=obj.cleaned_data['new_lob'])
            add_obj = Host.objects.create(ip=obj.cleaned_data['ip'],
                                          port=obj.cleaned_data['port'],
                                          host_user=obj.cleaned_data['username'],
                                          host_password=obj.cleaned_data['password'],
                                          lob_id=lob_obj.id)
            user_info_obj.u_h.add(add_obj)
            return redirect('/index/lob')
        else:
            # 3. 失败：错误信息
            print("错误信息", obj.errors)
        return render(request, 'add.html', {'obj': obj})
        # if request.method == 'POST':
        #     try:
        #         ip = request.POST.get('ip')
        #         port = request.POST.get('port')
        #         user = request.POST.get('username')
        #         pwd = request.POST.get('password')
        #         lob = request.POST.get('lob')
        #         user_info_obj = User_msg.objects.get(username=u)
        #         lob_obj = LOB.objects.create(title=lob)
        #         add_obj = Host.objects.create(ip=ip,
        #                                       port=port,
        #                                       host_user=user,
        #                                       host_password=pwd,
        #                                       lob_id=lob_obj.id)
        #         user_info_obj.u_h.add(add_obj)
        #         return redirect('/index/lob/')
        #     except Exception as e:
        #         return render(request, 'add.html', {'error': '添加业务线失败:%s' % e})


@auth
def add(request, u):
    data = {'status': True, 'error': None}
    if request.method == 'POST':
        add_form_obj = AddForm(request.POST)
        if add_form_obj.is_valid():
            user_info_obj = User_msg.objects.get(username=u)
            lob_obj = LOB.objects.create(title=add_form_obj.cleaned_data['new_lob'])
            add_obj = Host.objects.create(ip=add_form_obj.cleaned_data['ip'],
                                          port=add_form_obj.cleaned_data['port'],
                                          host_user=add_form_obj.cleaned_data['username'],
                                          host_password=add_form_obj.cleaned_data['password'],
                                          lob_id=lob_obj.id)
            user_info_obj.u_h.add(add_obj)
            return HttpResponse(json.dumps(data))
        else:
            data['status'] = False
            data['error'] = add_form_obj.errors
            return HttpResponse(json.dumps(data))


@auth
def upload(request, u):
    # v = request.session.get('username')
    # if not u:
    #     return redirect('/login')
    if request.method == 'GET':
        return render(request, 'upload.html')
    elif request.method == 'POST':
        obj = request.FILES.get('test')
        import os
        with open(os.path.join('upload', obj.name), 'wb') as f:
            for line in obj.chunks():
                f.write(line)
        return render(request, 'upload.html', {'v': '上传成功'})


def logout(request):
    request.session.clear()
    return redirect('/index/')


def login(request):
    if request.method == 'GET':
        login_form_obj = LoginForm()
        return render(request, 'login.html', {'login_form_obj': login_form_obj})
    elif request.method == 'POST':
        data = {'status': True, 'error': None}
        login_obj = LoginForm(request.POST)
        if login_obj.is_valid():
            obj = User_msg.objects.filter(
                username=login_obj.cleaned_data['username'],
                password=login_obj.cleaned_data['password'],
            ).first()
            if obj:
                data_obj = json.dumps(data)
                request.session['username'] = login_obj.cleaned_data['username']
                return HttpResponse(data_obj)
            else:
                data['status'] = False
                data['error'] = '用户名或密码错误'
                data_obj = json.dumps(data)
                return HttpResponse(data_obj)
        else:
            data['status'] = False
            data['obj'] = login_obj.errors
            data_obj = json.dumps(data)
            return HttpResponse(data_obj)

