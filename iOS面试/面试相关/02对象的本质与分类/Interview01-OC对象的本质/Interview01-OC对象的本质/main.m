//
//  main.m
//  Interview01-OC对象的本质
//
//  Created by MJ Lee on 2018/4/8.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <malloc/malloc.h>
#import <objc/runtime.h>

//struct NSObject_IMPL
//{
//    Class isa;
//};
//
//struct MJPerson_IMPL
//{
//    struct NSObject_IMPL NSObject_IVARS; // 8
//    int _age; // 4
//    int _height; // 4
//    int _no; // 4
//}; // 24

struct NSObject_IMPL {
    Class isa;
};

struct MJPerson_IMPL {
    struct NSObject_IMPL NSObject_IVARS;
    int _age;
    int _height;
    int _no;
}; // 计算结构体大小，内存对齐，24

//struct MJStudent_IMPL
//{
//    struct MJPerson_IMPL MJPerson_IVARS;
//    int _weight;
//};

@interface MJPerson : NSObject
{
    int _age;//8
    int _height;//8
    int _no;//8
}
@end

//@interface MJStudent : MJPerson
//{
//    int _weight;
//}
//@end

@implementation MJPerson

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJPerson *p = [[MJPerson alloc] init];
        
        NSLog(@"%zd", sizeof(struct MJPerson_IMPL)); // 24
        
        NSLog(@"%zd %zd",
              class_getInstanceSize([MJPerson class]), // 24
              malloc_size((__bridge const void *)(p))); // 32 = 指针（8）+24
    }
    return 0;
}
