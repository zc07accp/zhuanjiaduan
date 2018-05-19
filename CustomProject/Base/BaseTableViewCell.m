//
//  BaseTableViewCell.m
//  CustomProject
//
//  Created by mozhu on 17/4/7.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self loadViews];
        [self layoutViews];
    }
    return self;
}

- (void)updateConstraints
{
    [self layoutViews];
    [super updateConstraints];
}

- (void)loadViews
{
    
}
- (void)layoutViews{
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
