//
//  Person.h
//  NKLog
//
//  Created by 刘小武 on 16/8/29.
//  Copyright © 2016年 NorthKing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

/**
 *  年龄
 */
@property (nonatomic, assign) int age;
/**
 *  性别
 */
@property (nonatomic, copy) NSString *gender;
/**
 *  名字
 */
@property (nonatomic, copy) NSString *name;
/**
 *  地址
 */
@property (nonatomic, copy) NSString *address;

@end
