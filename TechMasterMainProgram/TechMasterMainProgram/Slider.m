//
//  Slider.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/15/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "Slider.h"

@interface Slider ()
{
    NSTimer *_timer;
}
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UILabel *value;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation Slider

- (void)viewDidLoad {
    [super viewDidLoad];
    [_slider setThumbImage:[UIImage imageNamed:@"thumb"] forState:UIControlStateNormal];
    [_slider setMinimumValueImage:[UIImage imageNamed:@"MuteSpeaker"]];
    [_slider setMaximumValueImage:[UIImage imageNamed:@"MaxSpeaker"]];
    
    UIEdgeInsets inset= UIEdgeInsetsMake(0, 0, 10, 10);
    UIImage *maxTrack = [[UIImage imageNamed:@"maxtrack"] resizableImageWithCapInsets:inset];
    [_slider setMaximumTrackImage:maxTrack forState:UIControlStateNormal];
    [_slider setMinimumTrackImage:[UIImage imageNamed:@"mintrack"] forState:UIControlStateNormal];
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"background"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    NSLog(@"x:%f, y:%f, h:%f, w:%f", _slider.frame.origin.x, _slider.frame.origin.y, _slider.frame.size.height, _slider.frame.size.width);
    
//    NSLog(@"bound: %f",_slider.bounds.origin)
    [self changeSlider:self];
    
    NSLog(@"x:%f, y:%f, h:%f, w:%f", _value.frame.origin.x, _value.frame.origin.y, _value.frame.size.height, _value.frame.size.width);
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeSliderValue) userInfo:nil repeats:true];
}

- (void)changeSliderValue{
    _slider.value += 0.01;
    [self changeSlider:self];
}

- (IBAction)changeSlider:(id)sender {
    _value.text = [NSString stringWithFormat:@"%.0f",_slider.value*100];
    CGRect frame = _slider.frame;
    frame.origin.x= frame.origin.x + 25 + (int)(_slider.value*(_slider.frame.size.width-80));
    frame.origin.y = frame.origin.y - 30;
    frame.size.height = 20;
    frame.size.width = 48;
    _value.frame = frame;
    frame.origin.y = frame.origin.y - 10;
    frame.size.height = 48;
    frame.size.width = 48;
    _imgView.frame = frame;
//    if(_slider.value == 1){
//        NSLog(@"x:%f, y:%f, h:%f, w:%f", _value.frame.origin.x, _value.frame.origin.y, _value.frame.size.height, _value.frame.size.width);
//    }
}
@end
