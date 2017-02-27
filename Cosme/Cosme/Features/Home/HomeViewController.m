//
//  HomeViewController.m
//  Cosme
//
//  Created by peijingwu on 17/1/8.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "HomeViewController.h"

#import "SelectedViewController.h"
#import "FollowListViewController.h"
#import "SkinCareViewController.h"
#import "TipsViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (CGRect)frameForVC {
    //temp: hard code the frame
    return CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64 - 49);
}

@end
