//
//  MainTabBarViewController.m
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/13.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "MainTabBarViewController.h"

/**
如不需中间按钮 删除 空的Dic
 **/

// 修改title颜色 仅需修改这里
#define titleColor_Normal [UIColor grayColor]
#define titleColor_Selected  [UIColor purpleColor]
// 修改中间图片
#define centerButtonNormalImage @"center3"
#define centerButtonSelectedImage @"center4"

@interface MainTabBarViewController ()

@property (nonatomic,strong)UIButton *centerButton;

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *childMessageArray = @[
                                   @{
                                       @"className" : @"HomeViewController",
                                       @"title" :  @"首页",
                                       @"normalImage" : @"Home",
                                       @"selectedImage" : @"Home2"
                                       },
                                   @{
                                       @"className" : @"DiscoverViewController",
                                       @"title" :  @"发现",
                                       @"normalImage" : @"classify2",
                                       @"selectedImage" : @"classify"
                                       },
                                   @{
                                       @"" : @""
                                       },
                                   @{
                                       @"className" : @"MessageViewController",
                                       @"title" :  @"消息",
                                       @"normalImage" : @"classify2",
                                       @"selectedImage" : @"classify"
                                       },
                                   @{
                                       @"className" : @"ProfileViewController",
                                       @"title" :  @"个人",
                                       @"normalImage" : @"personal2",
                                       @"selectedImage" : @"personal"
                                       },
                                   ];
    NSMutableArray *childControllers = [[NSMutableArray alloc]initWithCapacity:2];
    for (NSDictionary *dic in childMessageArray) {
        [childControllers addObject:[self setChildControllersWithDic:dic]];
    }
    self.viewControllers = childControllers;
    self.selectedIndex = 0;
    
    // 设置中间按钮
    [self setCenterButtonOnTabBar];
}
#pragma mark - 代码控制横竖屏
/*
 1,用代码控制横竖屏，在需要横屏的时候（视屏）单独处理
 2,设置支持方向后，子类都遵守
 3，如果播放视频，通常是用modal 展现的
 */
- (BOOL)shouldAutorotate
{
    return YES;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;// 竖屏
}
#pragma mark - 设置子类控制器
- (UINavigationController *)setChildControllersWithDic:(NSDictionary *)dict
{
    NSString *className = dict[@"className"];
    NSString *title = dict[@"title"];
    NSString *normalImage = dict[@"normalImage"];
    NSString *selectedImage = dict[@"selectedImage"];
    // 利用反射机制 根据类名获取类
    UIViewController *childController = [[NSClassFromString(className) alloc]init];
    
    //  添加导航条
    UINavigationController *navigationController = [[NSClassFromString(@"CustomNavigationController") alloc]initWithRootViewController:childController];
    // 属性设置
    navigationController.tabBarItem.title = title;
    navigationController.tabBarItem.image = [[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navigationController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [navigationController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : titleColor_Normal} forState:UIControlStateNormal];
    [navigationController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : titleColor_Selected} forState:UIControlStateSelected];
    return navigationController;
}
#pragma mark - 添加中间按钮
- (void)setCenterButtonOnTabBar
{
    self.centerButton = [UIButton buttonWithType:UIButtonTypeCustom];// 注意这里只能用UIButtonTypeCustom
    [self.centerButton setImage:[[UIImage imageNamed:centerButtonNormalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [self.centerButton setImage:[[UIImage imageNamed:centerButtonSelectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];

    self.centerButton.adjustsImageWhenHighlighted = NO;
    // 计算按钮的宽度
    NSInteger count = self.childViewControllers.count;
    // -1 处理按钮的间隙，使中间按钮变大
    CGFloat buttonWidth = self.tabBar.bounds.size.width/count - 1;
    self.centerButton.frame = CGRectInset(self.tabBar.bounds, 2 * buttonWidth, 0);
    [self.tabBar addSubview:self.centerButton];
    [self.centerButton addTarget:self action:@selector(clickCenterButton:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)clickCenterButton:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

@end
