# 0719-SVN

## 命令

- 1, 第一次写代码的时候, 将整个项目的源代码下载到本地
    - `svn checkout 服务器地址 --username=用户名 --password=密码`

- 2, 将本地源代码更新内容提交至服务器
    - `svn commit -m "注释"`

- 3, 将本地的源代码更新至服务器上的最新版本
    - `update`
    - update之前要执行步骤**1**

---


## 一. 项目经理初始化项目
- 1, 将服务器已经有的内容下载到本地
    - `svn checkout 服务器地址 --username=mgr --password=mgr`

- 2, 初始化项目
    - 进入到工作目录
    - 初始化项目
    - 将初始化的项目提交到服务器

- 3, 查看文件状态
    - `svn status/ svn st 显示的文件状态`


- 4, 将新的文件添加到本地代码库管理当中
    - `svn add 文件名称`

- 5, 将文件提交到服务器
    - `svn commit -m "注释"`

- 6, 个人的基本操作
    - 修改main.m
    - 创建新的内容, 蒋欣的内容提交到服务器
    - 删除一些文件
    - 版本回退(暂时)
- 7, 删除文件
    - `svn remove 文件名`
- 8, 日志
    - `svn log`
    - `svn info`

---

## 二 多人开发
- 1, 张三将服务器的代码下载到本地
- 2, 张三添加新的文件, 将添加的内容更新到服务器
- 3, 张三修改文件, 提交到服务器


- 4, 李四加入开发
    - 和项目经理要SVN服务器的地址和SVN账号和密码
    -
    - 接口文档
    - 需求文档(产品人员)
    - 效果图

- 5, 张三和李四的多人开发


---

命令总结

`svn checkout` 将服务器的完整代码下载到本地做一次
`svn add 文件` 将文件交给本地仓库管理(xcode自动add到svn中)

常用命令

svn commit -m "注释"
svn update



## 冲突解决

- out of date : 文件过期
- 什么情况下不能提交代码:当本地版本号小于服务器的版本号的时候代码不能提交
- `conflict`

- (p)postpone对比所有的冲突(mine/r9/r10/person.h)
- (mc)mine-conflict :当代码冲突的时候使用我的代码, 覆盖服务器的代码(覆盖在本地覆盖->commit)
- (tc)thiers-conflict:当代码冲突的时候, 使用服务器的代码,覆盖本地的代码

```objc
<<<<<<< .mine
表示该位置是我的代码
=======
服务器的代码
>>>>>> .r11
```

- 手动解决后, `svn resolved`会自动删除文件内的文件
    - `svn resolved person.h`

## 回退版本

- 1, 仅仅是回退本地的版本
    - `snv update -r 9`
- 2, 随便修改一个文件里边的内容,添加一个属性
- 3, `svn update`故意产生冲突

<br>
### 方法二

- 1, 回退某些文件的版本到本地后, 再commit;
    - `svn merge -r 11:6 person.h`

- 静态库中的`.a文件`必须通过命令行添加到本地仓库




## 需要忽略的文件

- 1, 初始化项目的时候第一次先把所有的文件提交上去
- 2, `xcshareddata` :记录了远程仓库的地址, 直接在cornerstone里边delete
- 3, `xcuserdata` : 包含了文件夹的打开状态/当前用户停留在哪一个文件中/ 用户打的代码断点, 有2个, 直接在cornerstone里边delete
- 4, 删除之后在cornerstone直接提交,然后在xc里边,commit
- 5, 之后还会出现在cornerstone里边是黄颜色的标识, 直接ignore,再在在cornerstone提交 ,再次在xc里边提交
- 6, `Progect Settings`是目录结构文件, 需要commit


## 合并分支项目

- 1, 备份版本的时候, 没有备份1.0版本(备份了最初的版本)
- 2, 合并分支的时候, 工具没有将所有的内容一起合并过来
    - 如果有冲突, 就解决冲突
    - conrnerstone里边resolved 解决冲突
    - 提交代码到2.0版本
- 3, 再合并一次选择项目, 再次合并, 不要选中整个trunk文件夹
- 4, 解决完冲突, 提交代码


