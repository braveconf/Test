//
//  Preferences.m
//  YWK
//
//  Created by peijingwu on 17/1/14.
//  Copyright © 2017年 pingan.com.cn. All rights reserved.
//

#import "Preferences.h"

#define UserDefaults_DATA_CACHE @"UD_%@_%@"


@implementation Preferences
+ (NSString *)versionKey:(BOOL)enable {
    return enable ? @"" : [Utility appVersion];
}

+ (void)saveDataWithKey:(NSString *)key ofValue:(id)value enableVersion:(BOOL)enable {
    NSString *k = [NSString stringWithFormat:UserDefaults_DATA_CACHE, [self versionKey:enable], key];
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:k];
}

+ (void)saveDataWithKey:(NSString *)key ofValue:(id)value {
    [self saveDataWithKey:key ofValue:value enableVersion:NO];
}

+ (void)clearDataWithKey:(NSString *)key enableVersion:(BOOL)enable {
    NSString *k = [NSString stringWithFormat:UserDefaults_DATA_CACHE, [self versionKey:enable], key];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:k];
}

+ (void)clearDataWithKey:(NSString *)key {
    [self clearDataWithKey:key enableVersion:NO];
}

+ (id)getDataWithKey:(NSString *)key enableVersion:(BOOL)enable {
    NSString *k = [NSString stringWithFormat:UserDefaults_DATA_CACHE, [self versionKey:enable], key];
    return [[NSUserDefaults standardUserDefaults] objectForKey:k];
}

+ (id)getDataWithKey:(NSString *)key {
    return [self getDataWithKey:key enableVersion:NO];
}

@end
