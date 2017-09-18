//
//  SeceltImageTool.m
//  oowa02
//
//  Created by iOSCoderZhao on 2017/6/19.
//  Copyright © 2017年 iOSCoderZhao. All rights reserved.
//

#import "SeceltImageTool.h"

static SeceltImageTool *seceltImageTool = nil;
static CGRect oldFrame;


@interface SeceltImageTool ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *selectScrollView;
@end

@implementation SeceltImageTool

+ (SeceltImageTool *)shareUploadImage {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        seceltImageTool = [[SeceltImageTool alloc] init];
    });
    return seceltImageTool;
}
- (void)showActionSheetInFatherViewController:(UIViewController *)fatherVC
                                     delegate:(id<SeceltImageToolDelegate>)aDelegate
{
    self.delegate = aDelegate;
    self.vc  = fatherVC;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self takePhotoOnViewController:fatherVC];
    }];
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"从相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self photoLibraOntroller:fatherVC];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:cancel];
    [alert addAction:photoAction];
    [alert addAction:takePhotoAction];
    [fatherVC presentViewController:alert animated:YES completion:nil];
}

// 调用相机拍照
- (void)takePhotoOnViewController:(UIViewController *)viewController
{
    // 判断是否支持相机
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc]init];
        imagePickerVC.delegate = self;
        imagePickerVC.allowsEditing = YES;
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
        [viewController presentViewController:imagePickerVC animated:YES completion:nil];
    }else{
        NSLog(@"该设备不支持相机");
    }
}
- (void)photoLibraOntroller:(UIViewController *)viewController
{
    UIImagePickerController *imagePicVC = [[UIImagePickerController alloc]init];
    imagePicVC.delegate = self;
    imagePicVC.allowsEditing = YES;
    imagePicVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [viewController presentViewController:imagePicVC animated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.vc dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (self.delegate && [self.delegate respondsToSelector:@selector(uploadImageToServerWithImage:)]) {
        [self.delegate uploadImageToServerWithImage:image];
    }
}
-(void)fullScreenWithImageView:(UIImageView *)secondImageView {
    UIImage *image=secondImageView.image;
    //    获取主窗口，处理消息；
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    /*将手势用scrollView代替*/
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    scrollView.maximumZoomScale = 1.5f;
    scrollView.minimumZoomScale = 1.0f;
    scrollView.bounces = NO;
    //    让类的对象作为代理，遵守协议，实现代理方法；
    scrollView.delegate = self;
    //    将rect 由 rect 所在视图转换到目标视图的View中，返回在目标视图view的rect
    //    获取在目标视图的坐标；
    oldFrame=[secondImageView convertRect:secondImageView.bounds toView:window];
    scrollView.backgroundColor=[UIColor blackColor];
    scrollView.alpha=0;
    //    scrollView.contentSize = [UIScreen mainScreen].bounds.size;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:oldFrame];
    imageView.image=image;
    imageView.tag=1;
    [scrollView addSubview:imageView];
    
    [window addSubview:scrollView];
    //    添加点击手势；
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fullScreenTapGR:)];
    [scrollView addGestureRecognizer: tap];
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width)/2,[UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
        scrollView.alpha=1;
    }
                     completion:^(BOOL finished) {
                     }];
    //    添加双击的手势；
    UITapGestureRecognizer *tapTwo = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTwoAction:)];
    tapTwo.numberOfTapsRequired = 2;
    [scrollView addGestureRecognizer:tapTwo];
    //    当双击手势和单击手势共存的时候，只有没有检测到双击手势的时候，单击才有效；
    [tap requireGestureRecognizerToFail:tapTwo];
}
//双击手势触发的方法；
-(void)tapTwoAction:(UITapGestureRecognizer *)sender{
    UIScrollView *scrollView = (UIScrollView *)sender.view;
    if (scrollView.zoomScale <= 1.0) {
        [UIView animateWithDuration:0.3 animations:^{
            scrollView.zoomScale = 1.5;
        }];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            scrollView.zoomScale = 1.0;
        }];
    }
}
// 点击退回原来的图片；
-(void)fullScreenTapGR:(UITapGestureRecognizer*)tap{
    UIScrollView *backgroundView = (UIScrollView *)tap.view;
    UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:1];
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=oldFrame;
        backgroundView.alpha=0;
    }
                     completion:^(BOOL finished) {
                         [backgroundView removeFromSuperview];
                     }];
}
//返回要缩放的控件；
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return [scrollView viewWithTag:1];
}
//只要进行缩放，就会执行的该方法,使图片居中；
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    CGPoint cender = scrollView.center;
    if (scrollView.zoomScale >1) {
        cender.x = [UIScreen mainScreen].bounds.size.width/2 +((scrollView.zoomScale - 1) * [UIScreen mainScreen].bounds.size.width/2);
        cender.y = [UIScreen mainScreen].bounds.size.height/2;
    }
    [scrollView viewWithTag:1].center = cender;
}


@end
