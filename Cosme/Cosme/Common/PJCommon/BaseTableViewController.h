//
//  BaseTableViewController.h
//  YWK
//
//  Created by peijingwu on 16/12/13.
//  Copyright © 2016年 pingan.com.cn. All rights reserved.
//

#import "BaseViewController.h"
#import "CommonTableCell.h"

@interface BaseTableViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UITableView *tableView;

@property (nonatomic) NSMutableArray *listData;

@property (nonatomic) NSString *identifier;

@property (nonatomic) UITableViewStyle tableViewStyle;

@end

@protocol TwoLevelTableViewControllerDelegate <NSObject>

- (void)updateContentTableViewDataSource;
- (void)didSelect:(NSIndexPath *)indexPath at:(NSInteger)leftIndex;

@end

//the left is a simple cell(1 section with some rows)
//the right is a normal tableview.
@interface TwoLevelTableViewController : BaseTableViewController

@property (nonatomic) UITableView *sectionTableView;
@property (nonatomic) CGFloat sectionWidth;
@property (nonatomic) NSMutableArray *sectionData;
@property (nonatomic) NSInteger selectedIndex;
@property (nonatomic, weak) id<TwoLevelTableViewControllerDelegate> twoLevelDelegate;

@end
