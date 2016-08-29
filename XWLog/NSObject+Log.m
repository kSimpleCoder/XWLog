//
//  NSObject+Log.m
//  BPO_iOS
//
//  Created by 刘小武 on 16/8/15.
//  Copyright © 2016年 NorthKing. All rights reserved.
//

#import "NSObject+Log.h"
#import <objc/runtime.h>

@implementation NSObject (Log)

//打印
- (NSString *)description {
    NSString *className = NSStringFromClass([self class]);
    NSLog(@"======== 以下是%@类的赋值信息 ========\n",className);
    unsigned int outCount = 0;
    int unAssignmentCount = 0;
    NSUInteger maxLength  = 0;
    Ivar *ivars = class_copyIvarList([self class], &outCount);
    NSMutableArray *nameArr  = [NSMutableArray array];
    NSMutableArray *valueArr = [NSMutableArray array];
    for (int i = 0; i < outCount; i++) {
        Ivar ivar = ivars[i];
        NSString *propertyName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        id value = [self valueForKey:propertyName];
        if (!value) {
            ++unAssignmentCount;
        }
        NSString *ivarName = [propertyName substringFromIndex:1];
        maxLength = ivarName.length > maxLength ? ivarName.length : maxLength;
        [nameArr addObject:ivarName];
        [valueArr addObject:value];
    }
    for (int i = 0; i < outCount; i++) {
        NSString *currentString = nameArr[i];
        NSUInteger currentLength = currentString.length;
        NSUInteger spaceNumber = maxLength - currentLength;
        for (int j = 0; j < spaceNumber; j++) {
            currentString = [NSString stringWithFormat:@"%@ ",currentString];
        }
        NSLog(@"%@ = %@",currentString, valueArr[i]);
    }
    return [NSString stringWithFormat:@"======== 共有%d个属性  其中%d个属性未赋值 ========",outCount, unAssignmentCount];
}

//自动生成代码
+ (void)propertiesCodeWithDict:(NSDictionary *)dict
{
    
    NSMutableString *strM = [NSMutableString string];
    NSString *description = @"/**\n *  <#Description#>\n */";
    
    // 遍历字典
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
        //        NSLog(@"%@ %@",propertyName,[value class]);
        NSString *code;
        NSString *classType = NSStringFromClass([value class]);
        if ([classType containsString:@"String"]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@;",propertyName]
            ;
        }else if ([classType containsString:@"Number"]){
            NSString *valueStr = [NSString stringWithFormat:@"%@",value];
            if ([valueStr containsString:@"."]) {
                code = [NSString stringWithFormat:@"@property (nonatomic, assign) CGFloat %@;",propertyName]
                ;
            } else {
                code = [NSString stringWithFormat:@"@property (nonatomic, assign) int %@;",propertyName]
                ;
            }
            
        }else if ([classType containsString:@"Array"]){
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",propertyName]
            ;
        }else if ([classType containsString:@"Dictionary"]){
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@;",propertyName]
            ;
        }else if ([classType containsString:@"Boolean"]){
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",propertyName]
            ;
        }
        [strM appendFormat:@"%@\n%@\n",description,code];
        
    }];
    
    NSLog(@"\n%@",strM);
}



@end
