//
//  Preferences.h
//  YWK
//
//  Created by peijingwu on 17/1/14.
//  Copyright © 2017年 pingan.com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Preferences : NSObject

+ (void)saveDataWithKey:(NSString *)key ofValue:(id)value enableVersion:(BOOL)enable;
+ (void)saveDataWithKey:(NSString *)key ofValue:(id)value;

+ (void)clearDataWithKey:(NSString *)key enableVersion:(BOOL)enable;
+ (void)clearDataWithKey:(NSString *)key;

+ (id)getDataWithKey:(NSString *)key enableVersion:(BOOL)enable;
+ (id)getDataWithKey:(NSString *)key;

@end
