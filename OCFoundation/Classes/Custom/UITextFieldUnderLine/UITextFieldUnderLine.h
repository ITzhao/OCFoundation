//
//  UITextFieldUnderLine.h
//  iosBasiceView
//
//  Created by iOSCoderZhao on 2017/3/30.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextFieldUnderLine : UITextField

/**
 是否显示下划线 默认是NO 不需要下划线
 */
@property (nonatomic,assign)BOOL isNeedUnderLine;

/**
 下划线的颜色
 */
@property (nonatomic,strong)NSString *underLineColor;

/**
 设置输入框左边图标

 @param imageName 图标名称
 */
- (void)setTextFieldLeftImage:(NSString *)imageName;

@end
