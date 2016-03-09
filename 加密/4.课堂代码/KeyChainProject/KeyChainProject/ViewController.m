//
//  ViewController.m
//  KeyChainProject
//
//  Created by 齐路军 on 15/10/20.
//  Copyright (c) 2015年 齐路军. All rights reserved.
//

#import "ViewController.h"
#import "KeychainItemWrapper.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //创建并初始化
    KeychainItemWrapper * wrapper = [[KeychainItemWrapper alloc]
               initWithIdentifier:@"MyKeychainItem"
               accessGroup:nil];
    //系统提供的键值对中的两个键,非系统的键是没法添加到字典中的
    id kUsernameKey = (__bridge id)kSecAttrAccount;
    id kPasswordKey = (__bridge id)kSecValueData;
    //存值
  //  [wrapper setObject:@"user" forKey:kUsernameKey];
  //  [wrapper setObject:@"123" forKey:kPasswordKey];
    
    //通过相同 的标记创建的钥匙串中具有相同的数据,可以看做是一个对象
    KeychainItemWrapper *
    wrapper2 = [[KeychainItemWrapper alloc]
                initWithIdentifier:@"MyKeychainItem"
                accessGroup:nil];
    //取值
    NSString *username = [wrapper2 objectForKey:kUsernameKey];
    NSLog(@"用户名为%@",username);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
