//
//  ViewController.m
//  Interview02-super
//
//  Created by MJ Lee on 2018/5/27.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "ViewController.h"
#import "MJPerson.h"

@interface ViewController ()

@end

@implementation ViewController

/*
 1.print为什么能够调用成功？
 
 2.为什么self.name变成了ViewController等其他内容
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    struct abc = {
//        self,
//        [ViewController class]
//    };
//    objc_msgSendSuper2(abc, sel_registerName("viewDidLoad"));
    
//    NSObject *obj2 = [[NSObject alloc] init];
//
//    NSString *test = @"123";
    
    id cls = [MJPerson class];

    void *obj = &cls;

    [(__bridge id)obj print];
    
//    long long *p = (long long *)obj;
//    NSLog(@"%p %p", *(p+2), [ViewController class]);
    
//    struct MJPerson_IMPL
//    {
//        Class isa;
//        NSString *_name;
//    };
}


@end
