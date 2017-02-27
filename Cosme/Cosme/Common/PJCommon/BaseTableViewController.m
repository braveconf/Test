//
//  BaseTableViewController.m
//  YWK
//
//  Created by peijingwu on 16/12/13.
//  Copyright © 2016年 pingan.com.cn. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()

@property (nonatomic) BOOL isSection;

@end

@implementation BaseTableViewController

- (instancetype)init {
    if (self = [super init]) {
        self.tableViewStyle = UITableViewStyleGrouped;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.tableViewStyle];

    //same size as the parent view
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.tableView];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    self.tableView.tableFooterView = [UIView new];
    self.tableView.sectionFooterHeight = 0;

    //normal background
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];

    //index’s text color
    self.tableView.sectionIndexColor = kMainColor;

//    self.tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);

    self.tableView.sectionHeaderHeight = 0;

    self.identifier = NSStringFromClass([self class]);

    _listData = self.data[@"data"];

    self.tableView.backgroundColor = kTableViewBackgroundColor;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger num = 0;
    if (self.listData.count) {
        num = 1;
        id data = self.listData[0];
        if ([data isKindOfClass:[NSArray class]]) {
            num = self.listData.count;
            self.isSection = YES;
        }
    }

    return num;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger num = [self.listData count];
    if (self.isSection) {
        num = [self.listData[section] count];
    }
    return num;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//returns section texts
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}


@end

@implementation TwoLevelTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _sectionTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.sectionWidth, self.view.height) style:UITableViewStylePlain];
    [self.view addSubview:self.sectionTableView];
    self.sectionTableView.tableFooterView = [[UIView alloc] init];
    self.sectionTableView.delegate = self;
    self.sectionTableView.dataSource = self;
    self.sectionTableView.autoresizingMask = self.tableView.autoresizingMask;
    self.tableView.width = self.view.width - self.sectionWidth;
    self.tableView.left = self.sectionWidth;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger num = 0;
    if (self.sectionTableView == tableView) {
        num = 1;
    } else {
        num = [super numberOfSectionsInTableView:tableView];
    }

    return num;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger num = 0;
    if (self.sectionTableView == tableView) {
        num = [self.sectionData count];
    } else {
        num = [super tableView:tableView numberOfRowsInSection:section];
    }

    return num;
}

- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:[tableView indexPathForSelectedRow]];
    cell.selected = NO;
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.selected = YES;
    if (self.sectionTableView == tableView) {
        //update self.tableview's data source
        self.selectedIndex = indexPath.row;
        [self.twoLevelDelegate updateContentTableViewDataSource];
        NSIndexPath *oIndex = [self.tableView indexPathForSelectedRow];
        if (oIndex) {
            [self.tableView deselectRowAtIndexPath:oIndex animated:YES];
        }

        [self.tableView reloadData];


//        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    } else {
//        [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
        [self.twoLevelDelegate didSelect:indexPath at:self.selectedIndex];
    }
}

@end
