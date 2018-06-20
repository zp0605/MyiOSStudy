//
//  main.m
//  Interview01-Runtime
//
//  Created by MJ Lee on 2018/5/17.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import <objc/runtime.h>

union Date {
    int year;
    char month;
};


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        union Date date;
//        date.month = 1;
//        date.year = 2011;
//
        
        MJPerson *person = [[MJPerson alloc] init];
        person.thin = YES;
        person.rich = YES;
        person.handsome = NO;
        
        NSLog(@"thin:%d rich:%d hansome:%d", person.isThin, person.isRich, person.isHandsome);
    }
    return 0;
}
