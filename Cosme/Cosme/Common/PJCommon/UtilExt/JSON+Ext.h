//
//  NSString+Ext.h
//  Cosme
//
//  Created by peijingwu on 17/2/10.
//  Copyright © 2017年 pjdev.com.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSObject (JSON)

- (NSString *)jsonString;
- (NSString *)jsonStringWithOptions:(NSJSONWritingOptions)options;

@end

@interface NSString(JSON)

- (id)objectFromJSONString;

@end
