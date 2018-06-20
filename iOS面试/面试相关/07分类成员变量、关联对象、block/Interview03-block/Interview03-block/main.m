//
//  main.m
//  Interview03-block
//
//  Created by MJ Lee on 2018/5/9.
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
struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
};

struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    int age;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        ^{
//            NSLog(@"this is a block!");
//            NSLog(@"this is a block!");
//            NSLog(@"this is a block!");
//            NSLog(@"this is a block!");
//        }();
        
        int age = 20;
        
        void (^block)(int, int) =  ^(int a , int b){
            NSLog(@"this is a block! -- %d", age);
            NSLog(@"this is a block!");
            NSLog(@"this is a block!");
            NSLog(@"this is a block!");
        };
        
        
        
        struct __main_block_impl_0 *blockStruct = (__bridge struct __main_block_impl_0 *)block;
        
        
        
        block(10, 10);
    }
    return 0;
}
