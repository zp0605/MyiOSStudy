//
//  main.m
//  Interview04-方法
//
//  Created by MJ Lee on 2018/5/29.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import <objc/runtime.h>


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *person = [[MJPerson alloc] init];
        
        Method runMethod = class_getInstanceMethod([MJPerson class], @selector(run));
        Method testMethod = class_getInstanceMethod([MJPerson class], @selector(test));
        method_exchangeImplementations(runMethod, testMethod);

        [person run];
    }
    return 0;
}

void myrun()
{
    NSLog(@"---myrun");
}

void test()
{
    MJPerson *person = [[MJPerson alloc] init];
    
    //        class_replaceMethod([MJPerson class], @selector(run), (IMP)myrun, "v");
    
    
    class_replaceMethod([MJPerson class], @selector(run), imp_implementationWithBlock(^{
        NSLog(@"123123");
    }), "v");
    
    [person run];
}
