//
//  FSBHomeViewController.h
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/8.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import "FSBBaseViewController.h"
#import "PSCollectionView.h"

@interface FSBHomeViewController : FSBBaseViewController<UIScrollViewDelegate,PSCollectionViewDataSource,PSCollectionViewDelegate>
@property (strong,nonatomic) PSCollectionView *waterFLowView;
@end
