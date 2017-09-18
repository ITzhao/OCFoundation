//
//  SeceltImageTool.h
//  oowa02
//
//  Created by iOSCoderZhao on 2017/6/19.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SeceltImageToolShared [SeceltImageTool shareUploadImage]
@protocol SeceltImageToolDelegate <NSObject>

@optional // 可选实现
- (void)uploadImageToServerWithImage:(UIImage *)image;

@end

@interface SeceltImageTool : NSObject <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

#pragma mark - 单选图片
/**
 选取图片页面的控制器
 */
@property (nonatomic,strong)UIViewController *vc;
@property (nonatomic,weak) id<SeceltImageToolDelegate>delegate;

+ (SeceltImageTool *)shareUploadImage;
- (void)showActionSheetInFatherViewController:(UIViewController *)fatherVC
                                     delegate:(id<SeceltImageToolDelegate>)aDelegate;

#pragma mark - 点击图片放大
-(void)fullScreenWithImageView:(UIImageView *)secondImageView;

@end
