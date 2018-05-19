//
//  NSString+IDFA.m
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/16.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "NSString+IDFA.h"
#import <AdSupport/AdSupport.h>

@implementation NSString (idfa)
+ (NSString *)idfaString {
    
    Class asIdentifierMClass = NSClassFromString(@"ASIdentifierManager");
    
    if(asIdentifierMClass == nil){
        return @"";
    }
    else
    {
        ASIdentifierManager *asIM = [[asIdentifierMClass alloc] init];
        
        if (asIM == nil) {
            return @"";
        }
        else{
            
            if(asIM.advertisingTrackingEnabled){
                return [asIM.advertisingIdentifier UUIDString];
            }
            else{
                return [asIM.advertisingIdentifier UUIDString];
            }
        }
    }

}

@end
