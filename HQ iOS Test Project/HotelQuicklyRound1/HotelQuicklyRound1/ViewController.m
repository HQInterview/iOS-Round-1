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
    return 50;
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
