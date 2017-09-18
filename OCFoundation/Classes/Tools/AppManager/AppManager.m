//
//  AppManager.m
//  iosBasiceView
//
//  Created by iOSCoderZhao on 2017/3/30.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "AppManager.h"
#import "Macro.h"

@implementation AppManager

+ (BOOL)isToWelcome
{
    NSString *isFirstLogin = [USER_DEFAULT objectForKey:FirstUser];
    if (isFirstLogin && [isFirstLogin isEqualToString:NoFirstUser]) {
        return NO;
    }else{
        [USER_DEFAULT setObject:NoFirstUser forKey:FirstUser];
        [USER_DEFAULT synchronize];
        return YES;
    }
}

+ (void)setUserid:(NSString *)userID
{
    [USER_DEFAULT setObject:userID forKey:USER_ID];
    [USER_DEFAULT synchronize];
}

+ (NSString *)getUserid
{
    NSString *userid = [USER_DEFAULT objectForKey:USER_ID];
    return  userid?userid:@"0";
}
+ (NSString*)md532BitLower:(NSString *)string
{
    const char *cStr = [string UTF8String];
    unsigned char result[16];
    
    NSNumber *num = [NSNumber numberWithUnsignedLong:strlen(cStr)];
    CC_MD5( cStr,[num intValue], result );
    
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}
+ (void)waiting:(NSTimeInterval)waitngTime Callback:(void (^)(NSInteger shoultWait))callback Completion:(void (^)())completion
{
    __block NSInteger wait = waitngTime;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        while (wait >0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(wait);
            });
            wait--;
            sleep(1);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            completion();
        });
    });
}
@end
