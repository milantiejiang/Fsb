//
//  FSBBaseViewController.m
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/8.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import "FSBBaseViewController.h"

@interface FSBBaseViewController ()

@end

@implementation FSBBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIColor * radomcolor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    self.view.backgroundColor = radomcolor;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
