//
//  LocationsViewController.h
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/26/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationHeaderViewCell.h"
#import "ContentManager.h"

@interface LocationsViewController : UIViewController <UITableViewDataSource , UITableViewDelegate , LocationHeaderViewCellDelegate>
{
    __weak IBOutlet UITableView *locationsTableView;
    
    NSMutableIndexSet *expandedSections;
    Countries *countries;
}

@end
