//
//  CityWeatherTableViewCell.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/7/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CityWeatherTableViewCellModel;
@interface CityWeatherTableViewCell : UITableViewCell

- (void)bindViewModel:(CityWeatherTableViewCellModel *)cellModel;

@end
