//
//  CountryTableViewCell.m
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import "CountryTableViewCell.h"
#import "CountryTableViewCellModel.h"
#import "UIImageView+WebCache.h"

@interface CountryTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *flagImageView;
@property (weak, nonatomic) IBOutlet UILabel *countryNameLabel;

@end

@implementation CountryTableViewCell


- (void)bindViewModel:(CountryTableViewCellModel *)cellModel {
    self.countryNameLabel.text = cellModel.cellTitle;
    [self.flagImageView sd_setImageWithURL:[NSURL URLWithString:cellModel.flagUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
