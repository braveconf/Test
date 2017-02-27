//
//  SimpleIconsTableCell.m
//  Cosme
//
//  Created by peijingwu on 17/2/14.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "SimpleIconsTableCell.h"
#import "SimpleCollectionCell.h"

@implementation SimpleIconsTableCell

- (void)config {
    CGFloat width = kScreenWidth - 2 * kMargin;
    self.layout.minimumLineSpacing = 0;
    self.layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.layout.itemSize = CGSizeMake(floorf((width - self.layout.minimumInteritemSpacing * (kNumOfItemsInLine - 1)) / kNumOfItemsInLine), kCategoryHeight);

    self.contentV.frame = CGRectMake(kMargin, 0, width, 0);
    self.contentV.backgroundColor = kBackgroundColor1;
    self.contentV.showsHorizontalScrollIndicator = NO;
    self.contentV.showsVerticalScrollIndicator = NO;

    [self.contentV registerClass:[SimpleCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([self class])];
}

- (void)setData:(id)data {
    [super setData:data];
    if ([data isKindOfClass:[NSArray class]]) {
        self.models = (NSArray *)data;
        self.contentV.height = ceilf(kCategoryHeight * ceilf(self.models.count * 1.0 / kNumOfItemsInLine));
        [self.contentV reloadData];
    }
}


@end
