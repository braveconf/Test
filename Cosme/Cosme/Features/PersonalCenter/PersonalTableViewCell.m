//
//  PersonalTableViewCell.m
//  Cosme
//
//  Created by peijingwu on 17/1/15.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "PersonalTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation PersonalTableViewCell

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.left = 15;
    self.textLabel.left = self.imageView.right + 15;
}

- (void)setData:(id)data {
    [super setData:data];
    [self.imageView sd_setImageWithURL: [ Utility urlFromString:[data valueForKey:@"icon"]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (!error) {
            self.imageView.image = [UIImage imageWithCGImage:image.CGImage scale:2 orientation:image.imageOrientation];
            [self.imageView sizeToFit];
            [self setNeedsLayout];
        }
    }];
}

@end
