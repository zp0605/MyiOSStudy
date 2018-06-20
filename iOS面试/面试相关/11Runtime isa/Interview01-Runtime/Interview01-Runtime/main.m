//
//  main.m
//  Interview01-Runtime
//
//  Created by MJ Lee on 2018/5/17.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import <objc/runtime.h>

// 编写代码 -> 编译链接 -> 运行

// Runtime：运行时
// 提供了一套C语言API


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *person = [[MJPerson alloc] init];
        person.rich = YES;
        person.tall = NO;
        person.handsome = NO;
        
        NSLog(@"tall:%d rich:%d hansome:%d", person.isTall, person.isRich, person.isHandsome);
//        person.tall = YES;
//        person.rich = YES;
//        person.handsome = NO;
        
//        NSLog(@"%zd", class_getInstanceSize([MJPerson class]));
    }
    return 0;
}
