//
//  FSBAPIConfig.h
//  Fisbump
//
//  Created by 米兰铁匠 on 17/1/9.
//  Copyright © 2017年 米兰铁匠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FSBAPIConfig : NSObject

#define SERVER_HOST @"http://192.168.0.18:8080/fisbump/"


//首页数据
#define API_LiveGetTop @"appshare/list.do?CurrentPage=1"

//广告地址
#define API_Advertise @"advertise/get"

//热门话题
#define API_TopicIndex @"api/live/topicindex"

//附近的人
#define API_NearLocation @"api/live/near_recommend"//?uid=85149891&latitude=40.090562&longitude=116.413353

//欢哥直播地址
#define Live_Dahuan @"rtmp://live.hkstv.hk.lxdns.com:1935/live/dahuan"

@end
