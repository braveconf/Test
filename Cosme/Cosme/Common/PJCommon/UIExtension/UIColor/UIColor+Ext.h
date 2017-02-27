//
//  UIColor+HexColor.h
//  Jikeyi
//
//  Created by zhengpeng on 14-4-8.
//  Copyright (c) 2014年 zhengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kHexColor(hexValue) [UIColor colorWithHex:hexValue alpha:1.0]
#define kHexColorAlpha(hexValue, aValue) [UIColor colorWithHex:hexValue alpha:aValue]
#define RGB(a,b,c) RGB1(a,b,c,1)
#define RGB1(a,b,c,alphaV) [UIColor colorWithHex:(a * 256 * 256 + b * 256 + c) alpha:alphaV]

@interface UIColor (HexColor)

+ (UIColor *)colorWithHex:(uint)hex;
+ (UIColor *)colorWithHex:(uint)hex alpha:(CGFloat)alpha;

@end
