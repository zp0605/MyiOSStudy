//
//  main.m
//  Interview03-动态方法解析
//
//  Created by MJ Lee on 2018/5/22.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

/*
讲一下OC的消息机制
   OC中的方法调用其实都是转成了objc_msgSend函数的调用，给receiver（方法调用者）发送了一条消息（selector方法名）
   objc_msgSend底层有3大阶段:
   消息发送（当前类、父类中查找）、动态方法解析、消息转发
 
 
消息转发机制流程：
      https://blog.csdn.net/coyote1994/article/details/52454600

什么是Runtime？平时项目中有用过么？
   OC是一门动态性比较强的编程语言，允许很多操作推迟到程序运行时再进行
   OC的动态性就是由Runtime来支撑和实现的，Runtime是一套C语言的API，封装了很多动态性相关的函数
   平时编写的OC代码，底层都是转换成了Runtime API进行调用
   具体应用:
     利用关联对象（AssociatedObject）给分类添加属性
     遍历类的所有成员变量（修改textfield的占位文字颜色、字典转模型、自动归档解档）
     交换方法实现（交换系统的方法）
     利用消息转发机制解决方法找不到的异常问题

 
 
 在一个函数找不到时，Objective-C提供了三种方式去补救：
     1、调用resolveInstanceMethod给个机会让类添加这个实现这个函数
     2、调用forwardingTargetForSelector让别的对象去执行这个函数
     3、调用methodSignatureForSelector（函数符号制造器）和forwardInvocation（函数执行器）
       灵活的将目标函数以其他形式执行。
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        MJPerson *person = [[MJPerson alloc] init];
//        [person test];
        
        [MJPerson test];
    }
    return 0;
}
