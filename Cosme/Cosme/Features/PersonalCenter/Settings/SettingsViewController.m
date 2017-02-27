//
//  SettingsViewController.m
//  Cosme
//
//  Created by peijingwu on 17/1/15.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "SettingsViewController.h"
#import "SimpleTableViewCell.h"

//TODO 绑定账号不需要？
//TODO: logout, action, switch

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"设置";
    self.listData = [@[
                       @[
                           @{
                               @"title":@"清除缓存",
                               @"action":@"cleanCache",
                               @"isSiwtch":@(NO),
                               @"showNext":@(YES),
                               @"img":@"",
                            },
                           @{
                               @"title":@"允许通过手机通讯录加我为好友",
                               @"action":@"changePermission",
                               @"isSiwtch":@(YES),
                               @"showNext":@(NO),
                               @"img":@"",
                               },
                           ],
                       @[
                           @{
                               @"title":@"关于我们",
                               @"action":@"about",
                               @"isSiwtch":@(NO),
                               @"showNext":@(YES),
                               @"img":@"",
                               },
                           @{
                               @"title":@"联系我们",
                               @"action":@"contact",
                               @"isSiwtch":@(NO),
                               @"showNext":@(YES),
                               @"img":@"",
                               },
                           @{
                               @"title":@"用户协议",
                               @"action":@"showUserAgreements",
                               @"isSiwtch":@(NO),
                               @"showNext":@(YES),
                               @"img":@"",
                               },
                           ],
                       @[
                           @{
                               @"title":@"小主，赐个评价吧～",
                               @"action":@"rating",
                               @"isSiwtch":@(NO),
                               @"showNext":@(YES),
                               },
                           ],
                       ] mutableCopy];

    [self.tableView registerClass:[SimpleTableViewCell class] forCellReuseIdentifier:NSStringFromClass([self class])];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SimpleTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.data = self.listData[indexPath.section][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 22;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    id data = self.listData[indexPath.section][indexPath.row];
    SEL sel = NSSelectorFromString([data valueForKey:@"action"]);
    [self performSelector:sel withObject:nil afterDelay:0];
}

- (void)rating {
    NSString *url = @"cosmeapp://pingan.com/commonmethod?className=Utility&methodName=rating";
}

- (void)cleanCache {
    NSString *url = @"cosmeapp://pingan.com/commonmethod?className=Utility&methodName=clearCache";
}

- (void)about {
    NSString *url = @"https://www.cosmeapp.com/url/about";
}

-(void)contact {
    NSString *url = @"https://www.cosmeapp.com/url/contacts";
}

- (void)showUserAgreements {
    NSString *url = @"https://public.cosmeapp.com/app/agreement.html";
}

- (void)changePermission {

}
@end

