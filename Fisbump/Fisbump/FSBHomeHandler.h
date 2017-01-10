//
//  FSBHomeHandler.h
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/9.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import "FSBBaseHandler.h"

@interface FSBHomeHandler : FSBBaseHandler

//热门
+ (void)executeGetHotLiveTaskWithPage:(NSInteger)pageNum
                              success:(SuccessBlock)success
                               failed:(FailedBlock)failed;

@end
