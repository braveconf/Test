//
//  RatingStarView.m
//  Cosme
//
//  Created by peijingwu on 17/2/23.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "RatingStarView.h"

#define kRatingColor RGB(253, 197, 97)

@interface RatingStarView ()

//suppose 5 is the total
@property (nonatomic) NSInteger totalNum;
@property (nonatomic) NSArray *imgVs;
@property (nonatomic) UIView *contentVL;
@property (nonatomic) UIView *contentVR;
@property (nonatomic) CGFloat gap;
@property (nonatomic) CGFloat imgWidth;
@property (nonatomic) UIView *maskV;

@end

@implementation RatingStarView

- (instancetype)initWithHeight:(CGFloat)height {
    if (self = [super init]) {
        self.contentVL = [[UIView alloc] init];
        [self addSubview:_contentVL];
        self.contentVL.backgroundColor = kRatingColor;

        self.contentVR = [[UIView alloc] init];
        [self addSubview:_contentVR];
        self.contentVR.backgroundColor = kSubColor3;

        self.imgWidth = height;
        self.gap = height > 20 ? height / 2 : 10;
        self.totalNum = 5;
        _imgVs = [NSMutableArray arrayWithCapacity:self.totalNum];

        UIView *maskV = [[UIView alloc] init];
        maskV.backgroundColor = [UIColor clearColor];

        CGFloat left = 0;
        for (NSInteger i = 0; i < self.totalNum; i++) {
            UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(left, 0, self.imgWidth, self.imgWidth)];
            img.image = [UIImage imageNamed:@"star"];
            [maskV addSubview:img];
            left += self.imgWidth + self.gap;
        }
        maskV.frame = CGRectMake(0, 0, left - self.gap, self.imgWidth);
        self.contentVR.frame = self.frame = maskV.bounds;

        self.maskV = maskV;
    }
    return self;
}

- (void)setColor:(UIColor *)color {
    _color = color;
    self.contentVL.backgroundColor = color;
}

- (void)setStar:(CGFloat)star {
    if (star > self.totalNum) {
        star = self.totalNum;
    } else if (star < 0) {
        star = 0;
    }

    _star = star;

    //2.9===> 2.5, 2.2===>2
    BOOL hasHalf = star - floor(star) >= 0.5;
    NSInteger numStar = floor(star);

    //set width to the next star's start place, it doesn't matter it contains one more gap if hasHalf = NO
    CGFloat width = numStar * (self.imgWidth + self.gap);
    if (hasHalf) {
        width += self.imgWidth / 2;
    }

    self.maskView = self.maskV;
    self.contentVL.frame = CGRectMake(0, 0, width, self.imgWidth);
    self.contentVR.frame = CGRectMake(width, 0, self.bounds.size.width - width, self.imgWidth);
}

@end
