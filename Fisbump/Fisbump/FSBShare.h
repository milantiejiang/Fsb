//
//  FSBShare.h
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/9.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSBIMG.h"
#import "FSBUser.h"

@interface FSBShare : NSObject

@property (nonatomic, strong) NSString * SHARE_ID;//唯一性ID
@property (nonatomic, strong) FSBUser * USER;//创建者
@property (nonatomic, strong) NSString * SHARE_TYPE;//分享类型
@property (nonatomic, strong) NSString * TITLE;//标题
@property (nonatomic, strong) NSString * SHARE_DESCRIBE;//文字描述
@property (nonatomic, strong) FSBIMG * IMAGE;//大图
@property (nonatomic, strong) NSString * TIME;
@property (nonatomic, assign) NSInteger FABULOUS;//赞
@property (nonatomic, assign) NSInteger COLLECTION;//收藏
@property (nonatomic, assign) NSInteger COMMENT;//评论

@end
