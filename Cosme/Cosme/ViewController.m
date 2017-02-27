//
//  ViewController.m
//  Cosme
//
//  Created by peijingwu on 17/1/8.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "ViewController.h"

#import "PersonalCenterViewController.h"
#import "ExploreViewController.h"
#import "ProductsViewController.h"
#import "HomeViewController.h"

@interface ViewController () <UITabBarControllerDelegate>

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    if (self) {

        NSMutableArray *vcs = [NSMutableArray array];
        UIViewController *vc0 = [HomeViewController new];
        UIViewController *vc1 = [ProductsViewController new];
        UIViewController *vc2 = [ExploreViewController new];
        UIViewController *vc4 = [PersonalCenterViewController new];

        [vcs addObject:[[UINavigationController alloc] initWithRootViewController:vc0]];
        [vcs addObject:[[UINavigationController alloc] initWithRootViewController:vc1]];
        [vcs addObject:[[UINavigationController alloc] initWithRootViewController:vc2]];
        [vcs addObject:[[UINavigationController alloc] initWithRootViewController:vc4]];

        self.viewControllers = vcs;

        NSArray *images = @[@"tab_home_normal", @"tab_list_normal", @"tab_account_normal",@"tab_about_normal"];
        [vcs enumerateObjectsUsingBlock:^(UINavigationController *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //tabBarItem is created lazily, so just use it
            [obj.tabBarItem setImage:[UIImage imageNamed:images[idx]]];
            obj.childViewControllers[0].hidesBottomBarWhenPushed = NO;
            obj.navigationBar.tintColor = kMainColor;
        }];
        self.tabBar.tintColor = kMainColor;
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    //
}

@end


