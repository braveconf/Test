//
//  SimpleCollectionCell.m
//  Cosme
//
//  Created by peijingwu on 17/2/14.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "SimpleCollectionCell.h"
#import "ProductCategoryModel.h"

@interface SimpleCollectionCell ()

@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UIImageView *imgView;

@end

@implementation SimpleCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 27, 27)];
        self.imgView.contentMode = UIViewContentModeScaleAspectFit;
        _titleLabel = [Utility createLabel:12 color:kMainColor1];
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)setData:(id)data {
    ProductCategoryModel *model = (ProductCategoryModel *)data;
    if ([model isKindOfClass:[ProductCategoryModel class]]) {
        [self.imgView getImageWithURL:model.icon placeholder:nil];
        self.titleLabel.text = model.title;
        [self.titleLabel sizeToFit];
        self.titleLabel.centerX = self.imgView.centerX = self.myCenterX;
        self.imgView.top = 10;
        self.titleLabel.top = self.imgView.bottom + 15;
    }
}

@end
