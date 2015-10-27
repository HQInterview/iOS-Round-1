//
//  LocationHeaderViewCell.m
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/27/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import "LocationHeaderViewCell.h"
#import <UIImageView+AFNetworking.h>

@implementation LocationHeaderViewCell

- (void)awakeFromNib {
    // Initialization code
    [self addTapGesture];
    CALayer *imageLayer = headerImageView.layer;
    [imageLayer setCornerRadius:headerImageView.frame.size.width/2];
    [imageLayer setMasksToBounds:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)addTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureHandle:)];
    [tap setNumberOfTapsRequired:1];
    [self addGestureRecognizer:tap];    
}

- (void)setHeaderWithText:(NSString *)text {
    headerLB.text = text;
}

- (void)setHeaderImageWithURL:(NSString *)url {
    [headerImageView setImageWithURL:[NSURL URLWithString:url]];
}

- (void)tapGestureHandle:(UITapGestureRecognizer *)tapObj {
    NSInteger section = tapObj.view.tag;
    [_delegate tapHeaderView:self section:section];
}

- (NSInteger)getHeaderHeight {
    return self.bounds.size.height;
}

- (void)setDownlineHidden:(BOOL)hidden {
    [downlineView setHidden:hidden];
}

- (void)setUplineHidden:(BOOL)hidden {
    [uplineView setHidden:hidden];
}

@end
