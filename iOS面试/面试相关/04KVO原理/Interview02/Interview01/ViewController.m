//
//  ViewController.m
//  Interview01
//
//  Created by MJ Lee on 2018/4/23.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "ViewController.h"
#import "MJPerson.h"

@interface ViewController ()
@property (strong, nonatomic) MJPerson *person1;
@property (strong, nonatomic) MJPerson *person2;
@end

@implementation ViewController
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person1 = [[MJPerson alloc] init];
    self.person1.age = 1;
    
    self.person2 = [[MJPerson alloc] init];
    self.person2.age = 2;
    
    // 给person1对象添加KVO监听
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.person1 addObserver:self forKeyPath:@"age" options:options context:@"123"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    self.person1.age = 21;
//    self.person2.age = 22;
    
    // NSKVONotifying_MJPerson是使用Runtime动态创建的一个类，是MJPerson的子类
    
    // self.person1.isa == NSKVONotifying_MJPerson;//自己实现的类
    [self.person1 setAge:21];
    
  //  self.person2.isa = MJPerson;
    [self.person2 setAge:22];
}

- (void)dealloc {
    [self.person1 removeObserver:self forKeyPath:@"age"];
}

// 当监听对象的属性值发生改变时，就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
}

@end
