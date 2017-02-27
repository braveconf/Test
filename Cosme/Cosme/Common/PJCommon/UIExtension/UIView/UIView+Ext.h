//
//  UIView+Ext.h
//
//

#import <UIKit/UIKit.h>
@interface UIView (Ext)

- (CGFloat)left;
- (CGFloat)right;
- (CGFloat)top;
- (CGFloat)bottom;
- (CGSize)size;
- (CGFloat)width;
- (CGFloat)height;
- (CGFloat)centerX;
- (CGFloat)centerY;
- (CGFloat)myCenterX;
- (CGFloat)myCenterY;
- (CGPoint)myCenter;

- (void)setLeft:(CGFloat)left;
- (void)setRight:(CGFloat)right;
- (void)setBottom:(CGFloat)bottom;
- (void)setTop:(CGFloat)top;
- (void)setSize:(CGSize)size;
- (void)setWidth:(CGFloat)width;
- (void)setHeight:(CGFloat)height;
- (void)setOrigin:(CGPoint)point;
- (void)setCenterX:(CGFloat)centerX;
- (void)setCenterY:(CGFloat)centerY;
- (void)setAddTop:(CGFloat)top;
- (void)setAddLeft:(CGFloat)left;


- (void)moveBy: (CGPoint) delta;
- (void)scaleBy: (CGFloat) scaleFactor;
- (void)fitInSize: (CGSize) aSize;

- (UIViewController *)viewController;

@end
