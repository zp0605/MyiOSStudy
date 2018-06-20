//
//  main.m
//  Interview02-isa和superclass
//
//  Created by MJ Lee on 2018/4/15.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Test.h"

@interface MJPerson : NSObject

+ (void)test;

@end

@implementation MJPerson

//+ (void)test
//{
//    NSLog(@"+[MJPerson test] - %p", self);
//}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"[MJPerson class] - %p", [MJPerson class]);
        NSLog(@"[NSObject class] - %p", [NSObject class]);
        
        [MJPerson test];
//        objc_msgSend([MJPerson class], @selector(test))
        
        // isa -> superclass -> suerpclass -> superclass -> .... superclass == nil
        
        [NSObject test];
//        objc_msgSend([NSObject class], @selector(test))
    }
    return 0;
}
