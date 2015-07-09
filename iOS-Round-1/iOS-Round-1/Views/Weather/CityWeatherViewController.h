//
//  CityWeatherViewController.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/4/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CityWeatherViewModel;
@interface CityWeatherViewController : UIViewController

- (instancetype)initWithViewModel:(CityWeatherViewModel *)viewModel;

@end
