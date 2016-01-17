//
//  DetailsViewController.m
//  HotelQuicklyRound1
//
//  Created by Ang Jian Yao on 17/01/2016.
//  Copyright © 2016 Ang Jian Yao. All rights reserved.
//

#import "DetailsViewController.h"
#import "Weather.h"
#import "WeatherDetailsTableViewCell.h"

@interface DetailsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSMutableArray *weatherForecastMutableArray;
@property (strong, nonatomic) NSDictionary *city_daily_weather;
@property (weak, nonatomic) IBOutlet UITableView *weatherForecastTableView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureStatement;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.weatherForecastMutableArray = [NSMutableArray new];
    [self retrieveWeatherForecastForSelectedCity];
    
    self.temperatureStatement.text = @"All temperature are displayed in Celcius";
    self.temperatureStatement.font = [UIFont systemFontOfSize:12];
    
    self.weatherForecastTableView.backgroundColor = [UIColor colorWithRed:0.70 green:0.70 blue:0.70 alpha:1];
    self.view.backgroundColor = [UIColor colorWithRed:0.70 green:0.70 blue:0.70 alpha:1];
    self.temperatureStatement.backgroundColor = [UIColor colorWithRed:0.70 green:0.70 blue:0.70 alpha:1];
}

-(NSDateFormatter*)modifyDateFormatter {
    static NSDateFormatter *modifyDateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        modifyDateFormatter = [NSDateFormatter new];
        [modifyDateFormatter setDateFormat:@"yyyy-MM-dd"];
    });
    return modifyDateFormatter;
}

-(NSDateFormatter*)formatter {
    static NSDateFormatter *formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        formatter = [NSDateFormatter new];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    });
    return formatter;
}


-(void)createDateTimeFormatter:(NSString *)dateString forWeather:(Weather*)weather {
    
    NSDate *date = [[self formatter] dateFromString:dateString];
    weather.timeString = [[self modifyDateFormatter] stringFromDate:date];
}

#pragma mark - table
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.weatherForecastMutableArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Weather *weather = [self.weatherForecastMutableArray objectAtIndex:indexPath.row];
    
    WeatherDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherForecastCellID"];
    cell.icon.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:weather.iconUrl]]];
    cell.summary.text = [NSString stringWithFormat:@"Summary: %@",weather.summary];
    cell.maxTemp.text = [NSString stringWithFormat:@"Max: %@", weather.max_temp];
    cell.minTemp.text = [NSString stringWithFormat:@"Min: %@", weather.min_temp];
    
    if (indexPath.row == 0) {
        cell.dateString.text = [NSString stringWithFormat:@"%@ (Currently)", weather.timeString];
    } else {
        cell.dateString.text = weather.timeString;
    }

    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
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
        
        [self createDateTimeFormatter:weather.timeString forWeather:weather];
        
        [self.weatherForecastMutableArray addObject:weather];
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeString" ascending:TRUE];
        [self.weatherForecastMutableArray sortUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
    }
}


@end
