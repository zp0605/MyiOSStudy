//
//  main.m
//  Interview01-Block的本质
//
//  Created by MJ Lee on 2018/5/10.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 block的原理是怎样的？本质是什么？
 封装了函数调用以及调用环境的OC对象
 
 __block的作用是什么？有什么使用注意点？
 
 block的属性修饰词为什么是copy？使用block有哪些使用注意？
 block一旦没有进行copy操作，就不会在堆上
 使用注意：循环引用问题
 
 block在修改NSMutableArray，需不需要添加__block？
 
 */

int age_ = 10;
static int height_ = 10;

void (^block)(void);

void test()
{
    auto int a = 10;
    static int b = 10;
    block = ^{
        NSLog(@"age is %d, height is %d", a, b);
    };
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        test();
//        block();
        
        void (^block1)(void) = ^{
            NSLog(@"age is %d, height is %d", age_, height_);
        };

        age_ = 20;
        height_ = 20;

        block1();
    }
    return 0;
}
