//
//  UITextField+Extension.h
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/15.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)

/**
 设置UITextField 的属性

 @param textColor 字体颜色
 @param textFontSize 字体大小
 @param placeholder 占位字体
 @param placehoderColor 占位字体颜色
 @param placehoderFont 占位字体的大小
 @return UITextField
 */
+ (UITextField *)getTextFieldWithTextColor:(NSString *)textColor  AndTextFontSize:(CGFloat)textFontSize AndPlaceholder:(NSString *)placeholder AndColor:(NSString *)placehoderColor AndFont:(CGFloat)placehoderFont;

@end
