//
//  HomeViewController.m
//  Cosme
//
//  Created by peijingwu on 17/1/8.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "SettingsViewController.h"
#import "PersonalTableViewCell.h"

@interface PersonalCenterViewController ()

@end

@implementation PersonalCenterViewController

- (instancetype)init {
    if (self = [super init]) {
        self.title = @"我的";
    }
    return self;
}

- (void)viewDidLoad {    
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    //difference between navigationItem.title VS title
    self.navigationItem.title = @"个人中心";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(openSettings)];

    NSString *file = [[NSBundle mainBundle] pathForResource:@"personal.plist" ofType:nil];
    NSDictionary *d = [NSDictionary dictionaryWithContentsOfFile:file];
    self.listData = [[d valueForKeyPath:@"list"] mutableCopy];
    [self.tableView registerClass:[PersonalTableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];

    UILabel *footer = [Utility createLabel:10 color:RGB(214, 214, 214)];
    footer.text = [NSString stringWithFormat:@"%@%@", [Utility appName], [Utility appMarketVersion]];
    [footer sizeToFit];
    footer.centerX = self.view.myCenterX;
    self.tableView.tableFooterView = footer;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PersonalTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
//    cell.textLabel.text = [self.listData[indexPath.section][indexPath.row] valueForKey:@"text"];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.data = self.listData[indexPath.section][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];

    id data = self.listData[indexPath.section][indexPath.row];
    NSString *url = [data valueForKey:@"redirect_schema"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (void)openSettings {
    UIViewController *vc = [[SettingsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
