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
    
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.dateString sizeToFit];
    [self.dateString setFont:[UIFont systemFontOfSize:14]];
    [self.dateString setTextColor:[UIColor whiteColor]];
    
    [self.maxTemp sizeToFit];
    [self.maxTemp setFont:[UIFont systemFontOfSize:18]];
    [self.maxTemp setTextColor:[UIColor whiteColor]];
    
    [self.minTemp sizeToFit];
    [self.minTemp setFont:[UIFont systemFontOfSize:18]];
    [self.minTemp setTextColor:[UIColor whiteColor]];
    
    [self.summary sizeToFit];
    [self.summary setFont:[UIFont systemFontOfSize:18]];
    [self.summary setTextColor:[UIColor whiteColor]];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
