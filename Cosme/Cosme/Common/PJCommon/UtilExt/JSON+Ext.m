//
//  NSString+Ext.m
//  Cosme
//
//  Created by peijingwu on 17/2/10.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import "JSON+Ext.h"

@implementation NSString(JSON)

- (id)objectFromJSONString {
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    return result;
}

@end

@implementation NSObject (JSON)

- (NSString *)jsonString {
    return [self jsonStringWithOptions:0];
}

- (NSString *)jsonStringWithOptions:(NSJSONWritingOptions)options {
    NSString *result;
    if ([self isKindOfClass:[NSDictionary class]] || [self isKindOfClass:[NSArray class]]){
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:options error:nil];
        if ([jsonData length]) {
            result = [[NSString alloc] initWithData:jsonData
                                         encoding:NSUTF8StringEncoding];
        }
    } else if ([self isKindOfClass:[NSString class]]){
        result = (NSString *)self;
    }

    return result;
}

@end
