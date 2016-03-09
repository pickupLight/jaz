//
//  AppDelegate.m
//  KVO
//
//  Created by sherry on 15/11/16.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    
    //iOS8之后，应用程序badgeNumber需要先registerUserNotificationSettings
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    
    //注册
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    //应用角标显示数字
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    //设置tabBarController
    NSArray *viewControllers = @[[ViewController new]];
    UITabBarController *tabController = [[UITabBarController alloc] init];
    //设置tabBarController的viewControllers
    tabController.viewControllers = viewControllers;
    //设置根视图控制器
    [self.window setRootViewController:tabController];
    
    //添加观察者
    [tabController.viewControllers.lastObject.tabBarItem addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

//观察者发现值发生变化
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    NSLog(@"change_____%@",change);
    
    [UIApplication sharedApplication].applicationIconBadgeNumber = [change[NSKeyValueChangeNewKey] integerValue];
}

//定义badgeValue
NSInteger badgeValue = 0;
//修改badgeValue的方法
- (void)makeBadgeValue{
    //获取当前应用的UITabBarController
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;

    //获取UITabBarController的第一个元素
    ViewController *vc = [tabBarController.viewControllers firstObject];
    
    //获取ViewController的UITabBarItem
    UITabBarItem * item = vc.tabBarItem;
    
    //获取ViewController的UITabBarItem的badgeValue
    badgeValue = [item.badgeValue integerValue];
    
    //badgeValue自加
    badgeValue ++;
    
    //重新设置badgeValue
    [item setBadgeValue:[NSString stringWithFormat:@"%ld",badgeValue]];
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
