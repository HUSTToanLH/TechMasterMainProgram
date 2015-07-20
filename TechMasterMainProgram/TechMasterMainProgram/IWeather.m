//
//  IWeather.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/16/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "IWeather.h"

@interface IWeather ()
@property (strong, nonatomic) IBOutlet UILabel *location;
@property (strong, nonatomic) IBOutlet UILabel *tempType;
@property (strong, nonatomic) IBOutlet UIButton *temperature;
@property (strong, nonatomic) IBOutlet UIImageView *weather;
@property (strong, nonatomic) IBOutlet UILabel *quote;
@property (strong, nonatomic) IBOutlet UIView *mainView;

@end

@implementation IWeather
{
    NSArray *quotes;
    NSArray *locations;
    NSArray *photos;
    BOOL _isCelcius;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do hạnh phúc", @"Đi một ngày đàng học một sàng khôn"];
    
    locations = @[@"Hai Ba Trung, Hanoi", @"Sydney, Australia", @"New York, USA"];
    
    photos = @[@"rain", @"sunny", @"thunder", @"cloud", @"partCloud", @"parCloudNight", @"snowing", @"night"];
    _isCelcius = true;
}

- (IBAction)convertTemperature:(id)sender {
    float temp = [_temperature.currentTitle floatValue];
    UIColor *color = [self getColorTemp:temp];
    
    if(_isCelcius){
        temp = temp*1.8+32.0;
        _tempType.text = @"F";
        _isCelcius = false;
    }
    else{
        temp = (temp - 32.0)/1.8;
        _tempType.text = @"C";
        _isCelcius = true;
    }
    [_temperature setTitle:[NSString stringWithFormat:@"%.1f",temp] forState:UIControlStateNormal];
    [_temperature setTitleColor:color forState:UIControlStateNormal];
}

- (IBAction)reload:(id)sender {
    float temp = [self getTemperature];
    [_temperature setTitle:[NSString stringWithFormat:@"%.1f",temp] forState:UIControlStateNormal];
    UIColor *color = [self getColorTemp:temp];
    [_temperature setTitleColor:color forState:UIControlStateNormal];
    
    int idxQuote = arc4random_uniform((int)quotes.count);
    _quote.text = quotes[idxQuote];
    _quote.textColor = [self getColor];
    
    int idxLocation= arc4random_uniform((int)locations.count);
    _location.text = locations[idxLocation];
    
    int idxPhoto= arc4random_uniform((int)photos.count);
    NSString *weather = photos[idxPhoto];
    _weather.image = [UIImage imageNamed:weather];
}

- (float)getTemperature{
    return 14.0 + arc4random_uniform(18) + (float)arc4random()/(float)INT32_MAX;
}

- (UIColor *)getColor{
    CGFloat aRedValue = arc4random()%255/255.0;
    CGFloat aGreenValue = arc4random()%255/255.0;
    CGFloat aBlueValue = arc4random()%255/255.0;
    
    UIColor *randColor = [UIColor colorWithRed:aRedValue green:aGreenValue blue:aBlueValue alpha:1.0f];
    return randColor;
}

- (UIColor *)getColorTemp:(float)temp
{
    if(!_isCelcius)
        temp = (temp - 32.0)/1.8;
    UIColor *color;
    if(temp > 34)
        color = [UIColor redColor];
    else if (temp > 20)
        color = [UIColor blueColor];
    else
        color= [UIColor lightGrayColor];
    return color;
}

@end
