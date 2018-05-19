//
//  BaseView.m
//  CustomProject
//
//  Created by mozhu on 17/4/7.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self loadViews];
        [self layoutViews];
    }
    return self;
}

- (id)init
{
    return [self initWithFrame:CGRectZero];
}

- (void)updateConstraints {
    [self layoutViews];
    [super updateConstraints];
}


- (void)loadViews
{
    
}

- (void)layoutViews
{
    
}
- (void)loadViewDataWithModel:(id)model
{
    
}
@end
