//
//  BasicNetWorking.m
//  AFN二次封装
//
//  Created by 赵师顺 on 16/10/9.
//  Copyright © 2016年 赵师顺. All rights reserved.
//

#import "BasicNetWorking.h"
#import "MBProgressHUD+MJ.h"
@implementation BasicNetWorking


+ (void)GET:(NSString *)urlString parameters:(id)parameters success:(void (^) (id responseObject))success failure:(void (^) (NSError *error))failure
{
    [MBProgressHUD showMessage:@"拼命加载中..."];
//    [MBProgressHUD showSuccess:@"冲过"];
    // 初始化管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //    上传普通的格式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //    收到数据的格式(data)  注意 ：不加这句会报错Request failed: unacceptable content-type: text/plain”错误，因为我们要获取text/plain类型数据
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", nil];
    manager.requestSerializer.timeoutInterval = 10.0f;
    urlString  = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager GET:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(responseObject);
        }
        [MBProgressHUD hideHUD];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
        [MBProgressHUD hideHUD];
    }];
}

+ (void)POST:(NSString *)urlString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^) (NSError *error))failure
{
    [MBProgressHUD showMessage:@"拼命加载中..."];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", nil];
    manager.requestSerializer.timeoutInterval = 10.0f;
    urlString  = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager POST:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (success ) {
            success(dic);
        }
        [MBProgressHUD hideHUD];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
        [MBProgressHUD hideHUD];
    }];
}
+ (void)uploadMorePost:(NSString *)urlString parameters:(id)parameters UploadImage:(NSArray *)imageArray ImageKey:(NSArray *)imageKeys success:(void (^)(id responseObject))successs failure:(void (^)(NSError *error))failure
{
    if (imageKeys.count == 0) {
        [MBProgressHUD showError:[NSString stringWithFormat:@"%@为空",imageKeys]];
        return ;
    }
    if (imageArray.count == 0) {
        [MBProgressHUD showError:[NSString stringWithFormat:@"%@为空",imageArray]];
        return;
    }
    [MBProgressHUD showMessage:@"拼命加载中..."];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10.f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    urlString  = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            for (int i = 0; i < imageArray.count; i++) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
            NSString *fileName = [NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
            UIImage *image = imageArray[i];
            NSData *data = UIImageJPEGRepresentation(image, 0.7);
            [formData appendPartWithFileData:data name:((imageKeys.count > 1) ? (imageKeys[i]) : (imageKeys.firstObject)) fileName:fileName mimeType:@"image/png"];
        }
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        if (successs) {
            successs(responseObject);
        }
        [MBProgressHUD hideHUD];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
        [MBProgressHUD hideHUD];
    }];
}

+ (void)ReachabilityStatus:(void (^)(id string))netStatus
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
                
            case AFNetworkReachabilityStatusUnknown:
                
                if (netStatus) {
                    netStatus(@"未知网络类型");
                }
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
                
                if (netStatus) {
                    netStatus(@"无可用网络");
                }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
                
                if (netStatus) {
                    netStatus(@"当前WIFE下");
                }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
                
                if (netStatus) {
                    netStatus(@"使用蜂窝流量");
                }
                break;
                
            default:
                
                break;
        }
    }];
    [manager startMonitoring];
}




@end
