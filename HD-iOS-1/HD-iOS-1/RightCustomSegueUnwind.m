//
//  RightCustomSegueUnwind.m
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/4/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import "RightCustomSegueUnwind.h"

@implementation RightCustomSegueUnwind

- (void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
    [sourceViewController.view insertSubview:destinationViewController.view atIndex:0];
    
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    [window insertSubview:destinationViewController.view aboveSubview:sourceViewController.view];
    
    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         sourceViewController.view.frame = CGRectOffset(sourceViewController.view.frame, width, 0.0);
                         destinationViewController.view.frame = CGRectOffset(destinationViewController.view.frame, width, 0.0);
                     }
                     completion:^(BOOL finished){
                         [sourceViewController dismissViewControllerAnimated:NO completion:NULL];
                     }];
}

@end
