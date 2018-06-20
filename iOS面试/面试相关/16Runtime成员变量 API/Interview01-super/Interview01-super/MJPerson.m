//
//  MJPerson.m
//  Interview01-super
//
//  Created by MJ Lee on 2018/5/29.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "MJPerson.h"
#import <objc/runtime.h>

@implementation MJPerson

// LLVM
// OC -> 中间代码（.ll） -> 汇编、机器代码

void test(int param)
{
    
}

//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
//{
//    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
//}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    [super forwardInvocation:anInvocation];
    // 查看汇编
    // objc_msgSendSuper2(struct, @selector(forwardInvocation:), anInvocation)
    
    // 转为cpp文件
//    objc_msgSendSuper({self, class_getSuperclass(objc_getClass("MJPerson"))},
//                      @selector(forwardInvocation:),
//                      anInvocation);
    
    int a = 10;
    int b = 20;
    int c = a + b;
    test(c);
}

@end
