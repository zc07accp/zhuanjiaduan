//
//  TableView.m
//  CustomProject
//
//  Created by mozhu on 2017/9/28.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "TableView.h"

@interface TableView ()

@end

@implementation TableView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.loading=YES;
    self.emptyText=@"再来一次呦";
    self.hasHeadAndfoot=YES;
    self.navRightBtnTitle=@"无数据";
    
    [self loadData];
}
-(void)right_button_event:(UIButton *)sender
{
    if ([self.navRightBtnTitle isEqualToString:@"无数据"]) {
        [self.listArr removeAllObjects];
        self.page=1;
        
        self.navRightBtnTitle=@"无网络";
        [BaseUtils sharedInstance].networkState=@"yes";
       
    }else{
        self.navRightBtnTitle=@"无数据";
        [BaseUtils sharedInstance].networkState=@"no";
        [SVProgressHUD showErrorWithStatus:@"当前网络不可用，请检查您的网络设置"];
    }
    [self headerFooterHidden];
}
-(void)loadData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        if (self.page==1) {
            [self.listArr removeAllObjects];
        }
        
        for (int i=0; i<10; i++) {
            [self.listArr addObject:@""];
        }
        if (self.page==3) {
            self.next=@"0";
        }else{
            self.next=@"1";
        }
        
        [self headerFooterHidden];
    });
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId=@"cellId";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.textLabel.text=[NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}


@end
