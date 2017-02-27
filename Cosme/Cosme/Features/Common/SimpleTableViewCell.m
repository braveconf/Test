//
//  SimpleTableViewCell.m
//  Cosme
//
//  Created by peijingwu on 17/1/15.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "SimpleTableViewCell.h"

@implementation SimpleTableViewCell

- (void)setData:(id)data {
    NSString *text = data;
    if (![text isKindOfClass:[NSString class]]) {
        text = data[@"title"];
    }
    self.textLabel.text = text;

    //doesn't work here. so
//    [self.textLabel sizeToFit];
}

@end
