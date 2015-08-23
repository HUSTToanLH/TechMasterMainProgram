//
//  SliderBasic.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 8/23/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "SliderBasic.h"

@interface SliderBasic (PrivateMethods)
-(float)xForValue:(float)value;
@end

@implementation SliderBasic
{
    float _padding;
    
    UIImageView * _thumb;
    UIImageView * _track;
    UIImageView * _trackBackground;
    
    CGFloat pixOnValue;
    UILabel *_label;
    UIImageView *_title;
    
    CGRect originFrame;
    NSTimer *timer;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (_contentValue > 0) {
        _currentSecond = 0;
    }
    originFrame = frame;
    if(self){
        // Set the initial state
        _padding = 20;
        
        //set background track
        if (_trackBack == nil) {
            _trackBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar-background.png"]];
        }
        else{
            _trackBackground = [[UIImageView alloc] initWithImage:_trackBack];
        }
        _trackBackground.frame = CGRectMake(_padding, (frame.size.height - _trackBackground.frame.size.height) / 2, frame.size.width - 2*_padding, _trackBackground.frame.size.height);
        [self addSubview:_trackBackground];
        
        //set thumb
        if (_thumbImg == nil) {
            _thumb = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"handle.png"] highlightedImage:[UIImage imageNamed:@"handle-hover.png"]];
        }
        else{
            _thumb = [[UIImageView alloc] initWithImage:_thumbImg];
        }
        _thumb.center = CGPointMake([self xForValue:_selectedValue],  self.frame.size.height / 2);
        
        //set hightlight track
        if (_trackFore == nil) {
            _track = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar-highlight.png"]];
        }
        else{
            _track = [[UIImageView alloc] initWithImage:_trackFore];
        }
        _track.frame = CGRectMake(_padding, (frame.size.height - _track.frame.size.height) / 2, _thumb.center.x - _padding, _track.frame.size.height);
        [self addSubview:_track];
        
        [self addSubview:_thumb];
        [self initTitle];
    }
    return self;
}

-(void)setTrack
{
    CGRect frame = _track.frame;
    frame.size.width = _thumb.center.x - _padding;
    _track.frame = frame;
    [self setNeedsDisplay];
}

-(void)initTitle
{
    pixOnValue = (originFrame.size.width - 2*_padding)/(_maximumValue - _minimumValue);
    
    if (_contentWidth > 0) {
        _title = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _contentWidth, 30)];
    }
    else{
        _title = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    }
    _title.image = [UIImage imageNamed:@"title1.png"];
    CGFloat minX = _thumb.center.x;
    CGFloat minY = _thumb.center.y - _thumb.frame.size.height/2 - _title.frame.size.height/2;
    _title.center = CGPointMake(minX, minY);
    [self addSubview:_title];
    
    if (_contentWidth > 0) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _contentWidth, 25)];
    }
    else{
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 40, 25)];
    }
    _label.textAlignment = NSTextAlignmentCenter;
    _label.textColor = [UIColor blueColor];
    _label.backgroundColor = [UIColor clearColor];
    _label.font = [UIFont fontWithName:@"Helvetica" size:13];
    _label.text = [self valueForX:minX];
    [_title addSubview:_label];
}

-(void)setTitle
{
    CGPoint minCenter = _title.center;
    minCenter.x = _thumb.center.x;
    _title.center = minCenter;
    _label.text = [self valueForX:minCenter.x];
    [self setNeedsDisplay];
}

-(float)xForValue:(float)value{
    return _trackBackground.frame.origin.x+_trackBackground.frame.size.width*(value - _minimumValue)/(_maximumValue - _minimumValue);
}

-(NSString *)valueForX:(CGFloat)x{
    float result = _minimumValue + (x - _trackBackground.frame.origin.x)*(_maximumValue - _minimumValue)/_trackBackground.frame.size.width;
    if (_contentValue > 0) {
        int minute = (int)_currentSecond/60;
        int second = (int)(_currentSecond - minute*60);
        if (second < 10) {
            return [NSString stringWithFormat:@"%d:0%d",minute, second];
        }
        else{
            return [NSString stringWithFormat:@"%d:%d",minute, second];
        }
    }
    return [NSString stringWithFormat:@"%d", (int)result];
}

-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    
    [super continueTrackingWithTouch:touch withEvent:event];

    [self changeSlider:touch];
    
    return YES;
}

-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [super endTrackingWithTouch:touch withEvent:event];
    [self changeSlider:touch];
}

-(void)changeSlider:(UITouch *)touch
{
    CGFloat newX;
    CGPoint touchPoint = [touch locationInView:self];
    
    if (touchPoint.x > [self xForValue:_maximumValue]) {
        newX = [self xForValue:_maximumValue];
    }
    else if (touchPoint.x < [self xForValue:_minimumValue]) {
        newX = [self xForValue:_minimumValue];
    }
    else{
        newX = touchPoint.x;
    }
    if (_contentValue > 0) {
        _currentSecond = (int)(_contentValue*(newX - _padding)/([self xForValue:_maximumValue] - [self xForValue:_minimumValue]));
    }
    _thumb.center = CGPointMake(newX, _thumb.center.y);
    [self setTrack];
    [self setTitle];
    [self setNeedsDisplay];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

-(void)start
{
    if (!timer) {
        timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                 target:self
                                               selector:@selector(runningSlider)
                                               userInfo:nil
                                                repeats:true];
    }
}

-(void)stop{
    if ([timer isValid]) {
        [timer invalidate];
    }
    timer = nil;
}

-(void)runningSlider
{
    
    if (_currentSecond < _contentValue) {
        _currentSecond++;
        CGFloat newX = [self xForValue:(_maximumValue - _minimumValue)*_currentSecond/_contentValue];
        _thumb.center = CGPointMake(newX, _thumb.center.y);
        [self setTrack];
        [self setTitle];
        [self setNeedsDisplay];
    }
    else{
        [self stop];
    }
}

@end
