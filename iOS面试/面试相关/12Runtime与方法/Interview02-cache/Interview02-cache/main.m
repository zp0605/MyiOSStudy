//
//  main.m
//  Interview02-cache
//
//  Created by MJ Lee on 2018/5/19.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *person = [[MJPerson alloc] init];
        
        [person personTest];
        [person personTest2];
        [person personTest3];
        
        NSLog(@"%p", @selector(personTest));
        
        [person personTest];
        [person personTest2];
        [person personTest3];
    }
    return 0;
}
