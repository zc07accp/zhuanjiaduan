//
//  NSDate+Addition.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/30.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Addition)
+ (NSString *)currentDateStringWithFormat:(NSString *)format;
+ (NSDate *)dateWithSecondsFromNow:(NSInteger)seconds;
+ (NSDate *)dateWithYear:(NSInteger)year month:(NSUInteger)month day:(NSUInteger)day;

- (NSString *)dateWithFormat:(NSString *)format;
+ (NSDate *)dateString:(NSString *)dateString WithFormate:(NSString *)formate;
+ (CGFloat)timeIntervalWithFormer:(NSDate *)former latter:(NSDate *)latter;
+ (NSString *)date:(NSDate *)date WithFormate:(NSString *)formate;

@end
