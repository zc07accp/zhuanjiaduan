//
//  BaseUtils.h
//  CustomProject
//
//  Created by mozhu on 17/4/7.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import "LoginModel.h"

static NSString *networkinngError = @"系统繁忙,请稍后尝试";

typedef void(^sudcceed)(id data);
typedef void(^failure)(NSError* error);
typedef void(^progress)(NSProgress * uploadProgress);

@interface BaseUtils : NSObject

AS_SINGLETON(BaseUitls)

@property (nonatomic, assign) BOOL isResponseHtmlType;
@property(nonatomic,strong)NSString *another_load;
@property(nonatomic,strong)NSString *notconnect;
@property(nonatomic,strong)NSString *networkState;
/**
 *  请求数据
 */
- (void)requestData:(NSDictionary*)dic method:(NSString*)method succeed:(void (^)(id response))succeed failure:(void (^)(NSError* error))failure;
/**
 上传图片
 */
- (void)requestImageDataDic:(NSDictionary*)dic WithImagedata:(NSData *)imageData AndName:(NSString*) name AndFileName:(NSString*)fileName  method:(NSString*)method succeed:(void (^)(id response))succeed failure:(void (^)(NSError* error))failure progress:(void (^)(NSProgress * uploadProgress))progress;
/*
 上传视频
 */
- (void)requestVideoDataDic:(NSDictionary*)dic WithVideoData:(NSData *)videoData  method:(NSString*)method succeed:(void (^)(id response))succeed failure:(void (^)(NSError* error))failure progress:(void (^)(NSProgress * uploadProgress))progress;

- (NSMutableDictionary*)getBaseParameter;

/**
 *  获取用户信息
 */

+(LoginModel*)userModel;

+(BOOL)online;

/**
 *  登出
 */
+(void)offline;
@end
