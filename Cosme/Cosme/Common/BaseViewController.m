//
//  BaseViewController.m
//  YWK
//
//  Created by peijingwu on 16/12/10.
//  Copyright © 2016年 pingan.com.cn. All rights reserved.
//

#import "BaseViewController.h"
#import <UINavigationController+FDFullscreenPopGesture.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

- (instancetype)init {
    if (self = [super init]) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.fd_interactivePopDisabled = YES;

    if (self.navigationController.childViewControllers.count > 1) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:kBackButtonIcon] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }
}

- (void)back
{
    if (self.navigationController.visibleViewController == self) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)dealloc
{
    DLog(@"======dealloc %@",self);

    /**
     *  remove all observers for notifications by default
     */
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
