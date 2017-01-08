//
//  FSBTabBar.m
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/8.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import "FSBTabBar.h"
@interface FSBTabBar ()

@property (nonatomic, strong) NSArray * datalist;

@property (nonatomic, strong) UIButton * currentItem;

@property (nonatomic, strong) UIImageView * tabBgView;


@end

@implementation FSBTabBar

- (NSArray *)datalist {
    
    if (!_datalist) {
        _datalist = @[@"home-7",@"search-7",@"circle-user-7"];
    }
    return _datalist;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //装载背景
//        [self addSubview:self.tabBgView];
        
        //装载item
        for (int i = 0; i < self.datalist.count; i++) {
            
            UIButton * item = [UIButton buttonWithType:UIButtonTypeCustom];
            
            item.adjustsImageWhenHighlighted = NO;
            
            [item setImage:[UIImage imageNamed:self.datalist[i]] forState:UIControlStateNormal];
            
//            [item setImage:[UIImage imageNamed:[self.datalist[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            
            if (i == 0) {
                item.selected = YES;
                self.currentItem = item;
            }
            
            item.tag = HOME_TYPE + i;
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:item];
            
        }
        
        
    }
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat width = self.frame.size.width / self.datalist.count;
    
    for (UIView * btn in self.subviews) {
        
        if (btn.tag >= HOME_TYPE) {
            
            btn.frame = CGRectMake((btn.tag - HOME_TYPE) * width, 0, width, self.frame.size.height);
        }
    }
    
    self.tabBgView.frame = self.frame;
//    self.cameraBtn.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5 - 20);
    
    
}

- (void)clickItem:(UIButton *)button {
    
    if ([self.delegate respondsToSelector:@selector(tabbar:clickIndex:)]) {
        [self.delegate tabbar:self clickIndex:button.tag];
    }
    
    if (self.block) {
        self.block(self,button.tag);
    }
    
//    if (button.tag == SXTItemTypeLaunch) {
//        return;
//    }
    
    //将上一个按钮的选中状态置为NO
    self.currentItem.selected = NO;
    
    //将正在点击的按钮状态置为YES
    button.selected = YES;
    
    //将当前按钮设置成上一个按钮
    self.currentItem = button;
//    
//    [UIView animateWithDuration:0.2 animations:^{
//        
//        button.transform = CGAffineTransformMakeScale(1.2, 1.2);
//        
//    } completion:^(BOOL finished) {
//        
//        [UIView animateWithDuration:0.2 animations:^{
//            
//            button.transform = CGAffineTransformIdentity;
//        }];
//    }];
    
    
    
}

@end
