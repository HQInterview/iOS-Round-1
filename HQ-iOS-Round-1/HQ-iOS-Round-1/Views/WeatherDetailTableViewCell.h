//
//  WeatherDetailTableViewCell.h
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/25/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeatherInfo;

@interface WeatherDetailTableViewCell : UITableViewCell
{
    
    __weak IBOutlet UIImageView *iconImageView;
    __weak IBOutlet UILabel *summaryLB;
    __weak IBOutlet UILabel *tempLB;
    __weak IBOutlet UILabel *minTempLB;
    __weak IBOutlet UILabel *maxTempLB;
    __weak IBOutlet UILabel *dateLB;
}

- (void)setWeatherInformation:(WeatherInfo *)weather;

@end
