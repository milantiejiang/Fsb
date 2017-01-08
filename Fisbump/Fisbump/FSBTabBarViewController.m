//
//  FSBTabBarViewController.m
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/8.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import "FSBTabBarViewController.h"
#import "FSBTabBar.h"
#import "FSBNavigationViewController.h"

@interface FSBTabBarViewController ()<FSBTabbarDelegate>
@property (nonatomic, strong) FSBTabBar * fsbTabbar;
@end

@implementation FSBTabBarViewController

- (void)tabbar:(FSBTabBar *)tabbar clickIndex:(FSBItemType)idx {
    self.selectedIndex= idx - HOME_TYPE;
}

#pragma mark - getters and setters

- (FSBTabBar *)sxtTabbar {
    
    if (!_fsbTabbar) {
        _fsbTabbar = [[FSBTabBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        _fsbTabbar.delegate = self;
    }
    return _fsbTabbar;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //加载所有视图控制器
    [self configViewControllers];
    
    //加载自定义tabbar
    [self.tabBar addSubview:self.sxtTabbar];
    
}

#pragma mark - privte methods

- (void)configViewControllers {
    
    NSMutableArray * viewControlNames = [NSMutableArray     arrayWithArray:@[@"FSBHomeViewController",@"FSBSearchViewController",@"FSBMeViewController"]];
    
    for (NSUInteger i = 0; i < viewControlNames.count; i ++) {
        
        NSString * controllerName = viewControlNames[i];
        
        UIViewController * vc = [[NSClassFromString(controllerName) alloc] init];
        
        FSBNavigationViewController * nav = [[FSBNavigationViewController alloc] initWithRootViewController:vc];
        
        [viewControlNames replaceObjectAtIndex:i withObject:nav];
    }
    
    self.viewControllers = viewControlNames;
    
}

@end
