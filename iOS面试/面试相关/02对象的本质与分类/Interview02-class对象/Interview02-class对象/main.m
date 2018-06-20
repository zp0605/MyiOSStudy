//
//  main.m
//  Interview02-class对象
//
//  Created by MJ Lee on 2018/4/8.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface MJPerson : NSObject
{
    int _age;
    int _height;
    int _no;
}
@end

@implementation MJPerson
- (void)test{
    
}
@end
/*
OC的类信息存放在哪里？
对象方法、属性、成员变量、协议信息，存放在class对象中
类方法，存放在meta-class对象中
成员变量的具体值，存放在instance对象
*/

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *object1 = [[NSObject alloc] init];
        NSObject *object2 = [[NSObject alloc] init];
        
        Class objectClass1 = [object1 class];
        Class objectClass2 = [object2 class];
        Class objectClass3 = object_getClass(object1);
        Class objectClass4 = object_getClass(object2);
        Class objectClass5 = [NSObject class];
        
        NSLog(@"%p %p",
              object1,
              object2);
        
        NSLog(@"%p %p %p %p %p",
              objectClass1,
              objectClass2,
              objectClass3,
              objectClass4,
              objectClass5);
    }
    return 0;
}
