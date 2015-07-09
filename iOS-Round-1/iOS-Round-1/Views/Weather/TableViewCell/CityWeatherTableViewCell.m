//
//  CityWeatherTableViewCell.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera (Agoda) on 7/7/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CityWeatherTableViewCell.h"
#import "CityWeatherTableViewCellModel.h"
#import "UIImageView+WebCache.h"

@interface CityWeatherTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIconView;
@property (weak, nonatomic) IBOutlet UILabel *minimumTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *maximumTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;

@end

@implementation CityWeatherTableViewCell

- (void)bindViewModel:(CityWeatherTableViewCellModel *)cellModel {
    self.dateLabel.text = cellModel.dayOfWeekString;
    self.dayLabel.text = cellModel.dayMonthString;
    self.minimumTempLabel.text = cellModel.minimumTempString;
    self.maximumTempLabel.text = cellModel.maximumTempString;
    self.summaryLabel.text = cellModel.summaryString;
    [self.weatherIconView sd_setImageWithURL:cellModel.weatherIconUrl];
}

@end
