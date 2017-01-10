//
//  FSBUser.h
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/9.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSBIMG.h"

@interface FSBUser : NSObject

@property (nonatomic, strong) NSString * USER_ID;//唯一性id
@property (nonatomic, strong) NSString * TOKEN;//token
@property (nonatomic, strong) NSString * USERNAME;//登录账号
@property (nonatomic, strong) NSString * PASSWORD;//登录密码
@property (nonatomic, strong) FSBIMG * ICON;//头像
@property (nonatomic, strong) NSString * NAME;//昵称
@property (nonatomic, strong) NSString * SEX;//性别
@property (nonatomic, assign) NSInteger AGE;//年龄
@property (nonatomic, strong) NSString * BIRTHDAY;//生日
@property (nonatomic, strong) NSString * PHONE;//手机号码
@property (nonatomic, strong) NSString * EMAIL;//邮箱
@property (nonatomic, strong) NSString * ADDRESS;//详细地址
@property (nonatomic, strong) NSString * COUNTRY;//国家
@property (nonatomic, strong) NSString * PROVINCE;//省份
@property (nonatomic, strong) NSString * CITY;//城市
@property (nonatomic, strong) NSString * ZONE;//区
@property (nonatomic, strong) NSString * RIGHTS;
@property (nonatomic, strong) NSString * ROLE_ID;
@property (nonatomic, strong) NSString * LAST_LOGIN;
@property (nonatomic, strong) NSString * IP;
@property (nonatomic, strong) NSString * STATUS;
@property (nonatomic, strong) NSString * BZ;
@property (nonatomic, strong) NSString * SFID;
@property (nonatomic, strong) NSString * START_TIME;
@property (nonatomic, strong) NSString * END_TIME;
@property (nonatomic, strong) NSString * YEARS;
@property (nonatomic, strong) NSString * NUMBER;

@end
