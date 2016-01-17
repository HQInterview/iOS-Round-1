//
//  WeatherDetailsTableViewCell.m
//  HotelQuicklyRound1
//
//  Created by Ang Jian Yao on 17/01/2016.
//  Copyright © 2016 Ang Jian Yao. All rights reserved.
//

#import "WeatherDetailsTableViewCell.h"

@implementation WeatherDetailsTableViewCell

- (void)awakeFromNib {
    
    self.icon.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.maxTemp sizeToFit];
    [self.minTemp sizeToFit];
    [self.summary sizeToFit];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
