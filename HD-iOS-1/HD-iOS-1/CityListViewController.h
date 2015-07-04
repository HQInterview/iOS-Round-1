//
//  CityListViewController.h
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/3/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"
#import "CityCell.h"
#import "ImageCache.h"
#import "Weather.h"
#import "WeatherCollectionViewController.h"
#import "RightCustomSegueUnwind.h"

@interface CityListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSString* countryName;
@property (nonatomic, strong) NSString* coverImgURL;
@property (nonatomic, strong) NSArray* citiesArray;
@end
