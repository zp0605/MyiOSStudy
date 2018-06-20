//
//  main.m
//  Interview01-Category的成员变量
//
//  Created by MJ Lee on 2018/5/9.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import "MJPerson+Test.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *person = [[MJPerson alloc] init];
        person.age = 10;
        person.weight = 40;
        
        
        MJPerson *person2 = [[MJPerson alloc] init];
        person2.age = 20; // 20是存储在peron2对象内部
        person2.weight = 50; // 50是存放在全局的字典对象里面
        
        NSLog(@"person - age is %d, weight is %d", person.age, person.weight);
        NSLog(@"person2 - age is %d, weight is %d", person2.age, person2.weight);
    }
    return 0;
}
