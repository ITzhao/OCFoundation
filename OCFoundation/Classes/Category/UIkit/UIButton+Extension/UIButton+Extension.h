//
//  UIButton+Extension.h
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/14.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

/**
 设置Button常用属性

 @param fontSize 字体大小
 @param colorString 字体颜色
 @param backGroundColor 背景颜色
 @return Button
 */
+ (UIButton *)getButtonWithFontSize:(CGFloat)fontSize AndTextColor:(NSString *)colorString AndBackGroundColor:(NSString *)backGroundColor;

/**
 设置Button常用属性
 
 @param fontSize 字体大小
 @param colorString 字体颜色
 @param cornerRad button圆角度
 @return Button
 */
+ (UIButton *)getButtonWithFontSize:(CGFloat)fontSize AndTextColor:(NSString *)colorString AndCornerRad:(CGFloat)cornerRad;

/**
 设置Button常用属性

 @param fontSize 字体大小
 @param colorString 字体颜色
 @param backGroundColor 背景颜色
 @param fontName 字体
 @param cornerRad button圆角度
 @param color 边框颜色
 @param lineWidth 边框宽度
 @return Button
 */
+ (UIButton *)getButtonWithFontSize:(CGFloat)fontSize AndTextColor:(NSString *)colorString AndBackGroundColor:(NSString *)backGroundColor AndFontName:(NSString *)fontName AndCornerRad:(CGFloat)cornerRad AndlineColor:(NSString *)color AndlineWidth:(CGFloat)lineWidth;

/**
 设置Button 的图片

 @param normarlImageName 未选中图片
 @param selectImageName 选中图片
 */
- (void)setButtonNormalImage:(NSString *)normarlImageName SelectImage:(NSString *)selectImageName;

@end
