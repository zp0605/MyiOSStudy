//
//  main.m
//  Interview03-isa
//
//  Created by MJ Lee on 2018/4/15.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

// MJPerson
@interface MJPerson : NSObject <NSCopying>
{
@public
    int _age;
}
@property (nonatomic, assign) int no;
- (void)personInstanceMethod;
+ (void)personClassMethod;
@end

@implementation MJPerson

- (void)test
{
    
}

- (void)personInstanceMethod
{
    
}
+ (void)personClassMethod
{
    
}
- (id)copyWithZone:(NSZone *)zone
{
    return nil;
}
@end

// MJStudent
@interface MJStudent : MJPerson <NSCoding>
{
@public
    int _weight;
}
@property (nonatomic, assign) int height;
- (void)studentInstanceMethod;
+ (void)studentClassMethod;
@end

@implementation MJStudent
- (void)test
{
    
}
- (void)studentInstanceMethod
{
    
}
+ (void)studentClassMethod
{
    
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    return nil;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
}
@end

struct mj_objc_class {
    Class isa;
    Class superclass;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // MJPerson类对象的地址：0x00000001000014c8
        // isa & ISA_MASK：0x00000001000014c8
        
        // MJPerson实例对象的isa：0x001d8001000014c9
        
        struct mj_objc_class *personClass = (__bridge struct mj_objc_class *)([MJPerson class]);
        
        struct mj_objc_class *studentClass = (__bridge struct mj_objc_class *)([MJStudent class]);
        
        NSLog(@"1111");
        
//        MJPerson *person = [[MJPerson alloc] init];
//
        
//        Class personClass = [MJPerson class];
        
//        struct mj_objc_class *personClass2 = (__bridge struct mj_objc_class *)(personClass);
//
//        Class personMetaClass = object_getClass(personClass);
//
//        NSLog(@"%p %p %p", person, personClass, personMetaClass);
//        MJStudent *student = [[MJStudent alloc] init];
    }
    return 0;
}
