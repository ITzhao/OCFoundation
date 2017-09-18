//
//  UITextField+Extension.m
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/15.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "UITextField+Extension.h"

@implementation UITextField (Extension)
+ (UITextField *)getTextFieldWithTextColor:(NSString *)textColor  AndTextFontSize:(CGFloat)textFontSize AndPlaceholder:(NSString *)placeholder AndColor:(NSString *)placehoderColor AndFont:(CGFloat)placehoderFont
{
    UITextField *textField = [[UITextField alloc]init];
    textField.placeholder = placeholder;
    textField.textColor = [UIColor returnColorWithHexString:textColor];
    textField.font = [UIFont fontWithName:PF_Regular size:textFontSize];
    [textField setValue:[UIColor returnColorWithHexString:placehoderColor] forKeyPath:@"_placeholderLabel.textColor"];
    [textField setValue:[UIFont fontWithName:@"PingFang-SC-Regular" size:placehoderFont] forKeyPath:@"_placeholderLabel.font"];
    return textField;
}


@end
