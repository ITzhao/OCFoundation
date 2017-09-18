//
//  UILabel+Extension.h
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/14.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

/**
 设置Label 属性

 @param fontSize 字体大小
 @param colorString 字体颜色
 @param backGroundColor 背景颜色（默认白色）
 @return label
 */
+ (UILabel *)getLabelWithFontSize:(CGFloat)fontSize AndTextColer:(NSString *)colorString AndBackGroundColor:(NSString *)backGroundColor;

/**
  设置Label 属性

 @param fontSize 字体大小
 @param colorString 字体颜色
 @param cornerRad 圆角度
 @return Label
 */
+ (UILabel *)getLabelWithFontSize:(CGFloat)fontSize AndTextColer:(NSString *)colorString AndCornerRad:(CGFloat)cornerRad;

/**
 设置Label 属性
 
 @param fontSize 字体大小 (默认15 号 )
 @param colorString 字体颜色（默认灰色）
 @param backGroundColor 背景颜色（默认白色）
 @param fontName 字体（默认PF-Regular字体）
 @param cornerRad 圆角度
 @param color 边框颜色
 @param lineWidth 边框宽度
 @return Label
 */
+ (UILabel *)getLabelWithFontSize:(CGFloat)fontSize AndTextColer:(NSString *)colorString AndBackGroundColor:(NSString *)backGroundColor AndFontName:(NSString *)fontName AndCornerRad:(CGFloat)cornerRad AndlineColor:(NSString *)color AndlineWidth:(CGFloat)lineWidth;


/**
有行间距，字间距 Label 的高度计算

 @param contentString label.text
 @param label label
 @param font 字体
 @param lineHeight 行间距
 @param wordSpace 字间距
 @param width Label的Width
 @return Label 的高度
 */
+ (CGFloat)getLabelHeighWithContentString:(NSString *)contentString AndLabel:(UILabel *)label AndFont:(UIFont *)font AndLineHeight:(CGFloat)lineHeight AndWordSpace:(CGFloat)wordSpace AndLabelWidth:(CGFloat)width;

@end
