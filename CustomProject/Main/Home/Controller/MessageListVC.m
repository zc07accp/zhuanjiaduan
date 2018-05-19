//
//  MessageListVC.m
//  CustomProject
//
//  Created by fei du on 2017/5/19.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "MessageListVC.h"
#import "MessageView.h"
#import "MessageInfoVC.h"
#import "MineUtils.h"
#import "HtmlVC.h"
static NSString *const MessageInfoCellIdentifi = @"MessageInfoCellIdentifi";

@interface MessageListVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) MsgUtils *msgUtils;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, assign) NSInteger currentPage;

@end

@implementation MessageListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    switch (self.type) {
        case 0:
            self.navTitle = @"系统消息";
            break;
        case 1:
            self.navTitle = @"订单消息";
            break;
        case 2:
            self.navTitle = @"促销消息";
            break;
        case 3:
            self.navTitle = @"返购消息";
            break;
        default:
            break;
    }
    self.currentPage = 1;
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self loadData];
}

#pragma mark - Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height - kMainTopHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = GTFixHeightFlaot(100);
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[MessageDelCell class] forCellReuseIdentifier:MessageInfoCellIdentifi];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewMsg)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreMsg)];
    }
    return _tableView;
}

- (MsgUtils *)msgUtils {
    if (!_msgUtils) {
        _msgUtils = [[MsgUtils alloc]init];
    }
    return _msgUtils;
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [[NSMutableArray alloc]init];
    }
    return _dataArr;
}

#pragma mark - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //
//    MessageDelModel *model = [MessageDelModel mj_objectWithKeyValues:self.dataArr[indexPath.row]];
//
//
//    CGSize size = CGSizeMake(300, 1000);
//    CGSize labelSize = [model.msgContent sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:size lineBreakMode:NSLineBreakByClipping];
//
//    //计算出自适应的高度
//    return  GTFixHeightFlaot(labelSize.height+110);
//}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, 0, kMainScreen_width, 10);
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageDelCell *cell = [tableView dequeueReusableCellWithIdentifier:MessageInfoCellIdentifi];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    HtmlVC *vc = [HtmlVC new];

    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Action
- (void)loadNewMsg {
    self.currentPage = 1;
    [self loadData];
}

- (void)loadMoreMsg {
    self.currentPage += 1;
    [self loadData];
}

#pragma mark - Net
- (void)loadData {
    self.msgUtils.currentPage = self.currentPage;
    self.msgUtils.msgType = self.type;
    [self.msgUtils updateQueryMallMsgListData:^(id data) {
        NSArray *arr=[NSArray arrayWithArray:[MyControl nullArr:data[@"listObject"]]];
        
        if ([data[@"pageNum"] integerValue] == 1) {
            [self.dataArr removeAllObjects];
        }
        
        [self.dataArr addObjectsFromArray:arr];
        
        self.tableView.mj_footer.hidden=![data[@"next"]boolValue ];
        self.tableView.mj_header.hidden=!self.dataArr.count;
        
        
        if (self.dataArr.count == 0) {
            [[BJNoDataView shareNoDataView] showCenterWithSuperView:self.tableView icon:@"wushuju" iconClicked:^{
                //图片点击回调
                [self loadNewMsg];//刷新数据
            }];
        }
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        self.tableView.mj_header.hidden=!self.dataArr.count;
        self.tableView.mj_footer.hidden=!self.dataArr.count;
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [self.tableView reloadData];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
