//
//  FSBSearchViewController.m
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/8.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import "FSBSearchViewController.h"

@interface FSBSearchViewController ()<UISearchBarDelegate>

@end

@implementation FSBSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
}

- (void)setupNav {
    UISearchBar * searchbar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    searchbar.placeholder=@"搜索";
//    [searchbar setBackgroundColor:[UIColor whiteColor]];
    //输入框里面的背景颜色
    UITextField *searchFiled=[searchbar valueForKey:@"_searchField"];
    searchFiled.backgroundColor=[UIColor colorWithRed:220.0f/255.0f green:221.0f/255.0f blue:224.0f/255.0f alpha:1];
    self.navigationItem.titleView=searchbar;
    searchbar.delegate=self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSLog(@"实时监控文字输入");
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"点击搜索按钮");
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"点击取消按钮");
}

@end
