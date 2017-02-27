//
//  PJBaseViewController.m
//  Cosme
//
//  Created by peijingwu on 17/1/8.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "PJBaseViewController.h"

@interface PJBaseViewController ()

@end

@implementation PJBaseViewController

- (instancetype)init {
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

@end
