//
//  AppDelegate.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

/**
 
 Formatter was put in AppDelegate for performance issue.
 
 */
@property (nonatomic, readonly) NSDateFormatter *dateFormatter;


@end

