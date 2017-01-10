//
//  FSBTableViewController.m
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/10.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import "FSBTableViewController.h"
#import "FSBShareCell.h"
#import "FSBHomeHandler.h"
#import "FSBSendShareViewController.h"

static NSString * identifier = @"FSBShareCell";
@interface FSBTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray * dataList;

@end

@implementation FSBTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    [self initUI];
    
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FSBShareCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.share = self.dataList[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70 + self.view.bounds.size.width + 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//    SXTPlayerViewController * playerVC = [[SXTPlayerViewController alloc] init];
//    
//    playerVC.live = self.dataList[indexPath.row];
//    
//    [self.navigationController pushViewController:playerVC animated:YES];
    
    
    /*
     
     系统自带的播放器解码能力不够，播放不了直播
     
     SXTLive * live = self.dataList[indexPath.row];
     
     MPMoviePlayerViewController * mp = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:live.streamAddr]];
     
     [self.tabBarController presentViewController:mp animated:YES completion:nil];
     */
    
}



- (void)initUI {
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FSBShareCell" bundle:nil] forCellReuseIdentifier:identifier];
    
}

- (void)loadData {
    [FSBHomeHandler executeGetHotLiveTaskWithPage:1 success:^(id obj) {
        NSLog(@"%@",obj);
        [self.dataList addObjectsFromArray:obj];
        [self.tableView reloadData];
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
