//
//  main.m
//  Interview01-Block的本质
//
//  Created by MJ Lee on 2018/5/10.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

/*
 一切以运行时的结果为准
 
 clang c++

 
 llvm x.0 中间文件
 */
void (^block)(void);
void test2()
{
    
    // NSStackBlock
    int age = 10;
    block = [^{
        NSLog(@"block---------%d", age);
    } copy];
    [block release];
}

void test()
{
    // Global：没有访问auto变量
    void (^block1)(void) = ^{
        NSLog(@"block1---------");
    };
    
    // Stack：访问了auto变量
    int age = 10;
    void (^block2)(void) = ^{
        NSLog(@"block2---------%d", age);
    };
    NSLog(@"%p", [block2 copy]);
    
//    NSLog(@"%@ %@", [block1 class], [block2 class]);
}

int age = 10;

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a = 10;
        
        NSLog(@"数据段：age %p", &age);
        NSLog(@"栈：a %p", &a);
        NSLog(@"堆：obj %p", [[NSObject alloc] init]);
        NSLog(@"数据段：class %p", [MJPerson class]);
        
        
//        test2();
//
//        block();
        
//        MJPerson *p = [[MJPerson alloc] init];
//        p.block = ^{
//
//        };
//
//        test();
    }
    return 0;
}
