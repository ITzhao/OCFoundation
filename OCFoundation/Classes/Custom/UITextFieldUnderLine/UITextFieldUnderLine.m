//
//  UITextFieldUnderLine.m
//  iosBasiceView
//
//  Created by iOSCoderZhao on 2017/3/30.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "UITextFieldUnderLine.h"
#import "UIColor+Extension.h"

@implementation UITextFieldUnderLine

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (void)setTextFieldLeftImage:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    imageView.backgroundColor = [UIColor redColor];
    self.leftViewMode = UITextFieldViewModeAlways;// 设置一直显示
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.leftView = imageView;
}
- (void)drawRect:(CGRect)rect
{
    if (_isNeedUnderLine) {
        NSString *color = self.underLineColor?self.underLineColor:@"#EEEEEE";
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [UIColor returnColorWithHexString:color].CGColor);
        CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame)-1, CGRectGetWidth(self.frame), 1));
    }else{
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [UIColor returnColorWithHexString:@"#FFFFFF"].CGColor);
        CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame)-1, CGRectGetWidth(self.frame), 1));
    }
}

@end
