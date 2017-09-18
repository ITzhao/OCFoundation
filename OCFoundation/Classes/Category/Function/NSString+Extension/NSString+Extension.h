//
//  NSString+Extension.h
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/15.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
/**
 过滤emijor表情
 
 @param string 字符串
 @return 过滤
 */
- (NSString *)filterEmoji:(NSString *)string;

/**
 是否包含特殊字符
 
 @param string 字符串
 @return bool
 */
- (BOOL)stringContainsEmoji:(NSString *)string;

/**
 *  不同颜色不同字体大小字符串
 */
-(NSMutableAttributedString *)setOtherColor:(UIColor *)Color font:(CGFloat)font forStr:(NSString *)forStr;
/*
 在文字上添加删除线（例如过去的价格）
 */
-(NSAttributedString *)AddRemoveLineOnStringRange:(NSRange )range lineWidth:(NSInteger )lineWidth;
@end
