# My_Questions

```cmd
Q:我的SVN服务器换地址了,我在客户端要做什么变化?

A:
1,将当前的用户在SVN客户端当前路径切换到当初更新SVN的位置上.
2,执行命令:svn switch --relocate (Old Repository Root) (New Repository Root)
Old Repository Root可以通过:svn info来查看.
3,svn update就可以正常的更新你的系统了.

附SVN INFO的内容范例:
$ svn info
Path: .
URL: http://svn.svn.com/ProjectName/Trunk/Project
Repository Root: http://svn.svn.com/ProjectName
Repository UUID: 149e7728-2900-0410-bded-c30b68e36566
Revision: Numbver
Node Kind: directory
Schedule: normal
Last Changed Author: Programmer Nme
Last Changed Rev: Number
Last Changed Date: 2009-02-14 12:39:08 +0800 (Sat, 14 Feb 2009)

```



