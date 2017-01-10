//
//  FSBShareCell.m
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/10.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import "FSBShareCell.h"
#import "UIImageView+SDWebImage.h"
@interface FSBShareCell()

@property (weak, nonatomic) IBOutlet UIImageView *UserIcon;
@property (weak, nonatomic) IBOutlet UILabel *UserName;

@property (weak, nonatomic) IBOutlet UILabel *City;
@property (weak, nonatomic) IBOutlet UIImageView *Image;

@end
@implementation FSBShareCell

-(void)setShare:(FSBShare *)share{
    _share=share;
    [self.UserIcon downloadImage:share.USER.ICON.IMG_PATH placeholder:@"fisbump"];
    self.UserName.text=share.USER.NAME;
    self.City.text=share.USER.CITY;
    [self.Image downloadImage:share.IMAGE.IMG_PATH placeholder:@"fisbump"];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.UserIcon.layer.cornerRadius = CGRectGetWidth(self.UserIcon.frame) / 2;
    self.UserIcon.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
