//
//  main.m
//  Interview01-class
//
//  Created by MJ Lee on 2018/5/27.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import <objc/runtime.h>

//@implementation NSObject
//
//- (BOOL)isMemberOfClass:(Class)cls {
//    return [self class] == cls;
//}
//
//- (BOOL)isKindOfClass:(Class)cls {
//    for (Class tcls = [self class]; tcls; tcls = tcls->superclass) {
//        if (tcls == cls) return YES;
//    }
//    return NO;
//}
//
//
//+ (BOOL)isMemberOfClass:(Class)cls {
//    return object_getClass((id)self) == cls;
//}
//
//
//+ (BOOL)isKindOfClass:(Class)cls {
//    for (Class tcls = object_getClass((id)self); tcls; tcls = tcls->superclass) {
//        if (tcls == cls) return YES;
//    }
//    return NO;
//}
//@end

//void test(id obj)
//{
//    if ([obj isMemberOfClass:[MJPerson class]]) {
//
//    }
//}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSLog(@"%d", [[NSObject class] isKindOfClass:[NSObject class]]);
//        NSLog(@"%d", [[NSObject class] isMemberOfClass:[NSObject class]]);
//        NSLog(@"%d", [[MJPerson class] isKindOfClass:[MJPerson class]]);
//        NSLog(@"%d", [[MJPerson class] isMemberOfClass:[MJPerson class]]);
        
        
        // 这句代码的方法调用者不管是哪个类（只要是NSObject体系下的），都返回YES
        NSLog(@"%d", [NSObject isKindOfClass:[NSObject class]]); // 1
        NSLog(@"%d", [NSObject isMemberOfClass:[NSObject class]]); // 0
        NSLog(@"%d", [MJPerson isKindOfClass:[MJPerson class]]); // 0
        NSLog(@"%d", [MJPerson isMemberOfClass:[MJPerson class]]); // 0
        
        
//        id person = [[MJPerson alloc] init];
        
//        NSLog(@"%d", [person isMemberOfClass:[MJPerson class]]);
//        NSLog(@"%d", [person isMemberOfClass:[NSObject class]]);
        
//        NSLog(@"%d", [person isKindOfClass:[MJPerson class]]);
//        NSLog(@"%d", [person isKindOfClass:[NSObject class]]);
        
        
//        NSLog(@"%d", [MJPerson isMemberOfClass:object_getClass([MJPerson class])]);
//        NSLog(@"%d", [MJPerson isKindOfClass:object_getClass([NSObject class])]);
        
//        NSLog(@"%d", [MJPerson isKindOfClass:[NSObject class]]);
    }
    return 0;
}
