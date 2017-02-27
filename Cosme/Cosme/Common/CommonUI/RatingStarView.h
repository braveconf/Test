//
//  RatingStarView.h
//  Cosme
//
//  Created by peijingwu on 17/2/23.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingStarView : UIView

@property (nonatomic) CGFloat star;
@property (nonatomic) UIColor *color;

// star's height, also be the view's height
- (instancetype)initWithHeight:(CGFloat)height;

@end
