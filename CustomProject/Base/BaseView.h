//
//  BaseView.h
//  CustomProject
//
//  Created by mozhu on 17/4/7.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView
- (void)loadViews;
- (void)layoutViews;
- (void)loadViewDataWithModel:(id)model;

@end
