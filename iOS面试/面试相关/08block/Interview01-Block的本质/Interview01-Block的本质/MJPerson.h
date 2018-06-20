//
//  MJPerson.h
//  Interview01-Block的本质
//
//  Created by MJ Lee on 2018/5/10.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJPerson : NSObject
@property (copy, nonatomic) NSString *name;

- (instancetype)initWithName:(NSString *)name;
@end
