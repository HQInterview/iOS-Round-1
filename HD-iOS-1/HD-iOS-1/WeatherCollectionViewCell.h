//
//  WeatherCollectionViewCell.h
//  HD-iOS-1
//
//  Created by ariyasuk-k on 7/3/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *temperature;
@property (weak, nonatomic) IBOutlet UILabel *tempMaxMin;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@end
