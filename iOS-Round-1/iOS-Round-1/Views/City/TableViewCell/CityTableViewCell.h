//
//  CityTableViewCell.h
//  iOS-Round-1
//
//  Created by Kerdkokeo, Peera on 7/3/2558 BE.
//  Copyright (c) 2558 TeddyGoGo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CityTableViewCellModel;
@interface CityTableViewCell : UITableViewCell

- (void)bindViewModel:(CityTableViewCellModel *)cellModel;

@end
