//
//  UIImage+Ext.h
//

@interface UIImage (Ext)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end

@interface UIImageView (Ext)

- (void)getImageWithURL:(NSString *)url placeholder:(NSString *)placeholder;

@end
