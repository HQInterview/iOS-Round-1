//
//  LocationHeaderViewCell.h
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/27/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LocationHeaderViewCell;
@protocol LocationHeaderViewCellDelegate <NSObject>

- (void)tapHeaderView:(LocationHeaderViewCell *)view section:(NSInteger)section;

@end

@interface LocationHeaderViewCell : UITableViewCell
{
    __weak IBOutlet UILabel *headerLB;
    __weak IBOutlet UIImageView *headerImageView;
    __weak IBOutlet UIView *uplineView;
    __weak IBOutlet UIView *downlineView;
}

@property (nonatomic , weak)id delegate;

- (void)setHeaderWithText:(NSString *)text;
- (void)setHeaderImageWithURL:(NSString *)url;
- (NSInteger)getHeaderHeight;
- (void)setDownlineHidden:(BOOL)hidden;
- (void)setUplineHidden:(BOOL)hidden;

@end
