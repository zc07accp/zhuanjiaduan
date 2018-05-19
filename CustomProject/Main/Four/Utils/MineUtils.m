//
//  MineUtils.m
//  CustomProject
//
//  Created by fei du on 2017/5/22.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "MineUtils.h"

@implementation MineUtils

/**
 安全中心
*/
- (void)updateUserData_anquanzhongxin:(sudcceed)succeed failure:(failure)failure
{

    NSDictionary *dic = [self getBaseParameter];

    [BaseHttp postRequestUrl:[NSString stringWithFormat:@"%@%@",REQ_BASE_URL,@"userAccountSafeView.do"] params:dic cache:YES
                      target:nil indicator:NO progressBlock:^(NSProgress *progress) {

                      } successBlock:^(id response) {

                          if ([response[@"success"] integerValue]==1) {
                              succeed(response);

                          }else
                          {
                              [SVProgressHUD showErrorWithStatus:response[@"message"]];

                              failure(nil);
                          }
                      } failBlock:^(NSError *error) {
                          [SVProgressHUD dismiss];

                          failure(nil);
                      }];
}
/**
 用户个人资料 homeUserInfoSX.do
*/
- (void)updateUserData_gerenziliao:(sudcceed)succeed failure:(failure)failure
{
    NSDictionary *dic = [self getBaseParameter];

    [BaseHttp postRequestUrl:[NSString stringWithFormat:@"%@%@",REQ_BASE_URL,@"homeUserInfoSX.do"] params:dic cache:YES
                      target:nil indicator:NO progressBlock:^(NSProgress *progress) {

                      } successBlock:^(id response) {

                          if ([response[@"success"] integerValue]==1) {
                              succeed(response);

                          }else
                          {
                              [SVProgressHUD showErrorWithStatus:response[@"message"]];

                              failure(nil);
                          }
                      } failBlock:^(NSError *error) {
                          [SVProgressHUD dismiss];

                          failure(nil);
                      }];
}
- (void)updateUserData:(sudcceed)succeed failure:(failure)failure
{
     NSDictionary *dic = [self getBaseParameter];

    [BaseHttp postRequestUrl:[NSString stringWithFormat:@"%@%@",REQ_BASE_URL,@"homeUserSX.do"] params:dic cache:YES
                      target:nil indicator:NO progressBlock:^(NSProgress *progress) {

                      } successBlock:^(id response) {

                          if ([response[@"success"] integerValue]==1) {
                              succeed(response);

                          }else{
                              [SVProgressHUD showErrorWithStatus:response[@"message"]];

                              failure(nil);
                          }
                      } failBlock:^(NSError *error) {
                          [SVProgressHUD dismiss];

                          failure(nil);
                      }];
}
/**
 * 修改性别
 */

- (void)updateSetUserSexData:(sudcceed)succeed failure:(failure)failure
{
    NSDictionary *dic = [self getBaseParameter];
    
    [dic setValue:self.sex forKey:@"sex"];

    [BaseHttp postRequestUrl:[NSString stringWithFormat:@"%@%@",REQ_BASE_URL,@"userSexSaveSX.do"] params:dic cache:NO
                      target:nil indicator:NO progressBlock:^(NSProgress *progress) {
                          
                      } successBlock:^(id response) {
                          
                          if ([response[@"success"] integerValue]==1) {
                              succeed(response);
                              [SVProgressHUD dismiss];
                          }else{
                              [SVProgressHUD showErrorWithStatus:response[@"message"]];
                              
                              failure(nil);
                          }
                      } failBlock:^(NSError *error) {
                          [SVProgressHUD dismiss];
                          
                          failure(nil);
                      }];
}

