//
//  NSString+Md5.m
//  InvestApp
//
//  Created by zf on 16/3/21.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "NSString+Md5.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (Md5)
-(NSString*)md5
{
    const char *myPasswd = [self UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(myPasswd, (CC_LONG)strlen(myPasswd), result);
    
    NSMutableString *md5Str = [NSMutableString string];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH ; i++)
    {
        [md5Str appendFormat:@"%02x",result[i]];
    }
    return  [md5Str copy];
}
@end
