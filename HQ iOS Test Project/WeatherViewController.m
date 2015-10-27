//
//  WeatherViewController.m
//  HQ iOS Test Project
//
//  Created by tezadm on 10/27/15.
//  Copyright © 2015 Maksim Niagolov. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherModel.h"

@interface WeatherViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSDictionary *forecast;
    NSArray *sortedDays;
}
@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"WEATHER FORECAST";
    sortedDays = [self forecastArrayForTable:self.weather];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:@"Cell"];
    }
    NSDictionary* forecastForTheDay = [forecast objectForKey:sortedDays[indexPath.row]];
    WeatherModel* weatherInfo= [[WeatherModel alloc] initWithForecastForTheDay:forecastForTheDay];
    
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:100];
    imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:weatherInfo.iconUrl]]];
    UILabel *titleLabel = (UILabel *)[cell viewWithTag:101];
    titleLabel.text =weatherInfo.summary;
    UILabel *titleLabel2 = (UILabel *)[cell viewWithTag:102];
    titleLabel2.text =sortedDays[indexPath.row];
    UILabel *titleLabel3 = (UILabel *)[cell viewWithTag:103];
    titleLabel3.text =weatherInfo.tempMaxCelcius;
    UILabel *titleLabel4 = (UILabel *)[cell viewWithTag:104];
    titleLabel4.text =weatherInfo.tempCelcius;
    UILabel *titleLabel5 = (UILabel *)[cell viewWithTag:105];
    titleLabel5.text =weatherInfo.tempMinCelcius;
    
    return cell;
}

- (NSArray*)forecastArrayForTable:(NSDictionary *)weather;
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    forecast = [weather objectForKey:@"daily"];
    NSArray *keys = [forecast allKeys];
    NSArray * sorted_keys = [keys sortedArrayUsingSelector:@selector(compare:)];
    return sorted_keys;
}

@end
