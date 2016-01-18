//
//  ViewController.m
//  HotelQuicklyRound1
//
//  Created by Ang Jian Yao on 17/01/2016.
//  Copyright © 2016 Ang Jian Yao. All rights reserved.
//

#import "ViewController.h"
#import "CitiesViewController.h"
#import "Country.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *countryTableView;
@property (strong, nonatomic) NSMutableArray *countriesMutableArray;
@property (strong, nonatomic) NSMutableArray *animatedMutableArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Countries";
    self.animatedMutableArray = [NSMutableArray new];
    self.countriesMutableArray = [NSMutableArray new];
    
    self.countryTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self retrieveCountryInfoFromCountryDataJSON];
    [self createGradientBackground];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    
}

-(void)createGradientBackground {
    
    [self.countryTableView setBackgroundColor:[UIColor clearColor]];
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


#pragma mark - table
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.countriesMutableArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Country *country = self.countriesMutableArray[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CountryCellID"];
    
    cell.textLabel.text = country.country_name;
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:country.flag_image_url] placeholderImage:[UIImage imageNamed:@"test"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (![self.animatedMutableArray containsObject:indexPath]) {
        if (indexPath.row % 2 == 0) {
            
            cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0);
            
            [UIView animateWithDuration:1 animations:^{
                
                cell.layer.transform = CATransform3DIdentity;
                
            }];
            
        } else {
            
            cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 500, 10, 0);
            
            [UIView animateWithDuration:1 animations:^{
                
                cell.layer.transform = CATransform3DIdentity;
            }];
        }
        [self.animatedMutableArray addObject:indexPath];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"ToCitiesVC" sender:nil];
    });
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

#pragma mark - country info
-(void)retrieveCountryInfoFromCountryDataJSON {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"country_data" ofType:@"json"];
    NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSData *jsonData = [fileContents dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *jsonError;
    NSMutableDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&jsonError];
    
    NSArray *countries = [jsonDict valueForKey:@"countries"];
    
    for (NSDictionary *countryDictionary in countries) {
        Country *country = [Country new];
        country.cover_image_url = [countryDictionary valueForKeyPath:@"cover_image_url"];
        country.country_name = [countryDictionary valueForKey:@"country_name"];
        country.country_id = [countryDictionary valueForKeyPath:@"country_id"];
        country.flag_image_url = [countryDictionary valueForKeyPath:@"flag_image_url"];
        country.cities = [countryDictionary valueForKeyPath:@"cities"];
        
        [self.countriesMutableArray addObject:country];
    }
}


#pragma mark - segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"ToCitiesVC"]) {
        
        NSIndexPath *selectedIndexPath = [self.countryTableView indexPathForSelectedRow];
        Country *selectedCountry = [self.countriesMutableArray objectAtIndex:selectedIndexPath.row];
        CitiesViewController *cvc = segue.destinationViewController;
        cvc.country = selectedCountry;
    }
}

@end
