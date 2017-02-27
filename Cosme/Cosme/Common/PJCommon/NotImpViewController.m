//
//  NotImpViewController.m
//  Cosme
//
//  Created by peijingwu on 17/2/16.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "NotImpViewController.h"

@interface NotImpViewController ()

@end

@implementation NotImpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"未实现";
    UILabel *label = [Utility createLabel:14 color:[UIColor blackColor]];
    label.text = @"暂未实现，敬请期待";
    [label sizeToFit];

    label.center = self.view.myCenter;
    [self.view addSubview:label];
}

@end
