//
//  MJPerson.h
//  Interview01-KVC
//
//  Created by MJ Lee on 2018/5/3.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJCat : NSObject
@property (assign, nonatomic) int weight;
@end

@interface MJPerson : NSObject
@property (assign, nonatomic) int age;

@property (assign, nonatomic) MJCat *cat;
@end
