//
//  HomeViewController.m
//  Cosme
//
//  Created by peijingwu on 17/1/8.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "ProductsViewController.h"
#import "SimpleIconsTableCell.h"
#import "ProductCategoryModel.h"

@interface HotRankCell : SimpleCollectionViewTableCell

@end

@implementation HotRankCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.showSeparator = YES;
        self.contentV.height -= 1;
    }
    return self;
}

- (void)config {
    CGFloat width = kScreenWidth - 2 * kMargin;
    self.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.layout.itemSize = CGSizeMake(64, 175);

    self.contentV.frame = CGRectMake(kMargin, 0, width, 175);
    self.contentV.backgroundColor = kBackgroundColor1;
    self.contentV.showsHorizontalScrollIndicator = NO;
    self.contentV.showsVerticalScrollIndicator = NO;

//    [self.contentV registerClass:[HotRankCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([self class])];
}

- (void)setData:(id)data {
    [super setData:data];
    if ([data isKindOfClass:[NSArray class]]) {
        self.models = (NSArray *)data;
        [self.contentV reloadData];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [super collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    DLog(@"clicked at: index:%@, href:%@", indexPath, [self.models[indexPath.row] valueForKey:@"redirect_schema"]);
}

@end

@implementation ProductsBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end

@interface ProductsViewController ()

@end


@implementation ProductsViewController

- (instancetype)init {
    if (self = [super init]) {
        self.title = @"产品库";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.listData = [NSMutableArray array];

}

@end
