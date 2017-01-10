//
//  FSBHomeHandler.m
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/9.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import "FSBHomeHandler.h"
#import "HttpTool.h"
#import "FSBAPIConfig.h"
#import "FSBShare.h"
#import "MJExtension.h"

@implementation FSBHomeHandler


+ (void)executeGetHotLiveTaskWithPage:(NSInteger)pageNum
                              success:(SuccessBlock)success
                               failed:(FailedBlock)failed {
    
    [HttpTool postWithPath:API_LiveGetTop params:nil success:^(id json) {
//        NSLog(@"MyJson:");
//        NSLog(@"%@",json);
//        NSString * result = [json[@"result"] stringValue];
        NSInteger result = [json[@"result"] integerValue];
        if (result==0) {
            NSArray * array = [FSBShare mj_objectArrayWithKeyValuesArray:json[@"array"]];
            success(array);
        } else {
            failed(json);
        }
    } failure:^(NSError *error) {
        failed(error);
    }];
    
}




@end
