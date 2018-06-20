//
//  main.m
//  Interview03-Category
//
//  Created by MJ Lee on 2018/5/3.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson+Eat.h"
#import "MJPerson+Test.h"
#import "MJPerson.h"

/*
 Category的使用场合是什么？
 
 Category的实现原理
 Category编译之后的底层结构是struct category_t，里面存储着分类的对象方法、类方法、属性、协议信息
 在程序运行的时候，runtime会将Category的数据，合并到类信息中（类对象、元类对象中）
 
 Category和Class Extension的区别是什么？
 Class Extension在编译的时候，它的数据就已经包含在类信息中
 Category是在运行时，才会将数据合并到类信息中

 
 Category中有load方法吗？load方法是什么时候调用的？load 方法能继承吗？
 有load方法
 load方法在runtime加载类、分类的时候调用
 load方法可以继承，但是一般情况下不会主动去调用load方法，都是让系统自动调用
 
 load、initialize方法的区别什么？它们在category中的调用的顺序？以及出现继承时他们之间的调用过程？
 
 
 Category能否添加成员变量？如果可以，如何给Category添加成员变量？
 不能直接给Category添加成员变量，但是可以间接实现Category有成员变量的效果

 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *person = [[MJPerson alloc] init];
        [person run];
//        objc_msgSend(person, @selector(run));
//        [person test];
//        [person eat];
//        objc_msgSend(person, @selector(eat));
        
        // 通过runtime动态将分类的方法合并到类对象、元类对象zhong 
    }
    return 0;
}
