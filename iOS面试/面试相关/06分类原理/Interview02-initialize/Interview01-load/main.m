//
//  main.m
//  Interview01-load
//
//  Created by MJ Lee on 2018/5/5.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import "MJStudent.h"
#import "MJTeacher.h"
#import <objc/runtime.h>

void printMethodNamesOfClass(Class cls)
{
    unsigned int count;
    // 获得方法数组
    Method *methodList = class_copyMethodList(cls, &count);
    
    // 存储方法名
    NSMutableString *methodNames = [NSMutableString string];
    
    // 遍历所有的方法
    for (int i = 0; i < count; i++) {
        // 获得方法
        Method method = methodList[i];
        // 获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        // 拼接方法名
        [methodNames appendString:methodName];
        [methodNames appendString:@", "];
    }
    
    // 释放
    free(methodList);
    
    // 打印方法名
    NSLog(@"%@ %@", cls, methodNames);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        BOOL sutdentInitialized = NO;
//        BOOL personInitialized = NO;
//        BOOL teacherInitialized = NO;
        
        [MJStudent alloc];
        
//        if (!sutdentInitialized) {
//            if (!personInitialized) {
//                objc_msgSend([MJPerson class], @selector(initialize));
//                personInitialized = YES;
//            }
//
//            objc_msgSend([MJStudent class], @selector(initialize));
//            sutdentInitialized = YES;
//        }
        
        [MJTeacher alloc];
        
//        if (!teacherInitialized) {
//            if (!personInitialized) {
//                objc_msgSend([MJPerson class], @selector(initialize));
//                personInitialized = YES;
//            }
//
//            objc_msgSend([MJTeacher class], @selector(initialize));
//            teacherInitialized = YES;
//        }
        
        // MJPerson (Test2) +initialize
//        objc_msgSend([MJPerson class], @selector(initialize));
//        // MJPerson (Test2) +initialize
//        objc_msgSend([MJStudent class], @selector(initialize));
//        // MJPerson (Test2) +initialize
//        objc_msgSend([MJTeacher class], @selector(initialize));
        
//        [MJPerson alloc];
        
        // isa -> 类对象\元类对象，寻找方法，调用
        // superclass -> 类对象\元类对象，寻找方法，调用
        // superclass -> 类对象\元类对象，寻找方法，调用
        // superclass -> 类对象\元类对象，寻找方法，调用
        // superclass -> 类对象\元类对象，寻找方法，调用
        
//        objc_msgSend([MJPerson class], @selector(alloc));
        
        
        
        
//        objc_msgSend([MJPerson class], @selector(initialize));
//        objc_msgSend([MJStudent class], @selector(initialize));
        
//        [MJPerson alloc];
//        [MJPerson alloc];
//        [MJStudent alloc];
//        [MJStudent alloc];
    }
    return 0;
}
