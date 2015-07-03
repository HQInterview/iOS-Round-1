//
//  CityListViewController.m
//  HD-iOS-1
//
//  Created by Kittikorn Ariyasuk on 7/3/15.
//  Copyright (c) 2015 TorIsHere. All rights reserved.
//

#import "CityListViewController.h"

@interface CityListViewController ()

@end

@implementation CityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.countryLabel.text = self.countryName;
    ImageCache* imgCache = [ImageCache sharedInstance];
    UIImage* image = [imgCache loadImage:[NSURL URLWithString:self.coverImgURL]];
    if (image != nil) {
        self.bgImageView.image = image;
    } else {
        image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.coverImgURL]]];
        self.bgImageView.image = image;
    }
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d", (int)[self.citiesArray count]);
    return [self.citiesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CityCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CityCell"];
    
    City* cityObj = [self.citiesArray objectAtIndex:indexPath.row];
    NSLog(@"%@", cityObj.cityName);
    cell.cityNameLabel.text = cityObj.cityName;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath");
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willSelectRowAtIndexPath");
    
    return indexPath;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

@end
