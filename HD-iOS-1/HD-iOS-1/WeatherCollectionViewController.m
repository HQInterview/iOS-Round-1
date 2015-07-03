//
//  WeatherCollectionViewController.m
//  HD-iOS-1
//
//  Created by ariyasuk-k on 7/3/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import "WeatherCollectionViewController.h"

@interface WeatherCollectionViewController ()

@end

@implementation WeatherCollectionViewController

static NSString * const reuseIdentifier = @"WeatherCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WeatherCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WeatherCell" forIndexPath:indexPath];
    // Configure the cell
    Weather* targetWeather = nil;
    if (indexPath.row == 0){
        NSLog(@"%@", self.currentWeather.timeString);
        targetWeather = self.currentWeather;
        cell.headerLabel.text = @"Bangkok";
        
    } else {
        
        NSLog(@"%ld", indexPath.row - 1);
        targetWeather = [self.weatherArray objectAtIndex:indexPath.row - 1];
        cell.headerLabel.text = targetWeather.timeString;
    }
    cell.summaryLabel.text  = self.currentWeather.summary;
    cell.temperature.text = self.currentWeather.tempCelsiusString;
    cell.tempMaxMin.text = [NSString stringWithFormat:@"%@/%@", self.currentWeather.tempMaxCelciusString, self.currentWeather.tempMinCelciusString];
    
    ImageCache* imgCache = [ImageCache sharedInstance];
    UIImage* image = [imgCache loadImage:[NSURL URLWithString:targetWeather.iconURL]];
    if (image != nil) {
        cell.imageView.image = image;
    } else {
        image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:targetWeather.iconURL]]];
        [imgCache cacheImage:[NSURL URLWithString:targetWeather.iconURL] image:image];
        cell.imageView.image = image;
    }
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

// MARK:- collection cell prefer size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width/2 - 10,
                      [[UIScreen mainScreen] bounds].size.height/3);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5.0;
}
@end
