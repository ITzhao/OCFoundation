//
//  AppDelegate.m
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/13.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "AppDelegate.h"
#import "GuideView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // 利用反射机制 创建根控制器
    id rootController = [[NSClassFromString(@"MainTabBarViewController") alloc]init];

    // 判断是否是第一次登录
    if ([AppManager isToWelcome]) {
        GuideView *guideView = [[GuideView alloc]init];
        [guideView showGuideViewWithImageArray:@[@"1.png",@"2.png",@"3.png",@"4.png"] WindowRootController:rootController];
        self.window.rootViewController = guideView;
    }else{
        self.window.rootViewController = rootController;
    }

    
    sleep(2);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
