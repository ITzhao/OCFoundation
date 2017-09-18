//
//  AppManager.h
//  iosBasiceView
//
//  Created by iOSCoderZhao on 2017/3/30.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>


@interface AppManager : NSObject
/**
 存储用户ID
 
 @param userID 后台获取存储本地
 */
+ (void)setUserid:(NSString *)userID;

/**
 获取本地ID
 
 @return 返回
 */
+ (NSString *)getUserid;

/**
 小写32位的MD5加密
 
 @param string 传入的参数
 @return 返回 加密后的结果
 */
+ (NSString*)md532BitLower:(NSString *)string;
/**
 倒计时
 
 @param waitngTime 倒计时时间
 @param callback 剩余时间
 @param completion 倒计时完成
 */
+ (void)waiting:(NSTimeInterval)waitngTime Callback:(void (^)(NSInteger shoultWait))callback Completion:(void (^)())completion;

/**
 是否加载引导页

 @return yes 加载引导页 no 不加载引导页
 */
+ (BOOL)isToWelcome;

@end
