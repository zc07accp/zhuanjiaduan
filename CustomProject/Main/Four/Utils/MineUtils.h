//
//  MineUtils.h
//  CustomProject
//
//  Created by fei du on 2017/5/22.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "BaseUtils.h"


@interface MineUtils : BaseUtils

/**
  安全中心数据
*/
- (void)updateUserData_anquanzhongxin:(sudcceed)succeed failure:(failure)failure;
/**
 用户个人资料
*/
- (void)updateUserData_gerenziliao:(sudcceed)succeed failure:(failure)failure;
/**
用户数据
*/
- (void)updateUserData:(sudcceed)succeed failure:(failure)failure;
/**
 * 修改性别
 */
@property(nonatomic,strong)NSString *  sex;
- (void)updateSetUserSexData:(sudcceed)succeed failure:(failure)failure;

/**
 * 客服
 */

- (void)updateCustomerServiceData:(sudcceed)succeed failure:(failure)failure;
/**
 * 绑定ID
 */
@property(nonatomic,strong)NSString * cell;
- (void)updateSetUserPromotionData:(sudcceed)succeed failure:(failure)failure;
/**
 * 返购详情
 */
@property(nonatomic,strong)NSString * orderGoodsNo;
- (void)updateGetGoodsBackInfoData:(sudcceed)succeed failure:(failure)failure;
/**
 * 我的积分
 */
@property(nonatomic,assign)NSInteger page;
- (void)updateAccountPointFlowListData:(sudcceed)succeed failure:(failure)failure;
/**
 * 账户中心(查询余额 以免 未免金额）
 */
- (void)updateAccountCenterData:(sudcceed)succeed failure:(failure)failure;

/**
 * 最近最小签到次数
 */
- (void)updateLeastSignTimesData:(sudcceed)succeed failure:(failure)failure;

/**
 * 我的订单数 及未读消息数
 */
- (void)updateRecordMsgData:(sudcceed)succeed failure:(failure)failure;


/**
 * 意见反馈
 */
@property (nonatomic, strong) NSString *message;//反馈内容
@property (nonatomic, strong) NSString *title;//反馈内容
- (void)updateFeedBackData:(sudcceed)succeed failure:(failure)failure;
/**
 setNickname.do 设置昵称
 */
@property(nonatomic,copy)NSString *nickname;
- (void)setNicknameData:(sudcceed)succeed failure:(failure)failure;

@property(nonatomic,copy)NSString *configKeys;
- (void)upDateConfigData:(sudcceed)succeed failure:(failure)failure;
- (void)updateShareData:(sudcceed)succeed failure:(failure)failure;

@end



#pragma mark - 消息
@interface MsgUtils : BaseUtils
/**
 * 信息查询
 */
@property (nonatomic, assign) NSInteger currentPage;
/**
 * 0：系统消息;1：购物消息；2：促销消息 3：免单通知
 */
@property (nonatomic, assign) NSInteger msgType;

- (void)updateQueryMallMsgListData:(sudcceed)succeed failure:(failure)failure;

/**
 * 信息已读
 */
@property (nonatomic, strong) NSString *msgNo;
- (void)updateReadMsgData:(sudcceed)succeed failure:(failure)failure;


/**
 * 查询有无未读
 */
- (void)updateMsgStatusData:(sudcceed)succeed failure:(failure)failure;
@end


#pragma mark - 收藏
@interface CollectionUtils : BaseUtils
/**
 * 商品收藏列表
 */
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, strong) NSString *type;
- (void)updateCollectionListData:(sudcceed)succeed failure:(failure)failure;

/**
 * 品牌收藏列表
 */
- (void)updateBrandCollectionListData:(sudcceed)succeed failure:(failure)failure;

/**
 * 取消收藏
 */
@property (nonatomic, strong) NSString *collectionNo;
- (void)updateDelCollectionData:(sudcceed)succeed failure:(failure)failure;

@end

#pragma mark - 商户
@interface MerchantUtils : BaseUtils
/**
 * 商家入驻
 */
@property (nonatomic, strong) NSString *merchantNo;//商户编码
@property (nonatomic, strong) NSString *companyName;//公司名
@property (nonatomic, strong) NSString *brandName;//品牌
@property (nonatomic, strong) NSString *contacts;//联系人
@property (nonatomic, strong) NSString *tel;//电话
@property (nonatomic, strong) NSString *qq;//QQ
@property (nonatomic, strong) NSString *advantage;//优势
@property (nonatomic, strong) NSString *other;//其他
- (void)updateSaveMerchantData:(sudcceed)succeed failure:(failure)failure;

/**
 * 查看商户信息
 */
- (void)updateGetMerchantData:(sudcceed)succeed failure:(failure)failure;

@end


#pragma mark - 地址
@interface AddressUtils : BaseUtils

/**
 * 地址列表
 */
- (void)updateAddressListData:(sudcceed)succeed failure:(failure)failure;


/**
 * 添加／编辑地址
 */
@property (nonatomic, strong) NSString *addressId;//地址ID（非必须）（空的话默认加地址，不为空则修改地址）
@property (nonatomic, strong) NSString *userName;//收货人
@property (nonatomic, strong) NSString *mobile;//联系电话
@property (nonatomic, strong) NSString *provinceName;//省名称
@property (nonatomic, strong) NSString *cityName;//城市名称
@property (nonatomic, strong) NSString *areaName;//区名称
@property (nonatomic, strong) NSString *streetName;//街道名称（非必须）
@property (nonatomic, strong) NSString *detailAddress;//详细地址
@property (nonatomic, strong) NSString *provinceCode;//省code（非必须）
@property (nonatomic, strong) NSString *cityCode;//城市code（非必须）
@property (nonatomic, strong) NSString *areaCode;//区code（非必须）
@property (nonatomic, assign) BOOL defaultt;//是否是默认地址（非必须

- (void)updateAddressSaveData:(sudcceed)succeed failure:(failure)failure;


/**
 *  删除地址
 */
@property (nonatomic, strong) NSString *delAddressId;//地址ID

- (void)updateAddressDelData:(sudcceed)succeed failure:(failure)failure;
/**
 *  setDefaltAddr.do 默认地址
 */

- (void)setDefaltAddrData:(sudcceed)succeed failure:(failure)failure;


@end

#pragma mark - 交易密码

@interface PayPwdUtils : BaseUtils

/**
 *  设置交易密码
 */
@property (nonatomic, strong) NSString *reqType;// (必填) //设置交易密码 1.设置 2.修改
@property (nonatomic, strong) NSString *passwd;//   (必填) //交易密码
@property (nonatomic, strong) NSString *rePasswd;// (必填) //确认交易密码

- (void)updateAddressDelData:(sudcceed)succeed failure:(failure)failure;


@end
