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
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) NSMutableArray *weatherForecastMutableArray;
@property (strong, nonatomic) NSDictionary *city_daily_weather;
@property (weak, nonatomic) IBOutlet UITableView *weatherForecastTableView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureStatement;
@property (strong, nonatomic) NSMutableArray *animatedCell;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.city.city_name;
    
    self.weatherForecastMutableArray = [NSMutableArray new];
    self.animatedCell = [NSMutableArray new];
    [self createGradientBackground];
    [self retrieveWeatherForecastForSelectedCity];
    [self stylingTemperatureStatementLabel];

}

-(void)stylingTemperatureStatementLabel {
    
    self.temperatureStatement.text = @"All temperature are displayed in Celcius";
    self.temperatureStatement.textColor = [UIColor whiteColor];
    self.temperatureStatement.font = [UIFont systemFontOfSize:12];
    self.temperatureStatement.backgroundColor = [UIColor clearColor];
}

-(void)createGradientBackground {
    
    [self.weatherForecastTableView setBackgroundColor:[UIColor clearColor]];
    UIColor *topColor = [UIColor colorWithRed:0.11 green:0.17 blue:0.39 alpha:1];
    UIColor *bottomColor = [UIColor colorWithRed:0.97 green:0.80 blue:0.86 alpha:1];
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    gradientLayer.frame = self.view.frame;
    
    UIView *gradientView = [[UIView alloc] initWithFrame:self.view.bounds];
    [gradientView.layer addSublayer:gradientLayer];
    
    [self.view addSubview:gradientView];
    [self.view sendSubviewToBack:gradientView];
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
    
    [cell.icon sd_setImageWithURL:[NSURL URLWithString:weather.iconUrl] placeholderImage:[UIImage imageNamed:@"test"]];
    
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

-(void)tableView:(UITableView *)tableView willDisplayCell:(WeatherDetailsTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (![self.animatedCell containsObject:indexPath]) {
        cell.icon.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0);
        cell.maxTemp.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 500, 10, 0);
        cell.minTemp.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 500, 10, 0);
        cell.summary.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 500, 10, 0);
        
        
        [UIView animateWithDuration:1 animations:^{
            
            cell.icon.layer.transform = CATransform3DIdentity;
            cell.maxTemp.layer.transform = CATransform3DIdentity;
            cell.minTemp.layer.transform = CATransform3DIdentity;
            cell.summary.layer.transform = CATransform3DIdentity;
            
        }];
        
        [self.animatedCell addObject:indexPath];
    }
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
    [self.weatherForecastMutableArray removeLastObject];
}


@end
