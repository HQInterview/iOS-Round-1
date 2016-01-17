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
    
    self.backgroundColor = [UIColor colorWithRed:0.70 green:0.70 blue:0.70 alpha:1];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.maxTemp sizeToFit];
    [self.minTemp sizeToFit];
    [self.summary sizeToFit];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
