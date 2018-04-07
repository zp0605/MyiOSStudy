# group-CMD

## 团队开发

- 共享库(文件夹/U盘/网盘/Github/oschina)

- 1, 创建代码共享库(让一个文件夹成为共享库)
    - `git init --bare`

- 2, 经理将共享代码仓库中的内容clone下来
    - `git clone 共享代码库的地址`

- 3, 项目经理初始化项目
    - 3.1 忽略文件:在和.git等级目录下创建一个`.gitignore`文件,在该文件中指定需要忽略的文件
    - 3.2 可以去`https://github.com/github/gitignore/blob/master/Objective-C.gitignore`查看OC需要忽略的内容, 将内容填写到`.gitignore`中
    - 3.3 `git add . / git commit -m "注释"`将`gitignore`添加到本地仓库管理中

---

- 4, 张三加入开发
    - `git clone`共享代码库的地址
    - 修改代码 -> `git commit -m` -> `git push`
- 5, 注意
    - 同一个文件的共享
    - 同一个文件共享的时候发生代码冲突
    - 创建新文件的共享
    - `storyboard`的共享
    - 静态库的共享(不需要想svn一样执行add命令)


# 团队操作

```objc

01. 建立代码仓库(专门用于团队开发的代码仓库)
================================================================================

# 切换目录
$ cd /Users/Desktop/git演练/公司/weibo
# 建立空白代码库(专门用于团队开发)
$ git init --bare

02. 项目经理准备项目(前奏)
================================================================================

# 切换目录
$ cd /Users/Desktop/git演练/经理
# "克隆"代码库到本地
$ git clone /Users/Desktop/git演练/公司/weibo/

# 个人信息配置(因为要演示一台机器上的多人协作，日常开发可以忽略)
$ git config user.name manager
$ git config user.email manager@163.com

.gitignore
--------------------------------------------------------------------------------
.gitignore可以指定哪些文件不纳入版本库的管理

参考网址：https://github.com/github/gitignore

# 命令行中进入与.git同级的目录
$ cd /Users/Desktop/git演练/经理/weibo

# 将.gitignore添加到代码库
$ git add .gitignore

03. 创建项目
================================================================================
提交同时"push"到远程代码仓库

04. 新人加入
================================================================================

...

05. 分布式的代码库 - 仅供参考
================================================================================
由于git是分布式的，任何一台计算机上都保留有完整的代码库的内容，因此可以把团队开发的代码库放在任何位置

```


### `.gitignore` 备份

```objc
# Xcode
#
# gitignore contributors: remember to update Global/Xcode.gitignore, Objective-C.gitignore & Swift.gitignore

## Build generated
build/
DerivedData/

## Various settings
*.pbxuser
!default.pbxuser
*.mode1v3
!default.mode1v3
*.mode2v3
!default.mode2v3
*.perspectivev3
!default.perspectivev3
xcuserdata/

## Other
*.moved-aside
*.xcuserstate

## Obj-C/Swift specific
*.hmap
*.ipa
*.dSYM.zip
*.dSYM

# CocoaPods
#
# We recommend against adding the Pods directory to your .gitignore. However
# you should judge for yourself, the pros and cons are mentioned at:
# https://guides.cocoapods.org/using/using-cocoapods.html#should-i-check-the-pods-directory-into-source-control
#
# Pods/

# Carthage
#
# Add this line if you want to avoid checking in source code from Carthage dependencies.
# Carthage/Checkouts

Carthage/Build

# fastlane
#
# It is recommended to not store the screenshots in the git repo. Instead, use fastlane to re-generate the
# screenshots whenever they are needed.
# For more information about the recommended setup visit:
# https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Gitignore.md

fastlane/report.xml
fastlane/screenshots

# Code Injection
#
# After new code Injection tools there's a generated folder /iOSInjectionProject
# https://github.com/johnno1962/injectionforxcode

iOSInjectionProject/

```
