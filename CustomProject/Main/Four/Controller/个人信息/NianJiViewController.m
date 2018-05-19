
//
//  ShaiXuanVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/26.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "NianJiViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "MKJTagViewTableViewCell.h"
#import "FourView.h"

@interface NianJiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property(nonatomic,strong)UIButton *sureBtn;
@property(nonatomic,assign)NSInteger index;

@end
static NSString *identyfy = @"MKJTagViewTableViewCell";

@implementation NianJiViewController
-(UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn=[UIButton buttonWithTitle:@"确定" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:16 withImageName:nil withBGColor:[AppStyleConfiguration ColorWithMain]];
        [self.view addSubview:_sureBtn];
        _sureBtn.frame=CGRectMake(50, CGRectGetMaxY(self.tableView.frame), kMainScreen_width-100, 40);
        ViewRadius(_sureBtn, 20);

    }
    return _sureBtn;
}
- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc] initWithArray:@[@{@"first":@[@"一年级",@"二年级",@"三年级",@"四年级",@"五年级",@"六年级"]},@{@"first":@[@"初一",@"初二",@"初三"]},@{@"first":@[@"高一",@"高二",@"高三"]}]];
    }
    return _dataSource;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle=@"年级选择";
    [self tableView];
    [self sureBtn];

}
#pragma mark tableView 代理方法
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight-80) style:UITableViewStyleGrouped];;
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [_tableView registerNib:[UINib nibWithNibName:identyfy bundle:nil] forCellReuseIdentifier:identyfy];
        _tableView.backgroundColor=[UIColor whiteColor];
        _tableView.separatorColor=[AppStyleConfiguration ColorWithBaseBoard];
        [self.view addSubview:_tableView];

    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:identyfy configuration:^(id cell) {

        [self configCell:cell indexpath:indexPath AndSelSection:3];
    }];

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //商品属性cell
    MKJTagViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identyfy forIndexPath:indexPath];
    [self configCell:cell indexpath:indexPath AndSelSection:3];

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ShaiXuanHeadView *headV=[ShaiXuanHeadView new];
    switch (section) {
        case 0:
            headV.titLab.text = @"小学";
            break;

        case 1:
            headV.titLab.text = @"初中";
            break;

        case 2:
            headV.titLab.text = @"高中";
            break;

        default:
            break;
    }
    return headV;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
-(void)viewDidLayoutSubviews {

    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];

    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }

}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}
#pragma mark     tagView            创建tagview
- (void)configCell:(MKJTagViewTableViewCell *)cell indexpath:(NSIndexPath *)indexpath AndSelSection:(NSInteger)section;
{
    [cell.tagView removeAllTags];
    cell.tagView.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width;
    //cell.tagView.padding = UIEdgeInsetsMake(20, 20, 20, 20);
    cell.tagView.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    cell.tagView.lineSpacing = 10;
    cell.tagView.interitemSpacing = 10;
    cell.tagView.singleLine = NO;
    // 给出两个字段，如果给的是0，那么就是变化的,如果给的不是0，那么就是固定的
    //        cell.tagView.regularWidth = 80;
    //        cell.tagView.regularHeight = 30;
    NSArray *arr = [self.dataSource[indexpath.section] valueForKey:@"first"];

    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {

        SKTag *tag = [[SKTag alloc] initWithText:arr[idx]];

        if (self.index==idx&&indexpath.section == section)
        {
            tag.bgColor =[AppStyleConfiguration ColorWithMain];
            tag.textColor = [AppStyleConfiguration ColorWithTextOne];

        }else
        {
            tag.bgColor =[UIColor clearColor];
            tag.textColor = [AppStyleConfiguration ColorWithMain];
            tag.borderColor=[AppStyleConfiguration ColorWithMain];
            tag.borderWidth=1;

        }

        tag.font = [UIFont systemFontOfSize:12];
        tag.cornerRadius = 5;
        tag.enable = YES;
        tag.padding = UIEdgeInsetsMake(5, 10, 5, 10);
        [cell.tagView addTag:tag];
    }];

    cell.tagView.didTapTagAtIndex = ^(NSUInteger index)
    {self.index=index;


        [self configCell:cell indexpath:indexpath AndSelSection:indexpath.section];

        [self loadCellDataWith:indexpath];

        NSLog(@"点击了%ld",index);
    };
}
-(void)loadCellDataWith:(NSIndexPath*)indexPath;
{
    if (indexPath.section==0)
    {

        NSIndexSet *indexSet1=[[NSIndexSet alloc]initWithIndex:1];
        NSIndexSet *indexSet2=[[NSIndexSet alloc]initWithIndex:2];
        [self.tableView reloadSections:indexSet1 withRowAnimation:0];
        [self.tableView reloadSections:indexSet2 withRowAnimation:0];

    }
    if (indexPath.section==1)
    {

        NSIndexSet *indexSet1=[[NSIndexSet alloc]initWithIndex:0];
        NSIndexSet *indexSet2=[[NSIndexSet alloc]initWithIndex:2];
        [self.tableView reloadSections:indexSet1 withRowAnimation:0];
        [self.tableView reloadSections:indexSet2 withRowAnimation:0];

    }
    if (indexPath.section==2)
    {

        NSIndexSet *indexSet1=[[NSIndexSet alloc]initWithIndex:1];
        NSIndexSet *indexSet2=[[NSIndexSet alloc]initWithIndex:0];
        [self.tableView reloadSections:indexSet1 withRowAnimation:0];
        [self.tableView reloadSections:indexSet2 withRowAnimation:0];

    }
}
@end
