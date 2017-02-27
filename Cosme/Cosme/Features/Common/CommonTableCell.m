//
//  CommonTableCell.m
//  Cosme
//
//  Created by peijingwu on 17/2/5.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "CommonTableCell.h"
#import "BaseModel.h"

@implementation BaseTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _lineSeparator = [[UIView alloc] initWithFrame:CGRectMake(kMargin, 0, kScreenWidth - kMargin, [Utility singleLineWidth])];
        _lineSeparator.hidden = YES;
        self.lineSeparator.backgroundColor = kSubColor2;
        //        self.lineSeparator.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        [self.contentView addSubview:self.lineSeparator];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.lineSeparator.left = kMargin;
    self.lineSeparator.bottom = self.contentView.height;
}

- (void)setData:(id)data {
    if (![_data isEqual:data]) {
        _data = data;
    }
}

- (void)setShowSeparator:(BOOL)showSeparator {
    if (_showSeparator != showSeparator) {
        _showSeparator = showSeparator;
        self.lineSeparator.hidden = !showSeparator;
    }
}

@end

@implementation BaseCollectionViewCell

@end

@implementation SimpleCollectionViewTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _contentV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        self.contentV.delegate = self;
        self.contentV.dataSource = self;
        [self.contentView addSubview:self.contentV];

        [self config];
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.models.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BaseCollectionViewCell *cell = (BaseCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
    //    cell.set

    cell.data = self.models[indexPath.row];
    //    cell.backgroundColor =  [UIColor redColor];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    id data = self.models[indexPath.row];
    NSString *url;
    if ([data isKindOfClass:[BaseModel class]]) {
        url = [data valueForKey:@"href"];
    } else {
        url = [data valueForKey:@"redirect_schema"];
    }
    DLog(@"clicked at: index:%@, href:%@", indexPath, [self.models[indexPath.row] valueForKey:@"href"]);
}

- (void)config {
    
}

@end

