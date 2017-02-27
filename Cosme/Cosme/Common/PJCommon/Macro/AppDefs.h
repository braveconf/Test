//
//  AppDefs.h
//  lingtouniao
//
//  Created by peijingwu on 16/5/21.
//  Copyright © 2016年 lingtouniao. All rights reserved.
//

#ifndef AppDefs_h
#define AppDefs_h


#define kSystemVersion [[UIDevice currentDevice] systemVersion]
//版本比较
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([kSystemVersion compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([kSystemVersion compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([kSystemVersion compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([kSystemVersion compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([kSystemVersion compare:v options:NSNumericSearch] != NSOrderedDescending)

//目标屏幕的宽
#define kScreenWidth        [UIScreen mainScreen].bounds.size.width
//目标屏幕的高
#define kScreenHeight       [UIScreen mainScreen].bounds.size.height
//目标屏幕尺寸
#define ScreenBounds         [[UIScreen mainScreen] bounds]

#define kMargin (kScreenWidth == 320 ? 10 : 15)

// weakself
#define kWeakSelf __weak typeof (self) weakSelf = self;
#define kStrongSelf __strong __typeof(&*weakSelf)strongSelf = weakSelf;
#define kWeakObj(obj)  __weak typeof(obj) weakObj = obj;
#define kWeak(var, weakVar) __weak __typeof(&*var) weakVar = var

//DLog
#if (ADHOC > 0 || DEBUG > 0)
#	define DLog(fmt, ...) NSLog((@"%s #%d " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#	define DLog(...)
#endif

#endif /* AppDefs_h */
