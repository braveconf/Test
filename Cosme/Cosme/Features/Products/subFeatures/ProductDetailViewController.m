//
//  ProductDetailViewController.m
//  Cosme
//
//  Created by peijingwu on 17/2/22.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.title = @"产品详情";

    NSDictionary *productInfo = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"product-info.plist" ofType:nil]];

    NSArray *relations = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"relation.plist" ofType:nil]];

}

@end
