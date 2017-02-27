//
//  global.h
//  lingtouniao
//
//  Created by peijingwu on 16/4/9.
//  Copyright © 2016年 lingtouniao. All rights reserved.
//

#ifndef global_h
#define global_h


#define kMainColor [UIColor colorWithRed:252.0/255 green:78.0/255 blue:132.0/255 alpha:1]

#define kNavigationBackgroundColor kHexColor(0xfafafa)
#define kBackgroundColor1 [UIColor whiteColor]

#define kDisabledColor         [UIColor colorWithHex:0xcccccc alpha:1]

//标题
#define kMainColor1         [UIColor colorWithHex:0x202020 alpha:1]

//content
//104, 104, 104
#define kSubColor1         [UIColor colorWithHex:0x686868 alpha:1]

//indicator line color
#define kSubColor2         [UIColor colorWithHex:0xc8c8c8 alpha:1]

//separator's color
#define kSubColor3 [UIColor colorWithHex:0xf0f0f0 alpha:1]


//system Defines
#define kIsIOS9 SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9.0")
#define VERSION_7_0_EARLIER SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(@"7.0")

//字体大小
//#define kFont(size) [CustomerizedFont heiti:size]
//#define kStringSize(string, fontSize) [string sizeWithAttributes:@{NSFontAttributeName : kFont(fontSize)}]

//返回按钮图片名字
#define kBackButtonIcon @"nav_return"

//default viewcontroller's background color
#define kBackgroundColor [UIColor colorWithHex:0xf3f5f7 alpha:1]
#define kTableViewBackgroundColor [UIColor colorWithHex:0xf0f0f0 alpha:1]


#endif /* global_h */
