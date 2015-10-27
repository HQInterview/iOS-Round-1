//
//  CityTableViewCell.h
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/27/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CityInfo;

@interface CityTableViewCell : UITableViewCell
{
    __weak IBOutlet UILabel *cityLB;
    __weak IBOutlet UIView *downlineView;
}

- (void)setCityInformation:(CityInfo *)city;
- (void)setDownlineHidden:(BOOL)hidden;

@end
