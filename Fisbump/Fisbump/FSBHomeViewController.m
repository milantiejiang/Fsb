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
#import "FSBShareCell.h"
#import "MCCollectionViewCell.h"
#import "SFCircleRefreshControl.h"
#import "UIScrollView+SFPullRefresh.h"
#import "FSBDetailsViewController.h"
@interface FSBHomeViewController ()
//@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray * dataList;
@property (assign, nonatomic) NSInteger page;
@property (strong, nonatomic) UILabel *hintsLabel;
@end
@implementation FSBHomeViewController

- (UILabel *)hintsLabel {
    if (!_hintsLabel) {
        _hintsLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
        _hintsLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _hintsLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
//    [self loadData];
    [self initUI];
    
}

- (void)initUI{
    self.waterFLowView = [[PSCollectionView alloc] initWithFrame:self.view.bounds];
    self.waterFLowView.showsVerticalScrollIndicator = FALSE;
    self.waterFLowView.showsHorizontalScrollIndicator = FALSE;

    self.waterFLowView.delegate = self; // This is for UIScrollViewDelegate
    self.waterFLowView.collectionViewDelegate = self;
    self.waterFLowView.collectionViewDataSource = self;
    self.waterFLowView.backgroundColor = [UIColor clearColor];
    self.waterFLowView.autoresizingMask = ~UIViewAutoresizingNone;
    
//    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
//    header.backgroundColor = [UIColor yellowColor];
//    self.waterFLowView.headerView = header;
    
    // Specify number of columns for both iPhone and iPad
    self.waterFLowView.numColsPortrait = 2;
    self.waterFLowView.numColsLandscape = 4;
    
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fisbump"]];
    [self.view addSubview:self.waterFLowView];
    _dataList = [[NSMutableArray alloc]init];
//    for (NSInteger i = 0; i<20; i++) {
//        [_dataList addObject:[NSString stringWithFormat:@"%d",i+100]];
//    }
    
    SFCircleRefreshControl *circleRefreshControl = [[SFCircleRefreshControl alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    circleRefreshControl.circleWidth = 1;
    [circleRefreshControl setControlColor:[UIColor yellowColor]];
    
    __weak FSBHomeViewController *wkself = self; //you must use wkself to break the retain cycle
    [self.waterFLowView sf_addRefreshHandler:^{
        NSLog(@"refresh");
        wkself.page=0;
        [wkself loadStrings];
        
    } customRefreshControl:circleRefreshControl];
    
    SFLoadMoreControl *loadmoreControl = [[SFLoadMoreControl alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 110)];
    [self.waterFLowView sf_addLoadMoreHandler:^{
        NSLog(@"load more");
        [wkself loadStrings];
        
    } customLoadMoreControl:loadmoreControl];
}

- (Class)collectionView:(PSCollectionView *)collectionView cellClassForRowAtIndex:(NSInteger)index {
    return [MCCollectionViewCell class];
}

- (void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index{
    NSLog(@"%d",index);
    self.hidesBottomBarWhenPushed=YES;
    FSBDetailsViewController * detailsPage = [[FSBDetailsViewController alloc] init];
    
    [self.navigationController pushViewController: detailsPage animated:true];
    self.hidesBottomBarWhenPushed=NO;
}

- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView {
    return _dataList.count;
}

- (UIView *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index {
    NSLog(@"reuse cell");
    NSString *item = [_dataList objectAtIndex:index];
    
        MCCollectionViewCell *cell = (MCCollectionViewCell *)[self.waterFLowView dequeueReusableViewForClass:[MCCollectionViewCell class]];
        if (cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MCCollectionViewCell" owner:self options:nil];
            cell = (MCCollectionViewCell *)[nib objectAtIndex:0];
        }
        cell.name.text = item;
        [cell collectionView:_waterFLowView fillCellWithObject:item atIndex:index];
        return cell;
    
}

- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index {
    NSString *item = [_dataList objectAtIndex:index];
    
        return [MCCollectionViewCell rowHeightForObject:item inColumnWidth:_waterFLowView.colWidth];
    
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
//        [self.collectionView reloadData];
    } failed:^(id obj) {
       NSLog(@"failed");
    }];
}

- (void)loadStrings
{
    [self requestDataAtPage:self.page success:^(NSArray *strings) {
        if (self.waterFLowView.sf_isRefreshing) {
            [self.dataList removeAllObjects];
        }
        for (NSString *str in strings) {
            //            [self.items insertObject:str atIndex:0]; //如果顶部加载，数据从头插入体验更好
            [self.dataList addObject:str];
        }
        self.page++;
        if (strings.count<10) {
            [self.waterFLowView sf_reachEndWithText:@"加载完毕"];
        }
        [self.waterFLowView sf_finishLoading];
        if (self.dataList.count<=0) {
            self.hintsLabel.text = @"没有数据";
            [self.waterFLowView sf_showHintsView:self.hintsLabel];
        }
    } failure:^(NSString *msg) {
        [self.dataList removeAllObjects];
        [self.waterFLowView sf_finishLoading];
        //可以使用自定义的提示界面
        self.hintsLabel.text = msg;
        [self.waterFLowView sf_showHintsView:self.hintsLabel];
    }];
}

- (void)requestDataAtPage:(NSInteger)page success:(void(^)(NSArray *))success failure:(void(^)(NSString *))failure
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(2);
        NSMutableArray *arr = [NSMutableArray array];
        if (page<5) {
            for (int i=0; i<20; i++) {
                [arr addObject:[NSString stringWithFormat:@"%ld", i+page*10]];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                if (success) {
                    success(arr);
                }
            });
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                //                if (failure) {
                //                    failure(@"服务器错误！");
                //                }
                if (success) {
                    success(arr);
                }
            });
        }
        
    });
}

//- (NSMutableArray *)dataList{
//    
//    if (!_dataList) {
//        _dataList = [NSMutableArray array];
//    }
//    [FSBHomeHandler executeGetHotLiveTaskWithPage:1 success:^(id obj) {
//        NSLog(@"%@",obj);
//        [self.dataList addObjectsFromArray:obj];
//        //        [self.collectionView reloadData];
//    } failed:^(id obj) {
//        NSLog(@"failed");
//    }];
//    return _dataList;
//}

@end
