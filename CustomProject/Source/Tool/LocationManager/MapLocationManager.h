//
//  MapLocationManager.h
//  Shopping
//
//  Created by mozhu on 17/3/10.
//  Copyright © 2017年 zf. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^KSystemLocationBlock)(CLLocation *loction, NSError *error);

@interface MapLocationManager : NSObject

+ (id)shareInstance;

/**
 *  启动系统定位
 *
 *  @param systemLocationBlock 系统定位成功或失败回调成功
 */
- (void)startSystemLocationWithRes:(KSystemLocationBlock)systemLocationBlock;

@property (nonatomic, readwrite, copy) KSystemLocationBlock kSystemLocationBlock;
@end
