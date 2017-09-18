//
//  UIColor+Extension.h
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/14.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
/**
 随机返回一个颜色
 
 @return 随机色
 */
+ (UIColor *)randomColor;

/**
 RGB转换成UIColor
 
 @return 返回UIColor对象
 */
+ (UIColor *)returnColorWithR:(CGFloat)red andG:(CGFloat)green andB:(CGFloat)blue;

/**
 将16进制颜色转换成UIColor
 
 @param colorStr 16进制色值
 
 @return UIColor
 */
+ (UIColor *)returnColorWithHexString:(NSString *)colorStr;
@end
