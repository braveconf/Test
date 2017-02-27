//
//  HomeViewController.m
//  Cosme
//
//  Created by peijingwu on 17/1/8.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "ExploreViewController.h"

@interface ExploreViewController ()

@end

@implementation ExploreViewController

- (instancetype)init {
    if (self = [super init]) {
        self.title = @"发现";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.listData = [NSMutableArray array];
}

@end
