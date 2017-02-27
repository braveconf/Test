//
//  CustomizedNavigationViewController.h
//  YWK
//
//  Created by peijingwu on 16/12/19.
//  Copyright © 2016年 pingan.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController(Ext)

- (void)customPushViewController:(UIViewController *)viewController;
- (void)customPopViewController:(UIViewController *)viewController;

@end
