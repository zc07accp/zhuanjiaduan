//
//  3des.h
//  AesAndBase64
//
//  Created by zf on 16/6/2.
//  Copyright © 2016年 PuYue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZFdes : NSObject
// 加密方法
+ (NSString*)encrypt:(NSString*)plainText;

// 解密方法
+ (NSString*)decrypt:(NSString*)encryptText;
@end
