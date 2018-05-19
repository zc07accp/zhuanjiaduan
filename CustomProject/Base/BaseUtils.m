//
//  BaseUtils.m
//  CustomProject
//
//  Created by mozhu on 17/4/7.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "BaseUtils.h"
#import <AFNetworking.h>
#import "NSString+Md5.h"
#import "NSString+IDFA.h"

#import "MyControl.h"

@implementation BaseUtils


DEF_SINGLETON(BaseUtils)
/**
 *  请求数据
 */
- (void)requestData:(NSDictionary*)dic method:(NSString*)method succeed:(void (^)(id response))succeed failure:(void (^)(NSError* error))failure{
    
    [SVProgressHUD setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setErrorImage:[UIImage imageNamed:@"icon_touxiang"]];
    NSString *path = [NSString stringWithFormat:@"%@%@",REQ_BASE_URL,method];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]init];
    if (self.isResponseHtmlType) {
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }else{
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30;
    //查看网络状态
    BOOL isExistenceNetwork;
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.apple.com"];
    if ([reachability currentReachabilityStatus]==ReachableViaWiFi||[reachability currentReachabilityStatus]==ReachableViaWWAN) {
        isExistenceNetwork = TRUE;
        
        [BaseUtils sharedInstance].networkState=@"yes";
        
        [manager POST:path parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             if ((isNotNull(responseObject[@"errCode"])) &&([responseObject[@"errCode"] isEqualToString:@"FORCE_LOG_OUT"])) {
                 NSNotification *notification=[NSNotification notificationWithName:@"loginout" object:nil];
                 [[NSNotificationCenter defaultCenter]postNotification:notification];
                 [SVProgressHUD dismiss];
                 return ;
             }
             
             succeed ( responseObject );
             NSLog(@" \nmethod:\n%@ \n\n parameters:\n %@  \n\nresponse: \n%@\n",method,dic,responseObject);
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             failure ( error );
             NSLog(@"%@",error);
             
         }];
        
    }else if ([reachability currentReachabilityStatus]== NotReachable){ //无网络
        isExistenceNetwork = FALSE;
        
        [SVProgressHUD showErrorWithStatus:@"当前网络不可用，请检查您的网络设置"];
        
        [BaseUtils sharedInstance].networkState=@"no";
      
    }
}

-(void)requestImageDataDic:(NSDictionary*)dic WithImagedata:(NSData *)imageData AndName:(NSString*) name AndFileName:(NSString*)fileName  method:(NSString*)method succeed:(void (^)(id response))succeed failure:(void (^)(NSError* error))failure progress:(void (^)(NSProgress * uploadProgress))progress
{
    NSString *path = [NSString stringWithFormat:@"%@%@",REQ_BASE_URL,method];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if (self.isResponseHtmlType) {
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }else{
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 100;
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"multipart/form-data; boundary=YY" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    //查看网络状态
    BOOL isExistenceNetwork;
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.apple.com"];
    if ([reachability currentReachabilityStatus]==ReachableViaWiFi||[reachability currentReachabilityStatus]==ReachableViaWWAN) {
        isExistenceNetwork = TRUE;
        [BaseUtils sharedInstance].notconnect=@"NO";
        
        [BaseUtils sharedInstance].networkState=@"yes";
        
        [manager POST:path parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:@""];
        } progress:^(NSProgress * uploadProgress) {
            progress(uploadProgress);
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if ((isNotNull(responseObject[@"errCode"])) &&([responseObject[@"errCode"] isEqualToString:@"FORCE_LOG_OUT"])) {
                NSNotification *notification=[NSNotification notificationWithName:@"loginout" object:nil];
                [[NSNotificationCenter defaultCenter]postNotification:notification];
                [SVProgressHUD dismiss];
                return ;
            }
            succeed(responseObject);
            NSLog(@" \nmethod:\n%@ \n\n parameters:\n %@  \n\nresponse: \n%@\n",method,dic,responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure ( error );
            NSLog(@"%@",error);
        }];
        
    }else if ([reachability currentReachabilityStatus]== NotReachable){
        isExistenceNetwork = FALSE;
        
        
       [BaseUtils sharedInstance].networkState=@"no";
        
        [SVProgressHUD showErrorWithStatus:@"当前网络不可用，请检查您的网络设置"];
    }
}

-(void)requestVideoDataDic:(NSDictionary*)dic WithVideoData:(NSData *)videoData  method:(NSString*)method succeed:(void (^)(id response))succeed failure:(void (^)(NSError* error))failure progress:(void (^)(NSProgress * uploadProgress))progress
{
    
    
    NSString *path = [NSString stringWithFormat:@"%@%@",REQ_BASE_URL,method];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if (self.isResponseHtmlType) {
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }else{
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
    }
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 100;
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"multipart/form-data; boundary=YY" forHTTPHeaderField:@"Content-Type"];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain", nil];
    //查看网络状态
    BOOL isExistenceNetwork;
    Reachability *reachability = [Reachability reachabilityWithHostName:@"www.apple.com"];
    if ([reachability currentReachabilityStatus]==ReachableViaWiFi||[reachability currentReachabilityStatus]==ReachableViaWWAN) {
        isExistenceNetwork = TRUE;
       [BaseUtils sharedInstance].networkState=@"yes";
        
        [manager POST:path parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            
            //[formData appendPartWithFormData:imageData name:@"firmAtt"];
            [formData appendPartWithFileData:videoData name:@"userVideo"fileName:@"videoReadyToUpload.mp4"mimeType:@"video/mp4"];
            //[formData appendPartWithFileURL:[NSURL fileURLWithPath:videoPath] name:@"file" error:nil];
            
        } progress:^(NSProgress * uploadProgress)
         {
             progress(uploadProgress);
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
             succeed(responseObject);
             NSLog(@" \nmethod:\n%@ \n\n parameters:\n %@  \n\nresponse: \n%@\n",method,dic,responseObject);
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             failure ( error );
             NSLog(@"%@",error);
         }];
        
    }else if ([reachability currentReachabilityStatus]== NotReachable){
        isExistenceNetwork = FALSE;
        [BaseUtils sharedInstance].networkState=@"no";
        [SVProgressHUD showErrorWithStatus:@"当前网络不可用，请检查您的网络设置"];
    }
}


/**
 *  获取基础的参数字典
 */
- (NSMutableDictionary*)getBaseParameter{
    
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    UInt64 recordTime = [[NSDate date] timeIntervalSince1970]*1000;
    NSString *timeNow = [NSString stringWithFormat:@"%llu",recordTime];
    //    NSString *timeNowMd5 = [timeNow md5];
    
    [parameter setValue:[ZFdes encrypt:timeNow]forKey:@"sign"];
    [parameter setValue:@"IOS" forKey:@"appType"];
    [parameter setValue:kAppVersion forKey:@"version"];
    // [parameter setValue: @"ONE_CAR" forKey:@"platformCode"];
    [parameter setValue: timeNow forKey:@"stime"];
    [parameter setValue:[NSString idfaString] forKey:@"token"];
    
   
    
    return parameter;
}
+(LoginModel*)userModel
{
    return  [LoginModel mj_objectWithKeyValues:[MyControl getObjectForKey:USERDATA]];
}
+(BOOL)online
{
//    if ([BaseUtils userModel].mobile.length) {
//        return YES;
//    }
    return NO;
}


/**
 *  登出
 */
+(void)offline{
    
    [MyControl removeObjectForKey:USERDATA];
}
@end


