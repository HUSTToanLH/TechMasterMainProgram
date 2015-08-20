//
//  Slider1.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/20/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "Slider1.h"

@interface Slider1 ()
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation Slider1
{
    UIImageView *title;
    CGFloat pixOnValue;
    UILabel *label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSlider];
    [self initTitle];
}

-(void)initSlider
{
    [_slider setThumbImage:[UIImage imageNamed:@"thb1"] forState:UIControlStateNormal];
    
    UIEdgeInsets inset= UIEdgeInsetsMake(0, 0, 10, 10);
    UIImage *maxTrack = [[UIImage imageNamed:@"maxTr1Sub"] resizableImageWithCapInsets:inset];
    [_slider setMaximumTrackImage:maxTrack forState:UIControlStateNormal];
    [_slider setMinimumTrackImage:[UIImage imageNamed:@"minTr1"] forState:UIControlStateNormal];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"bg1"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}

-(void)initTitle
{
    pixOnValue = (_slider.frame.size.width - 8)/100;
    title = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    title.image = [UIImage imageNamed:@"title1.png"];
    CGFloat newX = _slider.frame.origin.x + _slider.value*pixOnValue +6;
    CGFloat newY = _slider.frame.origin.y - title.frame.size.height/2 - 5;
    title.center = CGPointMake(newX, newY);
    [self.view addSubview:title];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 25)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blueColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"Helvetica" size:13];
    label.text = [NSString stringWithFormat:@"%d", (int)_slider.value];
    [title addSubview:label];
}

- (IBAction)changedSlider:(id)sender {
    NSLog(@"frame: %f", _slider.frame.size.width);
    NSLog(@"self: %f", self.view.frame.size.width/2);
    [self setTitleForSlider];
}

-(void)setTitleForSlider
{
    CGFloat newX = _slider.frame.origin.x + _slider.value*pixOnValue;
    CGFloat newY = title.center.y;
    title.center = CGPointMake(newX, newY);
    
    label.text = [NSString stringWithFormat:@"%d", (int)_slider.value];
}


@end
