//
//  WeatherViewController.h
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/24/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentManager.h"

@interface WeatherViewController : UIViewController
{
    __weak IBOutlet UITableView *weatherTableView;
    __weak IBOutlet UILabel *locationLB;
    __weak IBOutlet UILabel *currentTempLB;
    __weak IBOutlet UILabel *currentSummary;
    __weak IBOutlet UIImageView *backgroundImageView;
    __weak IBOutlet UILabel *tempMaxMinLB;
    
    Weather *weather;
}

@end
