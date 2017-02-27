//
//  UIImage+Ext.m
//

#import "UIImage+Ext.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImage (Ext)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    //TODO PJ: prefer use the one with options version, not sure
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
//    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

@implementation UIImageView (Ext)

- (void)getImageWithURL:(NSString *)url placeholder:(NSString *)placeholder {
    [self getImageWithURL:url placeholder:placeholder options:SDWebImageRetryFailed | SDWebImageAvoidAutoSetImage completion:nil];
}

- (void)getImageWithURL:(NSString *)url placeholder:(NSString *)placeholder options:(SDWebImageOptions)options completion:(SDWebImageCompletionBlock)completionBlock {
    kWeakSelf
    [self sd_setImageWithURL:[Utility urlFromString:url] placeholderImage:[UIImage imageNamed:placeholder] options:options completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        kStrongSelf
        if (image) {
            @try {
                image = [UIImage imageWithCGImage:image.CGImage scale:[UIScreen mainScreen].scale orientation:image.imageOrientation];
                strongSelf.image = image;
            }
            @catch(NSException *ex) {
            }
        }

        if (!strongSelf.image) {
            NSLog(@"image download failed: %@", url);
        }
        if (completionBlock) {
            completionBlock(image, error, cacheType, imageURL);
        }
    }];
}

@end
