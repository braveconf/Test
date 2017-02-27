//
//  YZTNetworkManager.m
//  YiZhangTong_iOS_Common
//
//  Created by wupeijing on 17/2/9.
//  Copyright © 2017年 PingAn. All rights reserved.
//

#import "YZTNetworkManager.h"
//TODO:
//#import "AFNetworkReachabilityManager.h"


@implementation YZTNetworkManager

+ (instancetype)sharedInstance {
    static YZTNetworkManager *sharedObj;
//    static AFNetworkReachabilityManager *innerManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedObj = [[YZTNetworkManager alloc] init];
//        innerManager = [AFNetworkReachabilityManager sharedManager];
//        [innerManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//            sharedObj.hasNetWork = innerManager.reachable;
//        }];
    });

    return sharedObj;
}

- (void)startMoniteringNetwork {
//    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)stopMoniteringNetwork {
//    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

@end