- (void)updateCustomerServiceData:(sudcceed)succeed failure:(failure)failure
{
    NSDictionary *dic = [self getBaseParameter];
    
    [BaseHttp postRequestUrl:[NSString stringWithFormat:@"%@%@",REQ_BASE_URL,@"customerService.do"] params:dic cache:YES
                      target:nil indicator:NO progressBlock:^(NSProgress *progress) {
                          
                      } successBlock:^(id response) {
                          
                          if ([response[@"success"] integerValue]==1) {
                              succeed(response);
                         
                          }else{
                              [SVProgressHUD showErrorWithStatus:response[@"message"]];
                              
                              failure(nil);
                          }
                      } failBlock:^(NSError *error) {
                          [SVProgressHUD dismiss];
                          
                          failure(nil);
                      }];
}
/**
 * 绑定ID
 */

- (void)updateSetUserPromotionData:(sudcceed)succeed failure:(failure)failure
{
    NSDictionary *dic = [self getBaseParameter];
    
    [dic setValue:self.cell  forKey:@"cell"];
  
    [BaseHttp postRequestUrl:[NSString stringWithFormat:@"%@%@",REQ_BASE_URL,@"setUserPromotion.do"] params:dic cache:NO
                      target:nil indicator:NO progressBlock:^(NSProgress *progress) {
                          
                      } successBlock:^(id response) {
                          
                          if ([response[@"success"] integerValue]==1) {
                              succeed(response);
                              [SVProgressHUD showErrorWithStatus:@"绑定成功"];
                          }else{
                              [SVProgressHUD showErrorWithStatus:response[@"message"]];
                              
                              failure(nil);
                          }
                      } failBlock:^(NSError *error) {
                          [SVProgressHUD dismiss];
                          
                          failure(nil);
                      }];
}
/**
 * 返购详情
 */

- (void)updateGetGoodsBackInfoData:(sudcceed)succeed failure:(failure)failure
{
    NSDictionary *dic = [self getBaseParameter];
    
    [dic setValue:self.orderGoodsNo  forKey:@"orderGoodsNo"];
    
    [SVProgressHUD show];
    [BaseHttp postRequestUrl:[NSString stringWithFormat:@"%@%@",REQ_BASE_URL,@"getGoodsBackInfo.do"] params:dic cache:NO
                      target:nil indicator:NO progressBlock:^(NSProgress *progress) {
                          
                      } successBlock:^(id response) {
                          
                          if ([response[@"success"] integerValue]==1) {
                              succeed(response);
                          }else{
                              [SVProgressHUD showErrorWithStatus:response[@"message"]];
                              
                              failure(nil);
                          }
                      } failBlock:^(NSError *error) {
                          [SVProgressHUD dismiss];
                          
                          failure(nil);
                      }];
}
/**
 * 我的积分
 */
- (void)updateAccountPointFlowListData:(sudcceed)succeed failure:(failure)failure
{
    NSDictionary *dic = [self getBaseParameter];
    
    [dic setValue:[NSString stringWithFormat:@"%ld",self.page] forKey:@"currentPage"];
    
    [BaseHttp postRequestUrl:[NSString stringWithFormat:@"%@%@",REQ_BASE_URL,@"accountPointFlowList.do"] params:dic cache:NO
                      target:nil indicator:NO progressBlock:^(NSProgress *progress) {
                          
                      } successBlock:^(id response) {
                          
                          if ([response[@"success"] integerValue]==1) {
                              succeed(response);
                          }else{
                              [SVProgressHUD showErrorWithStatus:response[@"message"]];
                              
                              failure(nil);
                          }
                      } failBlock:^(NSError *error) {
                          [SVProgressHUD dismiss];
                          
                          failure(nil);
                      }];
}
/**
 * 账户中心(查询余额 以免 未免金额）
 */
