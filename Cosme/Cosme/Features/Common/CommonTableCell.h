//
//  CommonTableCell.h
//  Cosme
//
//  Created by peijingwu on 17/2/5.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>


@class BaseViewController;

@interface BaseTableCell : UITableViewCell

@property (nonatomic) id data;
@property (nonatomic, weak) BaseViewController *vc;

//support customized separator, you don't have to use it.
@property (nonatomic) UIView *lineSeparator;
@property (nonatomic) BOOL showSeparator;

@end


@interface BaseCollectionViewCell : UICollectionViewCell

@property (nonatomic) id data;

@end

@interface SimpleCollectionViewTableCell : BaseTableCell <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic) UICollectionView *contentV;
@property (nonatomic) UICollectionViewFlowLayout *layout;

@property (nonatomic) NSArray *models;

@end


