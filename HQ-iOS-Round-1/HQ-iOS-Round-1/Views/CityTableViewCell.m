//
//  CityTableViewCell.m
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/27/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import "CityTableViewCell.h"
#import "CityInfo.h"

@implementation CityTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCityInformation:(CityInfo *)city {
    cityLB.text = city.name;
}

- (void)setDownlineHidden:(BOOL)hidden {
    [downlineView setHidden:hidden];
}

@end
