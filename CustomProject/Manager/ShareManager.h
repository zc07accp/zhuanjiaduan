//
//  ShareManager.h
//  CustomProject
//
//  Created by mozhu on 2017/11/8.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 分享 相关服务
 */

@interface ShareManager : NSObject
//单例
AS_SINGLETON(ShareManager)

/**
 展示分享页面
 */
@property(nonatomic,strong)NSString* thumbURL;
@property(nonatomic,strong)NSString* title;
@property(nonatomic,strong)NSString* descr;
@property(nonatomic,strong)NSString* webpageUrl;
@property(nonatomic,strong)UIImage* thumbIamge;
-(void)showShareView;
@end
