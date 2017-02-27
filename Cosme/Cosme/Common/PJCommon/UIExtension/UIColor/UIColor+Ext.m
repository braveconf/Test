//
//  UIColor+HexColor.m
//  Jikeyi
//
//  Created by zhengpeng on 14-4-8.
//  Copyright (c) 2014年 zhengpeng. All rights reserved.
//

#import "UIColor+Ext.h"

@implementation UIColor (HexColor)
+ (UIColor *)colorWithHex:(uint)hex {
    return [self colorWithHex:hex alpha:1];
}

+ (UIColor *)colorWithHex:(uint)hex alpha:(CGFloat)alpha
{
    NSInteger red, green, blue;

    blue = hex & 0x0000FF;
    green = ((hex & 0x00FF00) >> 8);
    red = ((hex & 0xFF0000) >> 16);

    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

@end
