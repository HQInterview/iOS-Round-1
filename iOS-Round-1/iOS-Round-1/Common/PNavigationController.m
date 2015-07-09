//
//  PNavigationController.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/7/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "PNavigationController.h"

@interface PNavigationController ()

@end

@implementation PNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if ([self.topViewController respondsToSelector:@selector(preferredStatusBarStyle)]) {
        return [self.topViewController preferredStatusBarStyle];
    }
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
