//
//  ViewController.m
//  补充Demo
//
//  Created by sherry on 15/11/16.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //准备字符串
    NSString * foo = @"I love my iOS teacher";
    //1.获取C字符串（MD5加密基于C语言实现，Foundation框架字符串需要转化）
    const char * fooData = [foo UTF8String];//__strong const char *UTF8String,C语言无法持有字符串，必须用__strong修饰来拷贝内容
    //2.创建字符串数组接收MD5值
    //一个字节是8位，两个字节是16位，两个字符可以表示一个16位进制的数，MD5结果为32位，实际上由16位16进制数组成。
    unsigned char resut[CC_MD5_DIGEST_LENGTH];
    //3.计算MD5值(结果存储在result数组中)
    CC_MD5(fooData, (CC_LONG)strlen(fooData), resut);
    //4.获取摘要值
    NSMutableString *bar = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i ++) {
        
        [bar appendFormat:@"%02X",resut[i]];
    }
    NSLog(@"%@",bar);
    
    
    //1.NSData对象获取
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"上心" ofType:@"mp3"];
    //创建Data对象
    NSData *data = [NSData dataWithContentsOfFile:path];
    //或者使用此方法也可以获取Data对象，
    //NSFileHandle *handle = [NSFileHandle fileHandleForReadingAtPath:path];
    //NSData *data = [handle readDataToEndOfFile];
    //2.创建MD5变量
    CC_MD5_CTX md5;
    //3.初始化MD5变量
    CC_MD5_Init(&md5);
    //4.准备MD5加密
    CC_MD5_Update(&md5, data.bytes, (CC_LONG)data.length);
    //5.结束MD5加密
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5_Final(result, &md5);
    //6.获取结果
    NSMutableString *resultString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i ++) {
        
        [resultString appendFormat:@"%02X",result[i]];
        
    }
    NSLog(@"%@",resultString);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
