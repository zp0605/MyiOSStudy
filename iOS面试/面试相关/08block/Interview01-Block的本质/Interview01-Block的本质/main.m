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
void (^block)(void);


void test()
{
    int age = 10;
    static int height = 10;
    
    block = ^{
        // age的值捕获进来（capture）
        NSLog(@"age is %d, height is %d", age, height);
    };
    
    age = 20;
    height = 20;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        test();
//        block();
        
        
        // auto：自动变量，离开作用域就销毁
        auto int age = 10;
        static int height = 10;

        
        void (^block1)(void) = ^{
            // age的值捕获进来（capture）
            NSLog(@"age is %d, height is %d", age, height);
        };
        age = 20;
        height = 20;
   

        block1();

        
        void (^block2)(int, int) = ^(int a, int b){
            NSLog(@"Hello, World! - %d %d", a, b);
        };

        block2(10, 20);
        
        void (^block3)(void) = ^{
            NSLog(@"Hello, World!");
        };

        block3();
    }
    return 0;
}
