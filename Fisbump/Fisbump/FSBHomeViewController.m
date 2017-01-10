//
//  FSBHomeViewController.m
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/8.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import "FSBHomeViewController.h"
#import "FSBSendShareViewController.h"
#import "FSBHomeHandler.h"
@interface FSBHomeViewController ()

@property (nonatomic, strong) NSMutableArray * dataList;

@end
@implementation FSBHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupNav {
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
//    titleLabel.backgroundColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.text = @"Fisbump";
    UIBarButtonItem * leftTitle=[[UIBarButtonItem alloc] initWithCustomView:titleLabel];
    self.navigationItem.leftBarButtonItem=leftTitle;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"paper-plane-7"] style:UIBarButtonItemStylePlain target:self action:@selector(share)];
}

- (void)share {
    self.hidesBottomBarWhenPushed=YES;
    FSBSendShareViewController * sendSharePage = [[FSBSendShareViewController alloc] init];
    
    [self.navigationController pushViewController: sendSharePage animated:true];
    self.hidesBottomBarWhenPushed=NO;
}

- (void)loadData {
    [FSBHomeHandler executeGetHotLiveTaskWithPage:1 success:^(id obj) {
        NSLog(@"%@",obj);
        [self.dataList addObjectsFromArray:obj];
        
    } failed:^(id obj) {
       NSLog(@"failed");
    }];
}

- (NSMutableArray *)dataList {
    
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

@end
