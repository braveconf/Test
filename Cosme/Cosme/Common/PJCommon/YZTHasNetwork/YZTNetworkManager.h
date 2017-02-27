//
//  YZTNetworkManager.h
//  YiZhangTong_iOS_Common
//
//  Created by wupeijing on 17/2/9.
//  Copyright © 2017年 PingAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZTNetworkManager : NSObject

@property (nonatomic) BOOL hasNetWork;

+ (instancetype)sharedInstance;
- (void)startMoniteringNetwork;
- (void)stopMoniteringNetwork;

@end
