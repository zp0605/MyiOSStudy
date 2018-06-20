//
//  NSKVONotifying_MJPerson.m
//  Interview01
//
//  Created by MJ Lee on 2018/4/23.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "NSKVONotifying_MJPerson.h"

@implementation NSKVONotifying_MJPerson

- (void)setAge:(int)age
{
    _NSSetIntValueAndNotify();
}

// 屏幕内部实现，隐藏了NSKVONotifying_MJPerson类的存在
- (Class)class
{
    return [MJPerson class];
}

- (void)dealloc
{
    // 收尾工作
}

- (BOOL)_isKVOA// 私有方法_isKVOA 是用来标示该类是一个KVO 机制声称的类
{
   // return NO;
    return YES;
}


@end
