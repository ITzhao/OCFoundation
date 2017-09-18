//
//  UITextView+Extionsion.h
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/15.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import <UIKit/UIKit.h>
FOUNDATION_EXPORT double UITextView_PlaceholderVersionNumber;
FOUNDATION_EXPORT const unsigned char UITextView_PlaceholderVersionString[];
@interface UITextView (Extionsion)
/**
 占位Label
 */
@property (nonatomic, readonly) UILabel *placeholderLabel;

/**
 占位字
 */
@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;

/**
 占位颜色
 */
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;
+ (UIColor *)defaultPlaceholderColor;

@end
