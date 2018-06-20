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
        NSLog(@"---------------");
        [MJStudent load];
//        objc_msgSend();
        // isa
        // superclass
        // superclass
        
//        objc_msgSend([MJStudent class], @selector(load));
        
        // isa
        // superclass
        
//        objc_msgSend([MJPerson class], @selector(test));
        
//        printMethodNamesOfClass(object_getClass([MJPerson class]));
    }
    return 0;
}
