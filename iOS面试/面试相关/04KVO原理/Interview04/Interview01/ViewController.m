//
//  ViewController.m
//  Interview01
//
//  Created by MJ Lee on 2018/4/23.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "ViewController.h"
#import "MJPerson.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (strong, nonatomic) MJPerson *person1;
@property (strong, nonatomic) MJPerson *person2;
@end

//@implementation NSObject
//
//- (Class)class
//{
//    return object_getClass(self);
//}
//
//@end

// 反编译工具 - Hopper
/*
 iOS用什么方式实现对一个对象的KVO？(KVO的本质是什么？)
 利用RuntimeAPI动态生成一个子类，并且让instance对象的isa指向这个全新的子类
 当修改instance对象的属性时，会调用Foundation的_NSSetXXXValueAndNotify函数
 willChangeValueForKey:
 父类原来的setter
 didChangeValueForKey:
 内部会触发监听器（Oberser）的监听方法( observeValueForKeyPath:ofObject:change:context:）
 
 
 
 如何手动触发KVO？
 手动调用willChangeValueForKey:和didChangeValueForKey:
 
 
 直接修改成员变量会触发KVO么？
 不会触发KVO
 
 */
@implementation ViewController

- (void)printMethodNamesOfClass:(Class)cls
{
    unsigned int count;
    // 获得方法数组
    Method *methodList = class_copyMethodList(cls, &count);
    
    // 存储方法名
    NSMutableString *methodNames = [NSMutableString string];
    
    // 遍历所有的方法
    for (int i = 0; i < count; i++) {
        // 获得方法
        Method method = methodList[i];
        // 获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        // 拼接方法名
        [methodNames appendString:methodName];
        [methodNames appendString:@", "];
    }
    
    // 释放
    free(methodList);
    
    // 打印方法名
    NSLog(@"%@ %@", cls, methodNames);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person1 = [[MJPerson alloc] init];
    self.person1.age = 1;
    
    self.person2 = [[MJPerson alloc] init];
    self.person2.age = 2;
    
    // 给person1对象添加KVO监听
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:@"123"];
    
    [self printMethodNamesOfClass:object_getClass(self.person1)];
    [self printMethodNamesOfClass:object_getClass(self.person2)];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self.person1 setAge:21];
    
    
    //手动触发KVC
    [self.person1 willChangeValueForKey:@"age"];
    [self.person1 didChangeValueForKey:@"age"];
}

- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
}

// observeValueForKeyPath:ofObject:change:context:
// 当监听对象的属性值发生改变时，就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
}

@end
