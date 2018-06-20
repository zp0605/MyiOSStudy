//
//  main.m
//  Interview01-block的copy
//
//  Created by MJ Lee on 2018/5/12.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

typedef void (^MJBlock)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        MJBlock block;
//
//        {
//            MJPerson *person = [[MJPerson alloc] init];
//            person.age = 10;
//
//            __weak MJPerson *weakPerson = person;
//            block = ^{
//                NSLog(@"---------%d", weakPerson.age);
//            };
//        }
//
//        NSLog(@"------");
        
        MJBlock block;
        
        {
            MJPerson *person = [[MJPerson alloc] init];
            person.age = 10;
            
//            __weak MJPerson *weakPerson = person;
            int age = 10;
            block = ^{
                NSLog(@"---------%d", person.age);
            };
        }
        
        NSLog(@"------");
    }
    return 0;
}
