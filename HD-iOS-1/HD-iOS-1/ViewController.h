//
//  ViewController.h
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/2/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"
#import "CountryCell.h"
#import "CityListViewController.h"
#import "ImageCache.h"
#import "RightCustomSegueUnwind.h"

@interface ViewController : UIViewController  <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray* countriesArray;
@property (nonatomic, weak) ImageCache* myImageCache;

-(void) fetchJSON;
-(void) backdroundLoadImage:(NSURL *)imgURL;
@end

