//
//  DetailsViewController.m
//  HotelQuicklyRound1
//
//  Created by Ang Jian Yao on 17/01/2016.
//  Copyright © 2016 Ang Jian Yao. All rights reserved.
//

#import "DetailsViewController.h"
#import "Weather.h"

@interface DetailsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSMutableArray *weatherForecastMutableArray;
@property (strong, nonatomic) NSDictionary *city_daily_weather;
@property (weak, nonatomic) IBOutlet UITableView *weatherForecastTableView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.weatherForecastMutableArray = [NSMutableArray new];
    [self retrieveWeatherForecastForSelectedCity];
    
}

#pragma mark - table
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.weatherForecastMutableArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Weather *weather = [self.weatherForecastMutableArray objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherForecastCellID"];
    cell.textLabel.text = weather.summary;
    return cell;
    
}

#pragma mark - retrieve weather forecast
-(void)retrieveWeatherForecastForSelectedCity {
    
    NSArray *weatherDetails = [self.city.city_daily_weather allValues];
    
    for (NSDictionary *weatherForecast in weatherDetails) {
        
        Weather *weather = [Weather new];
        weather.max_temp = [weatherForecast valueForKeyPath:@"tempMaxCelcius"];
        weather.min_temp = [weatherForecast valueForKeyPath:@"tempMinCelcius"];
        weather.iconUrl = [weatherForecast objectForKey:@"iconUrl"];
        weather.summary = [weatherForecast valueForKeyPath:@"summary"];
        weather.timeString = [weatherForecast valueForKeyPath:@"timeString"];
        
        [self.weatherForecastMutableArray addObject:weather];
    }
}


@end
