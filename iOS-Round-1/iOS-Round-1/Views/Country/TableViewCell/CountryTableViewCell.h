//
//  CountryTableViewCell.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/2/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountryTableViewCellModel;
@interface CountryTableViewCell : UITableViewCell

- (void)bindViewModel:(CountryTableViewCellModel *)cellModel;

@end
