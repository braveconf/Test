//
//  CustomizedNavigationViewController.m
//  YWK
//
//  Created by peijingwu on 16/12/19.
//  Copyright © 2016年 pingan.com.cn. All rights reserved.
//

#import "UINavigationController+Ext.h"
#import "UIViewController+Ext.h"
#import <UINavigationController+FDFullscreenPopGesture.h>

@interface CustomTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (CustomTransition *)transitionWithType:(UINavigationControllerOperation)type
                                 duration:(NSTimeInterval)duration;

@end

@interface CustomTransition ()

@property (nonatomic, assign) UINavigationControllerOperation type;
@property (nonatomic, assign) NSTimeInterval duration;

@end

@implementation CustomTransition

+ (CustomTransition *)transitionWithType:(UINavigationControllerOperation)type
                                 duration:(NSTimeInterval)duration{
    CustomTransition *transition = [[CustomTransition alloc] init];

    transition.type = type;
    transition.duration = duration;

    return transition;
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.type) {
        case UINavigationControllerOperationPush: {
            [self present:transitionContext];
            break;
        }
        case UINavigationControllerOperationPop: {
            [self dismiss:transitionContext];
            break;
        }
        default: {
            break;
        }
    }
}

#pragma mark - Private
- (void)present:(id<UIViewControllerContextTransitioning>)transitonContext {
    UIViewController *toVC = [transitonContext viewControllerForKey:UITransitionContextToViewControllerKey];

    CGRect finalFrame = [transitonContext finalFrameForViewController:toVC];
    UIView *containerView = [transitonContext containerView];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    [containerView addSubview:toVC.view];
    toVC.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);

    NSTimeInterval duration = [self transitionDuration:transitonContext];
    [UIView animateWithDuration:duration delay:0.0 usingSpringWithDamping:1.0 initialSpringVelocity:0.0 options:0 animations:^{

        toVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitonContext completeTransition:YES];
    }];
}

- (void)dismiss:(id<UIViewControllerContextTransitioning>)transitonContext {
    UIViewController *fromVC = [transitonContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitonContext viewControllerForKey:UITransitionContextToViewControllerKey];

    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect initFrame = [transitonContext initialFrameForViewController:fromVC];
    CGRect finalFrame = CGRectOffset(initFrame, 0, screenBounds.size.height);

    UIView *containerView = [transitonContext containerView];
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];

    NSTimeInterval duration = [self transitionDuration:transitonContext];
    [UIView animateWithDuration:duration animations:^{
        fromVC.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        [transitonContext completeTransition:![transitonContext transitionWasCancelled]];
    }];
}


@end


@interface UINavigationController() <UINavigationControllerDelegate>

@end

@implementation UINavigationController(Ext)

- (void)customPushViewController:(UIViewController *)viewController
{
    self.delegate = self;
    viewController.simPresent = YES;

    //hide pop gesture if it's custom pushed
    viewController.fd_interactivePopDisabled = YES;

    [self pushViewController:viewController animated:YES];
}

- (void)customPopViewController:(UIViewController *)viewController {
    self.delegate = self;
    viewController.simPresent = YES;
    [self popViewControllerAnimated:YES];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{

    id <UIViewControllerAnimatedTransitioning> transition;

    if (((operation == UINavigationControllerOperationPop) && fromVC.simPresent) ||((operation == UINavigationControllerOperationPush) && toVC.simPresent)) {
        transition = [CustomTransition transitionWithType:operation duration:0.25];
    }

    return transition;
}

@end
