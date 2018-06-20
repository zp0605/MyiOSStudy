//
//  main.m
//  Interview01-KVC
//
//  Created by MJ Lee on 2018/5/3.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import "MJObserver.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJObserver *observer = [[MJObserver alloc] init];
        MJPerson *person = [[MJPerson alloc] init];
        
        // 添加KVO监听
        [person addObserver:observer forKeyPath:@"age" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:NULL];
        
        // 通过KVC修改age属性
        [person setValue:@10 forKey:@"age"];
        
        // setAge:
        
        // 移除KVO监听
        [person removeObserver:observer forKeyPath:@"age"];
        
        
//        person.age = 10;
        
//        NSLog(@"%@", [person valueForKey:@"age"]);
//        NSLog(@"%@", [person valueForKeyPath:@"cat.weight"]);
        
        
//        NSLog(@"%d", person.age);
        
//        [person setValue:[NSNumber numberWithInt:10] forKey:@"age"];
//        [person setValue:@10 forKey:@"age"];
//        person.cat = [[MJCat alloc] init];
//        [person setValue:@10 forKeyPath:@"cat.weight"];
        
//        NSLog(@"%d", person.age);
        
    
    }
    return 0;
}