- (void)updateAccountCenterData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    
    [BaseHttp postRequestUrl:[NSString stringWithFormat:@"%@%@",REQ_BASE_URL,@"accountCenter.do"] params:dic cache:YES
                      target:nil indicator:NO progressBlock:^(NSProgress *progress) {
                          
                      } successBlock:^(id response) {
                          [SVProgressHUD dismiss];
                          
                          if ([response[@"success"] integerValue]==1) {
                              succeed(response);
                          }else{
                              [SVProgressHUD showErrorWithStatus:response[@"message"]];
                              
                              failure(nil);
                          }
                      } failBlock:^(NSError *error) {
                          [SVProgressHUD dismiss];
                          
                          failure(nil);
                      }];
}

/**
 * 最近最小签到次数
 */
- (void)updateLeastSignTimesData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    
    [self requestData:dic method:@"leastSignTimes.do" succeed:^(id response) {
        [SVProgressHUD dismiss];
        
        if ([response[@"success"] integerValue]==1) {
            succeed(response);
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}

/**
 * 我的订单数 及未读消息数
 */
- (void)updateRecordMsgData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    
    [BaseHttp postRequestUrl:[NSString stringWithFormat:@"%@%@",REQ_BASE_URL,@"recordMsg.do"] params:dic cache:NO
                      target:nil indicator:NO progressBlock:^(NSProgress *progress) {
                          
                      } successBlock:^(id response) {
                          [SVProgressHUD dismiss];
                          
                          if ([response[@"success"] integerValue]==1) {
//                              if ([response[@"unReadCount"] integerValue]>0) {
//                                  [BaseUtils sharedInstance].loginMod.isMessage=YES;
//                              }else{
//                                  [BaseUtils sharedInstance].loginMod.isMessage=NO;
//                              }
                              succeed(response);
                          }else{
                             [SVProgressHUD showErrorWithStatus:response[@"message"]];
                              
                              failure(nil);
                          }
                      } failBlock:^(NSError *error) {
                          [SVProgressHUD dismiss];
                          
                          failure(nil);
                      }];
    
    
}
- (void)upDateConfigData:(sudcceed)succeed failure:(failure)failure
{
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.configKeys forKey:@"configKeys"];
    [BaseHttp postRequestUrl:[NSString stringWithFormat:@"%@%@",REQ_BASE_URL,@"queryConfig.do"] params:dic cache:YES
                      target:nil indicator:NO progressBlock:^(NSProgress *progress) {
                          
                      } successBlock:^(id response) {
                          [SVProgressHUD dismiss];
                          
                          if ([response[@"success"] integerValue]==1) {
                              succeed([MyControl nullArr:response[@"data"]]);
                          }else{
                              failure(nil);
                          }
                      } failBlock:^(NSError *error) {
                          [SVProgressHUD dismiss];
                          
                          failure(nil);
                      }];

}
- (void)updateShareData:(sudcceed)succeed failure:(failure)failure
{
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:@"SHARE_2_YOU,PROMOTION" forKey:@"configKeys"];
    [BaseHttp postRequestUrl:[NSString stringWithFormat:@"%@%@",REQ_BASE_URL,@"queryConfig.do"] params:dic cache:NO
                      target:nil indicator:NO progressBlock:^(NSProgress *progress) {
                          
                      } successBlock:^(id response) {
                          [SVProgressHUD dismiss];
                          
                          if ([response[@"success"] integerValue]==1) {
                              succeed([MyControl nullArr:response[@"data"]]);
                          }else{
                              failure(nil);
                          }
                      } failBlock:^(NSError *error) {
                          [SVProgressHUD dismiss];
                          
                          failure(nil);
                      }];
}

/**
 * 意见反馈
 */
