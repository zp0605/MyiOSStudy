//
//  main.m
//  Interview01-isa和superclass
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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJStudent *student = [[MJStudent alloc] init];
        
        
        
        [student test];
        

        [student personInstanceMethod];
        
        [student init];
        
        [MJStudent studentClassMethod];
        
        [MJStudent personClassMethod];
        
        [MJStudent load];
        
       // [MJStudent abc];
        
//        MJPerson *person = [[MJPerson alloc] init];
//        person->_age = 10;
//        [person personInstanceMethod];
//
//        [MJPerson personClassMethod];
//
//        // objc_msgSend([MJPerson class], @selector(personClassMethod))
//        // objc_msgSend(person, @selector(personInstanceMethod))
//
//        Class personClass = [MJPerson class];
//
//        Class personMetaClass = object_getClass(personClass);
        
//        NSLog(@"%p %p %p", person, personClass, personMetaClass);
    }
    return 0;
}
