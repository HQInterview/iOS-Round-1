//
//  WeatherViewController.m
//  HQ-iOS-Round-1
//
//  Created by Nathapong Masathien on 10/24/2558 BE.
//  Copyright © 2558 Nathapong Masathien. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherDetailTableViewCell.h"
#import <UIImageView+AFNetworking.h>

static NSString *weatherIdentifier = @"weatherIdentifier";

@interface WeatherViewController () <UITableViewDataSource , UITableViewDelegate>

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    weather = [ContentManager sharedInstance].weather;
    [self setCurrentWeatherInformation];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.view.layer.shouldRasterize = YES;
    self.view.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CountryInfo *selectedCountry = [ContentManager sharedInstance].selectedCountry;
    [backgroundImageView setImageWithURL:[NSURL URLWithString:[selectedCountry coverImageURLWithWidth:self.view.bounds.size.width height:self.view.bounds.size.height]]];
}

- (void)setCurrentWeatherInformation {
    CountryInfo *selectedCountry = [ContentManager sharedInstance].selectedCountry;
    CityInfo *selectedCity = [ContentManager sharedInstance].selectedCity;
    WeatherInfo *currentWeather = [weather getCurrentWeather];
    
    currentTempLB.text = currentWeather.tempCelsius;
    locationLB.text = [NSString stringWithFormat:@"%@, %@",selectedCity.name,selectedCountry.name];
    currentSummary.text = currentWeather.summary;
    tempMaxMinLB.text = [NSString stringWithFormat:@"%@/%@",currentWeather.tempMinCelcius,currentWeather.tempMaxCelcius];
}

#pragma mark - Action

- (IBAction)backToLocations:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [weather numberOfDailyDate];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeatherDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:weatherIdentifier];
    cell.backgroundColor = [UIColor clearColor];
    WeatherInfo *aWeather = [weather weatherOnDate:[weather dailyKeyAtIndex:indexPath.row]];
    [cell setWeatherInformation:aWeather];
    return cell;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
