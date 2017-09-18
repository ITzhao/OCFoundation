//
//  UIButton+Extension.m
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/14.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

+ (UIButton *)getButtonWithFontSize:(CGFloat)fontSize AndTextColor:(NSString *)colorString AndBackGroundColor:(NSString *)backGroundColor
{
    UIButton *button = [self getButtonWithFontSize:fontSize AndTextColor:colorString AndBackGroundColor:backGroundColor AndFontName:nil AndCornerRad:0 AndlineColor:nil AndlineWidth:0];
    return button;
}

+ (UIButton *)getButtonWithFontSize:(CGFloat)fontSize AndTextColor:(NSString *)colorString AndCornerRad:(CGFloat)cornerRad
{
    UIButton *button = [self getButtonWithFontSize:fontSize AndTextColor:colorString AndBackGroundColor:nil AndFontName:nil AndCornerRad:cornerRad AndlineColor:nil AndlineWidth:0];
    return button;
}

+ (UIButton *)getButtonWithFontSize:(CGFloat)fontSize AndTextColor:(NSString *)colorString AndBackGroundColor:(NSString *)backGroundColor AndFontName:(NSString *)fontName AndCornerRad:(CGFloat)cornerRad AndlineColor:(NSString *)color AndlineWidth:(CGFloat)lineWidth
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont fontWithName:((fontName != nil) ? (fontName) : (@"PF-SC-Regualr")) size:fontSize];
    [button setTitleColor:[UIColor returnColorWithHexString:colorString] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor returnColorWithHexString:backGroundColor]];
    button.layer.cornerRadius = cornerRad;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = lineWidth;
    button.layer.borderColor = [UIColor returnColorWithHexString:color].CGColor;
    return button;
}
- (void)setButtonNormalImage:(NSString *)normarlImageName SelectImage:(NSString *)selectImageName
{
    [self setImage:[UIImage imageNamed:normarlImageName] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
}

@end
