//
//  main.m
//  Interview03-Category
//
//  Created by MJ Lee on 2018/5/3.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson+Eat.h"
#import "MJPerson+Test.h"
#import "MJPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *person = [[MJPerson alloc] init];
        [person run];
//        objc_msgSend(person, @selector(run));
//        [person test];
//        [person eat];
//        objc_msgSend(person, @selector(eat));
        
        // 通过runtime动态将分类的方法合并到类对象、元类对象zhong 
    }
    return 0;
}
