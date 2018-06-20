//
//  main.m
//  Interview01-__block
//
//  Created by MJ Lee on 2018/5/15.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // MRC不支持__weak的
        
        __block MJPerson *person = [[MJPerson alloc] init];
        
        NSMutableArray *array = [NSMutableArray array];
        
        person.age = 10;
        person.block = [^{
            NSLog(@"age is %d", person.age);
        } copy];
        
//        [person release];
        
        
//        __weak MJPerson *weakPerson = person;
        
        
        // __weak：不会产生强引用，指向的对象销毁时，会自动让指针置为nil
        // __unsafe_unretained：不会产生强引用，不安全，指向的对象销毁时，指针存储的地址值不变
        
//        __weak typeof(person) weakPerson = person;
//
//        person.block = ^{
//            NSLog(@"age is %d", weakPerson.age);
//        };
    }
    
    NSLog(@"111111111111");
    return 0;
}
