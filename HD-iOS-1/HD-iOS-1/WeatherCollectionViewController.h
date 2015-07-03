//
//  WeatherCollectionViewController.h
//  HD-iOS-1
//
//  Created by ariyasuk-k on 7/3/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherCollectionViewCell.h"
#import "Weather.h"
#import "ImageCache.h"

@interface WeatherCollectionViewController : UIViewController  <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property (nonatomic, strong)NSArray* weatherArray;
@property (nonatomic, strong)Weather* currentWeather;


@end
