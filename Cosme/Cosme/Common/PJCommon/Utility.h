//
//  Utility.h
//  YWK
//
//  Created by peijingwu on 16/12/24.
//  Copyright © 2016年 pingan.com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Preferences.h"

@interface Utility : NSObject

//NavBar
+ (void)customizeNavigationBar:(UIColor *)color fontSize:(CGFloat)fontSize fontColor:(UIColor *)fontColor;


//Label
+ (UILabel *)createLabel:(CGFloat)fontSize color:(UIColor *)textColor;

//btn
+ (UIButton *)createButtonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font block:(ButtonBlockAction)block;

/**
 *  应用程序的名称
 *
 *  @return NSString
 */
+ (NSString *)appName;

+ (NSString*)boundleIdentifier;
/*
 v3.6.1 (Release)
 v3.6.1 build 34527 (Debug || AdHoc)
 */
+ (NSString *)appVersion;

// 3.6.1
+ (NSString *)appMarketVersion;

// 34527
+ (NSString *)appBuildVersion;

+ (NSURL *)urlFromString:(NSString *)urlString;

+ (void)openURL:(NSString *)url;

//simple methods
+ (void)rating;


+ (void)clearCache;

+ (CGFloat)singleLineWidth;

+ (NSString *)md5:(NSString *)input;

+ (NSString *)sign:(NSDictionary *)dict;

@end
