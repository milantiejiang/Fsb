//
//  FSBDetailsViewController.m
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/11.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import "FSBDetailsViewController.h"

@interface FSBDetailsViewController ()

@end

@implementation FSBDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    // Do any additional setup after loading the view from its nib.
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
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"详情";
    self.navigationItem.titleView = titleLabel;
    //    //自定义返回按钮
    //    UIImage *backButtonImage = [[UIImage imageNamed:@"spanner-7"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    //    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //    //将返回按钮的文字position设置不在屏幕上显示
    //    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
