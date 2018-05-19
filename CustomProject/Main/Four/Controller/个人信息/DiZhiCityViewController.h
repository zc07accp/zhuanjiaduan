//
//  DiZhiCityViewController.h
//  Zero
//
//  Created by zf on 2018/4/28.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "BaseViewController.h"
typedef void (^BlockValue)(NSString *city);

@interface DiZhiCityViewController : BaseViewController
@property (nonatomic, strong) BlockValue city;
@property (nonatomic, strong) NSString* sheng;
-(void)GetCity:(BlockValue)city;
@end
