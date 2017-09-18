//
//  Macro.h
//  OCFoundation
//
//  Created by iOSCoderZhao on 2017/9/15.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

/*******************************************设备信息***********************************************************/
/**
 *  自定义打印日志：release下NSLog不打印
 *
 */
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define NSLog(...)
#define debugMethod()
#endif
/**
 *  获取主窗口
 *
 */
#define KeyWindown  [UIApplication sharedApplication].keyWindow
/**
 *  获取当前设备的宽高
 *
 */
#define K_Screen_width [UIScreen mainScreen].bounds.size.width
#define K_Screen_height [UIScreen mainScreen].bounds.size.height

/**
 *  对屏幕适配
 *
 *  @return 根据6/6s 标注进行适配
 */
#define ScaleX [UIScreen mainScreen].bounds.size.width/375
#define ScaleY [UIScreen mainScreen].bounds.size.height/667

/**
 *   获取设备UUID
 *
 */
#define UUID [[[UIDevice currentDevice] identifierForVendor] UUIDString];
/**
 *   获取App版本
 *
 */
#define AppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

/**********************************************常量********************************************************/

/**
 *  字体
 *
 */
#define PF_Regular @"PingFang-SC-Regular"
#define PF_Bold @"PingFang-SC-Bold"
/**
 *  常用字体颜色列表
 *
 */
#define FontColor_666666 @"#666666"
#define FontColor_999999 @"#999999"
/**
 *  退出登录通知
 *
 */
#define LognOutSuccess @"Logn0utSuccess"
/**
 *  登录通知
 *
 */
#define LognSuccess @"LognSuccess"
/**
 *  用户信息
 *
 */
#define LocationUserLogo @"userLogo"
#define LocationUserName @"userName"
#define LocationUserPhone @"userPhone"
/**
 *  是否是第一次登陆
 *
 */
#define FirstUser @"FirstLogin"
#define NoFirstUser @"NoFirstLogin"
/**
 *  本地存储
 *
 */
#define USER_DEFAULT [NSUserDefaults standardUserDefaults]
#define USER_ID  @"userid"// 用户ID
#define USER_Token @"userToken" // 用户token

/**********************************************网络请求********************************************************/
/**
 *  网络请求超时
 *
 */
#define Get_TimeOut 26
#define Post_TimeOut 26

/**********************************************函数********************************************************/

/**
 *   拨打电话
 *
 */
#define CALLPHONE(__phoneNum__) [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt://%@",(__phoneNum__)]]]

/**
 *   验证邮箱格式
 *
 */
#define IS_EMAIL(_email_)   [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,10}"]  evaluateWithObject:_email_]

/**
 *   验证电话 手机 格式
 *
 */
#define IS_PHONE(_phone_)   [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^((145|147)|(15[^4])|(17[0-8])|((13|18)[0-9]))\\d{8}$"]  evaluateWithObject:_phone_]

/**
 *   获取字符串宽度
 *
 */
#define StringWidth(_string_,_height_,_font_) [_string_ boundingRectWithSize:CGSizeMake(MAXFLOAT,_height_) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Regular" size:_font_]} context:nil].size.width;

/**
 *   获取字符串高度
 *
 */
#define StringHeight(_string_,_width_,_font_) [_string_ boundingRectWithSize:CGSizeMake(_width_,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Regular" size:_font_]} context:nil].size.height;


#endif
