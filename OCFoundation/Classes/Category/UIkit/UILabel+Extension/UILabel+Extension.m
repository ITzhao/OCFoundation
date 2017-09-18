//
//  UILabel+Extension.m
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/14.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "UILabel+Extension.h"
@implementation UILabel (Extension)

+ (UILabel *)getLabelWithFontSize:(CGFloat)fontSize AndTextColer:(NSString *)colorString AndBackGroundColor:(NSString *)backGroundColor
{
    UILabel *label = [self getLabelWithFontSize:fontSize AndTextColer:colorString AndBackGroundColor:backGroundColor AndFontName:nil AndCornerRad:0 AndlineColor:nil AndlineWidth:0];
    return label;
}

+ (UILabel *)getLabelWithFontSize:(CGFloat)fontSize AndTextColer:(NSString *)colorString AndCornerRad:(CGFloat)cornerRad
{
    UILabel *label = [self getLabelWithFontSize:fontSize AndTextColer:colorString AndBackGroundColor:nil AndFontName:nil AndCornerRad:cornerRad AndlineColor:nil AndlineWidth:0];
    return label;
}

+ (UILabel *)getLabelWithFontSize:(CGFloat)fontSize AndTextColer:(NSString *)colorString AndBackGroundColor:(NSString *)backGroundColor AndFontName:(NSString *)fontName AndCornerRad:(CGFloat)cornerRad AndlineColor:(NSString *)color AndlineWidth:(CGFloat)lineWidth
{
    UILabel *label = [[UILabel alloc]init];
    // 字体颜色
    NSString *textColorString = (colorString != nil) ? (colorString) : (@"#F6F6F6");
    label.textColor = [UIColor returnColorWithHexString:textColorString];
    // 背景颜色
//    NSString *backColorString = (backGroundColor != nil) ? (backGroundColor) : (@"#FFFFFF");
    label.backgroundColor = [UIColor returnColorWithHexString:backGroundColor];
    // 圆角度
    label.layer.cornerRadius = cornerRad;
    label.layer.masksToBounds = YES;
    // 边框
    label.layer.borderWidth = lineWidth;
    label.layer.borderColor = [UIColor returnColorWithHexString:color].CGColor;
    // 字体
    if (fontName == nil) {
        label.font =[UIFont fontWithName:@"PF-SC-Regular" size:fontSize];
    }else{
        label.font = [UIFont fontWithName:fontName size:fontSize];
    }
    return label;
}

+ (CGFloat)getLabelHeighWithContentString:(NSString *)contentString AndLabel:(UILabel *)label AndFont:(UIFont *)font AndLineHeight:(CGFloat)lineHeight AndWordSpace:(CGFloat)wordSpace AndLabelWidth:(CGFloat)width
{
    if (contentString.length<= 0) {
        return 0;
    }
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    //    行间距 10
    paraStyle.lineSpacing = lineHeight;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //    字间距 0.5倍
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@(wordSpace)
                          };
    
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:contentString attributes:dic];
    label.attributedText = attributeStr;
    //    返回高度；
    CGSize size = [contentString boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}
@end
