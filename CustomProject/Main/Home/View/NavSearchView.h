//
//  NavSearchView.h
//  CustomProject
//
//  Created by mozhu on 17/4/7.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

@interface NavTextFieldSearchView : BaseView

@property(nonatomic,strong)UIImageView *searchImg;
@property(nonatomic,strong)UITextField *textField;
@end

@interface NavSearchView : BaseView

@property(nonatomic,strong)UIView *navView;
@property(nonatomic,strong)UIButton *qiandaoBtn;
@property(nonatomic,strong)UIButton *messageBtn;
@property(nonatomic,strong)UIButton *sortBtn;
@property(nonatomic,strong)NavTextFieldSearchView *searchTextField;
@end