- (void)updateFeedBackData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.message forKey:@"message"];
    [dic setValue:self.title forKey:@"title"];

    [SVProgressHUD showWithStatus:@"正在提交..."];
    
    [self requestData:dic method:@"feedBack.do" succeed:^(id response) {
        [SVProgressHUD dismiss];
        
        if ([response[@"success"] integerValue]==1) {
            succeed(response);
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}
/**
 userNickNameSaveSX.do 设置昵称
 */
- (void)setNicknameData:(sudcceed)succeed failure:(failure)failure{
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.nickname forKey:@"nickName"];
    [SVProgressHUD show];
    [self requestData:dic method:@"userNickNameSaveSX.do" succeed:^(id response) {
        if ([response[@"success"] integerValue]==1) {
            [SVProgressHUD dismiss];
            succeed(response);
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            failure(nil);
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}

@end



@implementation MsgUtils

/**
 * 信息查询
 */

- (void)updateQueryMallMsgListData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:@(self.msgType) forKey:@"msgType"];
    [dic setValue:@(self.currentPage) forKey:@"currentPage"];
    
    [SVProgressHUD showWithStatus:@"正在加载..."];
    
    [self requestData:dic method:@"sysMsgListSX.do" succeed:^(id response) {
        [SVProgressHUD dismiss];
        
        if ([response[@"success"] integerValue]==1) {
            succeed(response);
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}


/**
 * 信息已读
 */
- (void)updateReadMsgData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.msgNo forKey:@"msgNo"];
    
    [SVProgressHUD showWithStatus:@"正在加载..."];
    
    [self requestData:dic method:@"readMsg.do" succeed:^(id response) {
        [SVProgressHUD dismiss];
        
        if ([response[@"success"] integerValue]==1) {
            succeed(response);
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}

/**
 * 查询有无未读
 */
- (void)updateMsgStatusData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.msgNo forKey:@"msgNo"];
    
    [SVProgressHUD showWithStatus:@"正在加载..."];
    
    [self requestData:dic method:@"msgStatus.do" succeed:^(id response)
    {
        [SVProgressHUD dismiss];
        
    } failure:^(NSError *error)
    {
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}

@end


@implementation CollectionUtils

/**
 * 商品收藏列表
 */
- (void)updateCollectionListData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:@(self.currentPage) forKey:@"currentPage"];
    [SVProgressHUD showWithStatus:@"正在加载..."];
    
    [self requestData:dic method:@"userGoodsCollection.do" succeed:^(id response) {
        [SVProgressHUD dismiss];
        
        if ([response[@"success"] integerValue]==1) {
            succeed(response);
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
    
}

/**
 * 品牌收藏列表
 */
- (void)updateBrandCollectionListData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:@(self.currentPage) forKey:@"currentPage"];
    [SVProgressHUD showWithStatus:@"正在加载..."];
    
    [self requestData:dic method:@"brandCollectionList.do" succeed:^(id response) {
        [SVProgressHUD dismiss];
        
        if ([response[@"success"] integerValue]==1) {
            succeed(response);
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}

/**
 * 取消收藏
 */
- (void)updateDelCollectionData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.collectionNo forKey:@"linkNo"];
    [dic setValue:self.type forKey:@"collectionType"];
    [SVProgressHUD showWithStatus:@"正在取消..."];
    
    [self requestData:dic method:@"cancleCollection.do" succeed:^(id response) {
        [SVProgressHUD dismiss];
        
        if ([response[@"success"] integerValue]==1) {
            succeed(response);
            [SVProgressHUD showSuccessWithStatus:@"取消成功！"];
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}
@end


@implementation MerchantUtils

/**
 * 商家入驻
 */
- (void)updateSaveMerchantData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.merchantNo forKey:@"merchantNo"];
    [dic setValue:self.companyName forKey:@"companyName"];
    [dic setValue:self.brandName forKey:@"brandName"];
    [dic setValue:self.contacts forKey:@"contacts"];
    [dic setValue:self.tel forKey:@"tel"];
    [dic setValue:self.qq forKey:@"qq"];
    [dic setValue:self.advantage forKey:@"advantage"];
    [dic setValue:self.other forKey:@"other"];
    
    
    [SVProgressHUD showWithStatus:@"正在提交..."];
    
    [self requestData:dic method:@"merchant/saveMerchant.do" succeed:^(id response) {
        [SVProgressHUD dismiss];
        
        if ([response[@"success"] integerValue]==1) {
            succeed(response);
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}

/**
 * 查看商户信息
 */
- (void)updateGetMerchantData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    
    
    [self requestData:dic method:@"merchant/getMerchant.do" succeed:^(id response) {
        
        if ([response[@"success"] integerValue]==1) {
            succeed(response);
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}

@end


@implementation AddressUtils

/**
 * 地址列表
 */
- (void)updateAddressListData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    
    [SVProgressHUD showWithStatus:@"正在获取数据..."];
    
    [self requestData:dic method:@"addressList.do" succeed:^(id response) {
        [SVProgressHUD dismiss];
        
        
        if ([response[@"success"] integerValue]==1) {
            succeed(response);
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}

/**
 * 添加／编辑地址
 */
- (void)updateAddressSaveData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.addressId ? : @"" forKey:@"id"];
    [dic setValue:self.userName forKey:@"userName"];
    [dic setValue:self.mobile forKey:@"mobile"];
    [dic setValue:self.provinceName forKey:@"provinceName"];
    [dic setValue:self.cityName forKey:@"cityName"];
    [dic setValue:self.areaName forKey:@"areaName"];
    [dic setValue:self.streetName ? : @"" forKey:@"streetName"];
    [dic setValue:self.detailAddress forKey:@"detailAddress"];
    [dic setValue:self.provinceCode ? : @"" forKey:@"provinceCode"];
    [dic setValue:self.cityCode ? : @"" forKey:@"cityCode"];
    [dic setValue:self.areaCode ? : @"" forKey:@"areaCode"];
    [dic setValue:@(self.defaultt) forKey:@"defaultt"];
    if (self.userName.length==0) {
        [SVProgressHUD showErrorWithStatus:@"姓名为空"];
        return;
    }
    if (self.detailAddress.length==0) {
        [SVProgressHUD showErrorWithStatus:@"详细地址为空"];
        return;
    }
    if (self.provinceName.length==0&&self.cityName.length==0&&self.areaName.length==0) {
        [SVProgressHUD showErrorWithStatus:@"省市区为空"];
        return;
    }
    if (self.mobile.length==0) {
        [SVProgressHUD showErrorWithStatus:@"手机号码为空"];
        return;
    }
    
    if (self.mobile.length!=11) {
        [SVProgressHUD showErrorWithStatus:@"手机号码有误"];
        return;
    }
    
    
    [SVProgressHUD showWithStatus:@"正在保存..."];
    
    [self requestData:dic method:@"addressSave.do" succeed:^(id response) {
        [SVProgressHUD dismiss];
        
        if ([response[@"success"] integerValue]==1) {
            succeed(response);
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}


/**
 *  删除地址
 */
- (void)updateAddressDelData:(sudcceed)succeed failure:(failure)failure {
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.delAddressId ? : @"" forKey:@"id"];
    
    [SVProgressHUD showWithStatus:@"正在删除..."];
    
    [self requestData:dic method:@"addressDel.do" succeed:^(id response) {
        [SVProgressHUD dismiss];
        
        if ([response[@"success"] integerValue]==1) {
            succeed(response);
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            
            failure(nil);
        }
        
    } failure:^(NSError *error) {
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}
/**
 *  setDefaltAddr.do 默认地址
 */

- (void)setDefaltAddrData:(sudcceed)succeed failure:(failure)failure
{
    NSDictionary *dic = [self getBaseParameter];
    [dic setValue:self.addressId  forKey:@"id"];
    [SVProgressHUD show];
    [self requestData:dic method:@"setDefaltAddr.do" succeed:^(id response) {
        
        if ([response[@"success"] integerValue]==1) {
            [SVProgressHUD dismiss];
            succeed(response);
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            failure(nil);
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        failure(nil);
    }];
}

@end

