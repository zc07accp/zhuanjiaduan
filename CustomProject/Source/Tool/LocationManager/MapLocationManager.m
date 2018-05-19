//
//  MapLocationManager.m
//  Shopping
//
//  Created by mozhu on 17/3/10.
//  Copyright © 2017年 zf. All rights reserved.
//

#import "MapLocationManager.h"

@interface MapLocationManager ()<CLLocationManagerDelegate>

@property (nonatomic, readwrite, strong) CLLocationManager *locationManager;

@end

@implementation MapLocationManager

+(id)shareInstance{
    static id helper=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [[MapLocationManager alloc]  init];
    });
    return helper;
    
}
#pragma mark - 苹果
/**
 *  苹果系统自带地图定位
 */
- (void)startSystemLocationWithRes:(KSystemLocationBlock)systemLocationBlock{
    self.kSystemLocationBlock=systemLocationBlock;
    
    if (!self.locationManager) {
        self.locationManager=[[CLLocationManager alloc] init];
        self.locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        if ([UIDevice currentDevice].systemVersion.floatValue >=8) {
            [self.locationManager requestWhenInUseAuthorization];//使用程序其间允许访问位置数据（iOS8定位需要）
        }
    }
    self.locationManager.delegate=self;
    [self.locationManager startUpdatingLocation];//开启定位
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *currLocation=[locations lastObject];
    self.locationManager.delegate = nil;
    [self.locationManager stopUpdatingLocation];
    
    self.kSystemLocationBlock(currLocation, nil);
}

@end
