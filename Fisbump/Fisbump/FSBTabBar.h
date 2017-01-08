//
//  FSBTabBar.h
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/8.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
typedef NS_ENUM(NSUInteger, FSBItemType) {
    HOME_TYPE = 10,
    SEARCH_TYPE = 11,
    ME_TYPE=12,
};


@class FSBTabBar;

typedef void(^TabBlock)(FSBTabBar * tabbar,FSBItemType idx);

@protocol FSBTabbarDelegate <NSObject>

- (void)tabbar:(FSBTabBar *)tabbar clickIndex:(FSBItemType)idx;

@end
@interface FSBTabBar : UIView

@property (nonatomic, weak) id<FSBTabbarDelegate> delegate;

@property (nonatomic, copy) TabBlock block;

@end
