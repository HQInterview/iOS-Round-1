//
//  CityTableViewCell.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/3/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CityTableViewCell.h"
#import "CityTableViewCellModel.h"

@implementation CityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
        self.textLabel.textColor = [UIColor darkGrayColor];
    }
    return self;
}

- (void)bindViewModel:(CityTableViewCellModel *)cellModel {
    self.textLabel.text = cellModel.cellTitle;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
