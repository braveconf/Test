//
//  Utility.m
//  YWK
//
//  Created by peijingwu on 16/12/24.
//  Copyright © 2016年 pingan.com.cn. All rights reserved.
//

#import "projectcommon.h"
#import <CommonCrypto/CommonCrypto.h>


@implementation Utility

+ (void)customizeNavigationBar:(UIColor *)color fontSize:(CGFloat)fontSize fontColor:(UIColor *)fontColor {
    UIImage *image = [UIImage imageWithColor:color size:CGSizeMake(1, 1)];
    [[UINavigationBar appearance] setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    NSDictionary *ats = @{
                          NSFontAttributeName : [UIFont systemFontOfSize:fontSize],
                          NSForegroundColorAttributeName : fontColor
                          };
    [UINavigationBar appearance].titleTextAttributes = ats;
}

+ (UILabel *)createLabel:(CGFloat)fontSize color:(UIColor *)textColor {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = textColor;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:fontSize];
    return label;
}

+ (UIButton *)createButtonWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font block:(ButtonBlockAction)block {
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn.titleLabel setFont:font];
    [btn sizeToFit];
    btn.tappedBlock = block;
    return btn;
}

#pragma mark -

+ (NSString *)appName
{
    NSString *name = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    return name;
}

+ (NSString*)boundleIdentifier
{
    NSString *name = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
    return name;
}

+ (NSString *)appVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = infoDictionary[@"CFBundleShortVersionString"];

#if (defined(DEBUG) || defined(ADHOC))
    NSString *build = infoDictionary[@"CFBundleVersion"];
    version = [NSString stringWithFormat:@"v%@ build %@", version, build];
#else
    version = [@"v" stringByAppendingString:version];
#endif
    return version;
}

+ (NSString *)appMarketVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = infoDictionary[@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)appBuildVersion{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *build = infoDictionary[@"CFBundleVersion"];
    return build;
}

+ (NSURL *)urlFromString:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];

    return url;
}

+ (void)openURL:(NSString *)urlString {
    //http://stackoverflow.com/questions/19356488/openurl-freezes-app-for-over-10-seconds

    NSURL *url = [self urlFromString:urlString];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        [[UIApplication sharedApplication] openURL:url];
    });
}

+ (CGFloat)singleLineWidth {
    return 1 / [UIScreen mainScreen].scale;
}

//simple methods
+ (void)rating {
    [self openURL:kRatingUrl];
}

+ (void)clearCache {

}

+ (NSString *)md5:(NSString *)input {
    const char *cStr = [input UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, (unsigned int)strlen(cStr), digest );

    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];

    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];

    return  output;
}

+ (NSString *)serialize:(NSDictionary *)dict {
    NSArray *sortedValues = [[dict allKeys] sortedArrayUsingSelector: @selector(compare:)];
    
    if ([sortedValues count] == 0) {
        NSAssert(NO, @"sign empty data");
        return @"";
    }

    NSMutableString *inputString = [NSMutableString stringWithFormat:@"%@=%@",[sortedValues objectAtIndex:0],[dict valueForKey:[sortedValues objectAtIndex:0]]];
    for (int i = 1; i < [sortedValues count]; i++) {
        [inputString appendString:[NSString stringWithFormat:@"&%@=%@",[sortedValues objectAtIndex:i],[dict valueForKey:[sortedValues objectAtIndex:i]]]];
    }
    return inputString;
}

+ (NSString *)sign:(NSDictionary *)dict {
    NSString *result = [self serialize:dict];
    result = [Utility md5:result];
    return result;
}

@end
