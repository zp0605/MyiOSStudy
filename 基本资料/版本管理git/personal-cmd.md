# personal-CMD

##GIT演练

### 一, 个人演练(命令行演练)

- 1, 进入到工作目录中初始化一个代码仓库
    - `git init`

- 2, 给该git仓库配置一个用户名和邮箱
    - `git config user.name "alan"`
    - `git config user.email "64hp@163.com"`

    - 2.1, 显示隐藏文件夹
        -  显示隐藏文件
            - `defaults write com.apple.finder     AppleShowAllFiles Yes && killall Finder`
        -  不显示隐藏文件
            - `defaults write com.apple.finder AppleShowAllFiles No && killall Finder`

- 3,初始化代码
    - `touch main.m`
    - `git add main.m`

- 4, 查看文件的状态`git status`
    - `Untracked files`(红色文件):新添加的文件或者新修改的文件在子`工作区`(Working Directory)中, 没有被添加到`暂缓区`(stage舞台)
    - `Changes to be committed`(绿色):将`工作区`的代码已经添加到`暂缓区`中, 可以被提交到`分支`(master)中

    -  提交到本地`分支(master)`
        - `git commit -m "初始化项目"`

        - 版本库概念(Repository)
            - `暂缓区`(stage舞台)
            - `分支`(master):git自动创建的第一个分支
            - `HEAD`指针:用于指向当前分支

- 5, 修改文件
    - `open main.m`

- 6, 将工作区中所有的文件添加到暂缓区中
    - `git add .`
    - `git commit -m "添加了age属性"`添加到分支当中

- 7, 给git命令起别名
    - `git config alias.st "status"`
    - `git config alias.ci "commit -m"`

- 8, 查看历史版本
    - `git log`
    - git 版本号 `asdfds34534fgdhfg345123dsfd`
    - git 版本号是由sha1加密算法生成的一个40位的哈希值
    - `git reflog`
    ```objc
    git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```
- 9, 版本回退
    - `git reset --hard HEAD`回退到当前版本
    - `git reset --hard HEAD^` 回退到上一个版本
    - `git reset --hard HEAD~100` 前100个版本
    - `git reset --hard 版本号前七位`

- 10, `--global`的作用(配置全局的用户名和密码, 其他地方可以不配置)
    - `git config --global user.name "alan"`
    - `git config --global user.email "64hp@163.com"`

# git本地操作

```objc


02. GIT命令行帮助
================================================================================
$ git help
查看git所有命令的帮助
$ git help 子命令

# 要退出帮助信息，按"q"
# 翻看下页，按"空格"
# 翻看上页，按"CTRL+B"
# 要搜索相关文字，按"/"然后输入"相关文字"

03. 创建代码库 & 配置个人信息
================================================================================
1>  创建代码仓库
$ git init

2>  配置用户名和邮箱
$ git config user.name manager
$ git config user.email manager@gmail.com

* 以上两个命令会将用户信息保存在当前代码仓库中

3>  如果要一次性配置完成可以使用一下命令
$ git config --global user.name manager
$ git config --global user.email manager@gmail.com

* 以上两个命令会将用户信息保存在用户目录下的 .gitconfig 文件中

4>  查看当前所有配置
$ git config -l

04. 实际开发
================================================================================
1>  创建代码，开始开发
$ touch main.c
$ open main.c

2>  将代码添加到代码库
# 查看当前代码库状态
$ git status
# 将文件添加到代码库
$ git add main.c
# 将修改提交到代码库
$ git commit -m "添加了main.c"

提示：
*   在此一定要使用 -m 参数指定修改的备注信息
*   否则会进入 vim 编辑器，如果对vim不熟悉，会是很糟糕的事情

# 将当前文件夹下的所有新建或修改的文件一次性添加到代码库
$ git add .

3>  添加多个文件
$ touch Person.h Person.m
$ git add .
$ git commit -m "添加了Person类"
$ open Person.h
$ git add .
$ git commit -m "增加Person类属性"

* 注意 使用git时，每一次修改都需要添加再提交，这一点是与svn不一样的

git 的重要概念及工作原理
--------------------------------------------------------------------------------
工作区
暂存区(staged)
分支(HEAD)

05. 别名 & 日志
================================================================================
$ git config alias.st status
$ git config alias.ci "commit -m"

除非特殊原因，最好不要设置别名，否则换一台机器就不会用了

# 查看所有版本库日志
$ git log
# 查看指定文件的版本库日志
$ git log 文件名

# 配置带颜色的log别名
git config --global alias.lg "log --color --graph
--pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold
blue)<%an>%Creset' --abbrev-commit"

提示：在git中，版本号是一个由SHA1生成的哈希值

06. 版本号，让我们在任意版本之间穿梭
================================================================================
# 回到当前版本，放弃所有没有提交的修改
$ git reset --hard HEAD
# 回到上一个版本
$ git reset --hard HEAD^
# 回到之前第3个修订版本
$ git reset --hard HEAD~3
# 回到指定版本号的版本
$ git reset --hard e695b67

# 查看分支引用记录
$ git reflog

```
