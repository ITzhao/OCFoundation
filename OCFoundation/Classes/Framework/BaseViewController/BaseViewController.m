//
//  BaseViewController.m
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/13.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "BaseViewController.h"
#import "UIButton+Extension.h"

@interface BaseViewController ()

/**
 注意：整体返回思路-> 
 1,隐藏系统的NavigationBar;
 2,自定义navigationBar 添加在Controller.View 上 坐标是：(0,0,屏幕宽,64)
 3,在表视图中（继承与BaseCollectionViewController，BaseTableViewController）的控制器中，表视图的坐标（0，0，屏幕宽，屏幕高），通过修改 contentInset属性调整；
 4，对于不是表视图控制器，其子控件坐标从（0，64）开始计算
 
 
 */
@property (nonatomic,strong)UINavigationItem *navItem;

@property (nonatomic,strong)UILabel *titleLabel;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom;
    
    [self createNavigationBar];
}
#pragma mark - 导航条
- (void)createNavigationBar
{
    // 创建一个导航栏
    self.navigationBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, 64)];
    // 导航栏背景颜色
    self.navigationBar.barTintColor = [UIColor returnColorWithHexString:@"#FFFFFF"];
    // 创建导航栏组件
      self.navItem =[[UINavigationItem alloc]init];
    // 自定义导航栏的title，用UILabel实现
    _titleLabel = [UILabel getLabelWithFontSize:18 AndTextColer:@"#333333" AndBackGroundColor:nil];
    _titleLabel.frame = CGRectMake(0, 0, 100, 44);
    _titleLabel.textAlignment = NSTextAlignmentCenter;
   self.navItem.titleView = _titleLabel;
    [self.navigationBar pushNavigationItem:self.navItem animated:false];
    [self.view addSubview:self.navigationBar];
}
#pragma mark - 标题
- (void)setNavigationTitle:(NSString *)navigationTitle
{
    _navigationTitle = navigationTitle;
    self.titleLabel.text = navigationTitle;
}
#pragma mark - LeftBarItem
- (void)setLeftBarItemWithTitle:(NSString *)title
{
    UIButton *button = [UIButton getButtonWithFontSize:15 AndTextColor:@"#666666" AndBackGroundColor:nil];
    [button setButtonNormalImage:@"leftarrow" SelectImage:nil];
    [button setTitle:title forState:UIControlStateNormal];
    button.contentHorizontalAlignment = NSTextAlignmentRight;
    [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    CGFloat titleWith = StringWidth(title, 18, 18);
    if (title == nil || title.length == 0) {
        button.frame = CGRectMake(0, 0, 44, 44);
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 44 - 8);
    }else{
        button.frame = CGRectMake(0, 0, titleWith + 10, 44);
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, titleWith - 8);
    }
    // 调整LeftButton 边距的问题
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace   target:nil action:nil];
    negativeSpacer.width = -5;
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navItem.leftBarButtonItems = @[negativeSpacer,leftBarButton];
}
#pragma mark - RightBarItem
- (void)setRightBarButtonItemWithIcon:(NSString *)icon Action:(SEL)action
{
    if (icon != nil || icon.length != 0) {
        [self setRightBarItemWithImage:icon title:nil action:action];
    }
}
- (void)setRightBarButtonItemWithTitle:(NSString *)title Action:(SEL)action
{
    if (title != nil || title.length != 0) {
        [self setRightBarItemWithImage:nil title:title action:action];
    }
}
- (void)setRightBarItemWithImage:(NSString *)icom title:(NSString *)title action:(SEL)action
{
    UIButton *button = [UIButton getButtonWithFontSize:15 AndTextColor:@"#666666" AndBackGroundColor:nil];
    [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    if (icom == nil || icom.length == 0) {
        CGFloat titleWith = StringWidth(title, 18, 18);
        button.frame = CGRectMake(0, 0, titleWith, 44);
        [button setTitle:title forState:UIControlStateNormal];
    }else{
        button.frame = CGRectMake(0, 0, 44, 44);
        [button setImage:[UIImage imageNamed:icom] forState:UIControlStateNormal];
    }
    // 调整LeftButton 边距的问题
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace   target:nil action:nil];
    negativeSpacer.width = -5;
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navItem.rightBarButtonItems = @[negativeSpacer,rightBarButton];
}
- (void)setRightBarButtonItemWithIcon1:(NSString *)icon1 Action1:(SEL)action1 AndIcon2:(NSString *)icon2 Action:(SEL)action2
{
    UIBarButtonItem *rightBarButton1 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:icon1] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:action1];
    UIBarButtonItem *rightBarButton2 = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:icon2] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]style:UIBarButtonItemStylePlain target:self action:action2];
    self.navItem.rightBarButtonItems = @[rightBarButton1,rightBarButton2];
}

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
