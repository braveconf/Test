//
//  UIViewController+Ext.m
//  YWK
//
//  Created by peijingwu on 16/12/19.
//  Copyright © 2016年 pingan.com.cn. All rights reserved.
//

#import "UIViewController+Ext.h"
#import <objc/runtime.h>

@implementation UIViewController (Ext)

- (BOOL)simPresent
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setSimPresent:(BOOL)simPresent
{
    objc_setAssociatedObject(self, @selector(simPresent), @(simPresent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
