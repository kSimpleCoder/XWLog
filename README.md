1.重写的description方法  可以直接打印模型   2.给定字典自动生成带有注释的属性列表
1、检查赋值信息 (直接打印模型)

    Person *person = [[Person alloc] init];
    person.name    = @"Lucy";
    person.age    = 27;
    person.gender  = @"女";
    person.address = @"北京-朝阳";
    NSLog(@"%@",person);

2、配合网络解析 检查赋值情况(直接打印模型)

    NSString *jsonString = @"{\"name\":\"Jack\", \"age\":28, \"gender\":\"男\", \"address\":\"北京-朝阳\",}";
    Person *person = [Person mj_objectWithKeyValues:jsonString];
    NSLog(@"%@",person);
<img src="https://github.com/kSimpleCoder/XWLog/blob/master/description.png" width = "480" alt="图片描述" align=center />

3、任意对象调用 propertiesCodeWithDict 传入想要生成属性的字典即可

    NSString *jsonString = @"{\"name\":\"Jack\", \"age\":28, \"gender\":\"男\", \"address\":\"北京-朝阳\",}";
    NSData *data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    [NSObject propertiesCodeWithDict:dict];
<img src="https://github.com/kSimpleCoder/XWLog/blob/master/property1.png" width = "320" alt="图片描述" align=center />
<img src="https://github.com/kSimpleCoder/XWLog/blob/master/property2.png" width = "320" alt="图片描述" align=center />
