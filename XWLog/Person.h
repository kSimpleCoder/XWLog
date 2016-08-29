//
//  Person.h
//  NKLog
//
//  Created by 刘小武 on 16/8/29.
//  Copyright © 2016年 NorthKing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *address;

@end
