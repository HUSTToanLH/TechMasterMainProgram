//
//  CircularSliderView.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 8/23/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "CircularSliderView.h"
#import "CircularSlider.h"
#import "UIColor+Extend.h"
#import "SliderBasic.h"
#import <AVFoundation/AVFoundation.h>

@interface CircularSliderView ()

@end

@implementation CircularSliderView
{
    CircularSlider *circularSlider;
    SliderBasic *basicSlider;
    UIImageView *subBackground, *background;
    UIButton *button;
    UIImage *bStart, *bPause;
    BOOL isStart;
    AVAudioPlayer *music;
    float _volume;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initColorHex:@"" alpha:1];
    _volume = 100.0/3.0;
    [self initBackground];
    
    CGRect minuteSliderFrame = CGRectMake(5, 170, subBackground.frame.size.width, subBackground.frame.size.height);
    circularSlider = [[CircularSlider alloc] initWithFrame:minuteSliderFrame];
    circularSlider.center = CGPointMake(self.view.center.x, self.view.center.y);
    circularSlider.unfilledColor = [UIColor colorWithRed:23/255.0f green:47/255.0f blue:70/255.0f alpha:1.0f];
    circularSlider.filledColor = [UIColor colorWithRed:155/255.0f green:211/255.0f blue:156/255.0f alpha:1.0f];
    circularSlider.lineWidth = 15;
    circularSlider.minimumValue = 0;
    circularSlider.maximumValue = 60;
    [self.view addSubview:circularSlider];
    [circularSlider addTarget:self action:@selector(didChangeSlider) forControlEvents:UIControlEventValueChanged];
    
    [self initButton];
    
    [self initMusic];
    [self initBasicSlider];
    [self playMusic];
    
}

-(void)initBasicSlider
{
    basicSlider = [SliderBasic alloc];
    basicSlider.minimumValue = 0;
    basicSlider.maximumValue = 100;
    basicSlider.selectedValue = 0;
    basicSlider.trackBack = [UIImage imageNamed:@"trackWhite.png"];
    basicSlider.trackFore = [UIImage imageNamed:@"trackBlack.png"];
    basicSlider.thumbImg = [UIImage imageNamed:@"thumbSilver10.png"];
    basicSlider.contentValue = music.duration;
    basicSlider.contentWidth = 40;
    
    basicSlider = [basicSlider initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - 2*20, 5)];
    basicSlider.center = CGPointMake(self.view.center.x, self.view.frame.size.height - 100);
    [self.view addSubview:basicSlider];
    [basicSlider addTarget:self action:@selector(didChangeBasicSlider) forControlEvents:UIControlEventValueChanged];
    [basicSlider start];
}

-(void)initMusic
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"Korean" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    music = [[AVAudioPlayer alloc] initWithContentsOfURL:url
                                                   error:&error];
    [music prepareToPlay];
}

-(void)playMusic
{
    [music setVolume:_volume];
    [music play];
}

-(void)initBackground
{
    background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"buttonBackground.png"]];
    background.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:background];
    
    subBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"buttonFull.png"]];
    subBackground.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [background addSubview:subBackground];
}

-(void)initButton
{
    bStart = [UIImage imageNamed:@"buttonStart.png"];
    bPause = [UIImage imageNamed:@"buttonPause.png"];
    button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, bStart.size.width, bStart.size.height)];
    [button setImage:bPause forState:UIControlStateNormal];
    button.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:button];
    isStart = YES;
    [button addTarget:self action:@selector(onClickButton) forControlEvents:UIControlEventTouchUpInside];
}

-(void)didChangeSlider
{
    if (isStart == NO) {
        isStart = YES;
        [button setImage:bStart forState:UIControlStateNormal];
    }
    [self setVolume];
    NSLog(@"volume: %f", _volume);
    [self playMusic];
}

-(void)setVolume
{
    if(circularSlider.angle >= 180){
        _volume = (2*100/3)*(circularSlider.angle-180)/180.0;
    }
    else{
        _volume = (2.0*100.0/3.0)+(float)(100.0/3.0)*((float)circularSlider.angle/90.0);
    }
}

-(void)didChangeBasicSlider
{
    [music stop];
    music.currentTime = basicSlider.currentSecond;
    [music play];
    [basicSlider start];
}

-(void)onClickButton
{
    if (isStart == YES) {
        [music pause];
        [basicSlider stop];
        isStart = NO;
        [button setImage:bStart forState:UIControlStateNormal];
    }
    else{
        [music play];
        [basicSlider start];
        isStart = YES;
        [button setImage:bPause forState:UIControlStateNormal];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [music stop];
    basicSlider.minimumValue = 0;
    basicSlider.maximumValue = 100;
    basicSlider.selectedValue = 0;
    basicSlider.trackBack = nil;
    basicSlider.trackFore = nil;
    basicSlider.thumbImg = nil;
    basicSlider.contentValue = 0;
    basicSlider.contentWidth = 0;
}

@end
