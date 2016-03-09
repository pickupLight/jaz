//
//  ViewController.m
//  KVO
//
//  Created by sherry on 15/11/16.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置背景颜色
    self.view.backgroundColor = [UIColor redColor];
}

//触碰开始调用AppDelegate的makeBadgeValue方法,使角标数字加一
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //单例
    AppDelegate  *ap = [[UIApplication sharedApplication] delegate];
    //点击页面一次,角标数字加一
    [ap makeBadgeValue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
