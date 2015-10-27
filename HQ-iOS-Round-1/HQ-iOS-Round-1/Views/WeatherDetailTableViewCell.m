//
//  WeatherDetailTableViewCell.m
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/25/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import "WeatherDetailTableViewCell.h"
#import "WeatherInfo.h"
#import <UIImageView+AFNetworking.h>

@implementation WeatherDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setWeatherInformation:(WeatherInfo *)weather {
    [iconImageView setImageWithURL:[NSURL URLWithString:weather.iconUrl]];
    summaryLB.text = weather.summary;
    tempLB.text = weather.tempCelsius;
    minTempLB.text = weather.tempMinCelcius;
    maxTempLB.text = weather.tempMaxCelcius;
    dateLB.text = (weather.isCurrently)?@"Today":weather.date;
}

@end
