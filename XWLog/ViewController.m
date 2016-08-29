//
//  ViewController.m
//  XWLog
//
//  Created by 刘小武 on 16/8/29.
//  Copyright © 2016年 NorthKing. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "Person.h"
#import "NSObject+Log.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

/*注：如果只用到打印模型的方法 不需要引入"NSObject+Log.h"*/
    [self descriptionTest1];
//    [self descriptionTest2];
//    [self propertiesTest];
    
}

// NO.1 检查赋值信息 (直接打印模型)
- (void)descriptionTest1 {
    Person *person = [[Person alloc] init];
    person.name    = @"Lucy";
    person.age     = 27;
    person.gender  = @"女";
    person.address = @"北京-朝阳";
    NSLog(@"%@",person);
}

// NO.2 配合网络解析 检查赋值情况(直接打印模型)
- (void)descriptionTest2 {
    NSString *jsonString = @"{\"name\":\"Jack\", \"age\":28, \"gender\":\"男\", \"address\":\"北京-朝阳\",}";
    Person *person = [Person mj_objectWithKeyValues:jsonString];
    NSLog(@"%@",person);
}

// NO.3 任意对象调用 propertiesCodeWithDict 传入想要生成属性的字典即可
- (void)propertiesTest {
    NSString *jsonString = @"{\"name\":\"Jack\", \"age\":28, \"gender\":\"男\", \"address\":\"北京-朝阳\",}";
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    [NSObject propertiesCodeWithDict:dict];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
