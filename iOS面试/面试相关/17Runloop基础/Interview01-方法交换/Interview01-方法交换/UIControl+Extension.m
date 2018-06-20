//
//  UIControl+Extension.m
//  Interview01-方法交换
//
//  Created by MJ Lee on 2018/5/31.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "UIControl+Extension.h"
#import <objc/runtime.h>

@implementation UIControl (Extension)

+ (void)load
{
    // hook：钩子函数
    Method method1 = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method method2 = class_getInstanceMethod(self, @selector(mj_sendAction:to:forEvent:));
    method_exchangeImplementations(method1, method2);
}

- (void)mj_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    NSLog(@"%@-%@-%@", self, target, NSStringFromSelector(action));
    
    // 调用系统原来的实现
    [self mj_sendAction:action to:target forEvent:event];
    
//    [target performSelector:action];
    
//    if ([self isKindOfClass:[UIButton class]]) {
//        // 拦截了所有按钮的事件
//
//    }
}

@end
