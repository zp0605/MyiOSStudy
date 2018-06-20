//
//  main.m
//  Interview01-OC对象的本质
//
//  Created by MJ Lee on 2018/4/1.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

// NSObject Implementation
struct NSObject_IMPL {
    Class isa; // 8个字节
};
// 指针
// typedef struct objc_class *Class;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc] init];
        // 16个字节
        
        // 获得NSObject实例对象的成员变量所占用的大小 >> 8
        NSLog(@"%zd", class_getInstanceSize([NSObject class]));
        
        // 获得obj指针所指向内存的大小 >> 16
        NSLog(@"%zd", malloc_size((__bridge const void *)obj));
        
        // 什么平台的代码
        // 不同平台支持的代码肯定是不一样
        // Windows、mac、iOS
        // 模拟器(i386)、32bit(armv7)、64bit（arm64）
    }
    return 0;
}
