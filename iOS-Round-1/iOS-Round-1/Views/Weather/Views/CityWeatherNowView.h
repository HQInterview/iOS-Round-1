//
//  CityWeatherNowView.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/4/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CityWeatherNowViewModel;

IB_DESIGNABLE
@interface CityWeatherNowView : UIView

- (void)bindViewModel:(CityWeatherNowViewModel *)viewModel;

@end
