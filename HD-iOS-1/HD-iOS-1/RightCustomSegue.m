//
//  RightCustomSegue.m
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/4/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import "RightCustomSegue.h"

@implementation RightCustomSegue

- (void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    UIViewController *destinationViewController = self.destinationViewController;
    
    [sourceViewController.view addSubview:destinationViewController.view];
    
    CGFloat height = [[UIScreen mainScreen] bounds].size.height;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    
    destinationViewController.view.frame = CGRectMake(width, 0.0, width, height);

    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    [window insertSubview:destinationViewController.view aboveSubview:sourceViewController.view];

    [UIView animateWithDuration:0.5
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         sourceViewController.view.frame = CGRectOffset(sourceViewController.view.frame, -width, 0.0);
                         destinationViewController.view.frame = CGRectOffset(destinationViewController.view.frame, -width, 0.0);
                     }
                     completion:^(BOOL finished){
                         [sourceViewController presentViewController:destinationViewController animated:NO completion:NULL];
                     }];
}

@end
