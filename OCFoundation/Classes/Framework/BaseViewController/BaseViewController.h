//
//  BaseViewController.h
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/13.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property (nonatomic,strong)UINavigationBar *navigationBar;

/**
 控制器title
 */
@property (nonatomic,strong)NSString *navigationTitle;

/**
 设置LeftBarItem

 @param title 标题/ 非必填
 */
- (void)setLeftBarItemWithTitle:(NSString *)title;

/**
 设置RightBarItem

 @param icon 图片
 @param action 响应方法
 */
- (void)setRightBarButtonItemWithIcon:(NSString *)icon Action:(SEL)action;

/**
  设置RightBarItem

 @param title 标题
 @param action 响应事件
 */
- (void)setRightBarButtonItemWithTitle:(NSString *)title Action:(SEL)action;


/**
   设置RightBarItems

 @param icon1 图标1
 @param action1 事件1
 @param icon2 图片2
 @param action2 事件2
 */
- (void)setRightBarButtonItemWithIcon1:(NSString *)icon1 Action1:(SEL)action1 AndIcon2:(NSString *)icon2 Action:(SEL)action2;

@end
