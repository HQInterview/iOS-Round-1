//
//  CountryCell.h
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/3/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountryCell : UITableViewCell <NSURLConnectionDataDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *flagImgView;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;

@end
