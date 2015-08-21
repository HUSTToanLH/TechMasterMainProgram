//
//  SliderRangle.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/20/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "SliderRangle.h"

@interface SliderRangle (PrivateMethods)
-(float)xForValue:(float)value;
@end

@implementation SliderRangle
{
    BOOL _maxThumbOn;
    BOOL _minThumbOn;
    
    float _padding;
    
    UIImageView * _minThumb;
    UIImageView * _maxThumb;
    UIImageView * _track;
    UIImageView * _trackBackground;
    
    CGFloat pixOnValue;
    UILabel *minLabel, *maxLabel;
    UIImageView *minTitle, *maxTitle;
    
    CGRect originFrame;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    originFrame = frame;
    if(self){
        // Set the initial state
        _minThumbOn = false;
        _maxThumbOn = false;
        _padding = 20; // 20 is a good value
        
        //set background track
        _trackBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar-background.png"]];
        _trackBackground.frame = CGRectMake(_padding, (frame.size.height - _trackBackground.frame.size.height) / 2, frame.size.width - 2*_padding, _trackBackground.frame.size.height);
        [self addSubview:_trackBackground];
        
        //set thumb
        _minThumb = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"handle.png"] highlightedImage:[UIImage imageNamed:@"handle-hover.png"]];
        _minThumb.center = CGPointMake([self xForValue:_selectedMaximumValue],  self.frame.size.height / 2);
        
        _maxThumb = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"handle.png"] highlightedImage:[UIImage imageNamed:@"handle-hover.png"]];
        _maxThumb.center = CGPointMake([self xForValue:_selectedMinimumValue],  self.frame.size.height / 2);
        
        //set hightlight track
        _track = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar-highlight.png"]];
        _track.frame = CGRectMake(_minThumb.center.x, (frame.size.height - _track.frame.size.height) / 2, _maxThumb.center.x - _minThumb.center.x, _track.frame.size.height);
        [self addSubview:_track];
        
        [self addSubview:_minThumb];
        [self addSubview:_maxThumb];
        
        [self initTitle];
    }
    return self;
}

-(void)setTrack
{
    CGRect frame = _track.frame;
    frame.origin.x = _minThumb.center.x;
    frame.size.width = _maxThumb.center.x - _minThumb.center.x;
    _track.frame = frame;
}

-(void)initTitle
{
    pixOnValue = (originFrame.size.width - 2*_padding)/(_maximumValue - _minimumValue);
    
    minTitle = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _minThumb.frame.size.width, 30)];
    minTitle.image = [UIImage imageNamed:@"title1.png"];
    CGFloat minX = _minThumb.center.x;
    CGFloat minY = _minThumb.center.y - _minThumb.frame.size.height/2 - minTitle.frame.size.height/2;
    minTitle.center = CGPointMake(minX, minY);
    [self addSubview:minTitle];
    
    maxTitle = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _maxThumb.frame.size.width, 30)];
    maxTitle.image = [UIImage imageNamed:@"title1.png"];
    CGFloat maxX = _maxThumb.center.x;
    CGFloat maxY = _maxThumb.center.y - _maxThumb.frame.size.height/2 - maxTitle.frame.size.height/2;
    maxTitle.center = CGPointMake(maxX, maxY);
    [self addSubview:maxTitle];
    
    minLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _minThumb.frame.size.width, 25)];
    minLabel.textAlignment = NSTextAlignmentCenter;
    minLabel.textColor = [UIColor blueColor];
    minLabel.backgroundColor = [UIColor clearColor];
    minLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    minLabel.text = [NSString stringWithFormat:@"%d", (int)[self valueForX:minX]];
    [minTitle addSubview:minLabel];
    
    maxLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _maxThumb.frame.size.width, 25)];
    maxLabel.textAlignment = NSTextAlignmentCenter;
    maxLabel.textColor = [UIColor blueColor];
    maxLabel.backgroundColor = [UIColor clearColor];
    maxLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    maxLabel.text = [NSString stringWithFormat:@"%d", (int)[self valueForX:maxX]];
    [maxTitle addSubview:maxLabel];
}

-(void)setTitle
{
    CGPoint minCenter = minTitle.center;
    minCenter.x = _minThumb.center.x;
    minTitle.center = minCenter;
    minLabel.text = [NSString stringWithFormat:@"%d", (int)[self valueForX:minCenter.x]];
    
    CGPoint maxCenter = maxTitle.center;
    maxCenter.x = _maxThumb.center.x;
    maxTitle.center = maxCenter;
    maxLabel.text = [NSString stringWithFormat:@"%d", (int)[self valueForX:maxCenter.x]];
}

-(float)xForValue:(float)value{
    return _trackBackground.frame.origin.x+_trackBackground.frame.size.width*(value - _minimumValue)/(_maximumValue - _minimumValue);
}

-(float)valueForX:(CGFloat)x{
    return _minimumValue + (x - _trackBackground.frame.origin.x)*(_maximumValue - _minimumValue)/_trackBackground.frame.size.width;
}

-(BOOL) beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchPoint = [touch locationInView:self];
    if(CGRectContainsPoint(_minThumb.frame, touchPoint)){
        _minThumbOn = true;
    }else if(CGRectContainsPoint(_maxThumb.frame, touchPoint)){
        _maxThumbOn = true;
    }
    return YES;
}

-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    _minThumbOn = false;
    _maxThumbOn = false;
}

-(BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    if(!_minThumbOn && !_maxThumbOn){
        return YES;
    }
    
    CGFloat newX;
    CGPoint touchPoint = [touch locationInView:self];
    if(_minThumbOn){
        if (touchPoint.x > _minThumb.center.x) {
            if (touchPoint.x > _maxThumb.center.x - _minimumRange) {
                newX = _maxThumb.center.x - _minimumRange;
            }
            else
            {
                newX = touchPoint.x;
            }
        }
        else{
            if (touchPoint.x < [self xForValue:_minimumValue]) {
                newX = [self xForValue:_minimumValue];
            }
            else
            {
                newX = touchPoint.x;
            }
        }
        _minThumb.center = CGPointMake(newX, _minThumb.center.y);
    }
    if(_maxThumbOn){
        if (touchPoint.x > _maxThumb.center.x) {
            if (touchPoint.x > [self xForValue:_maximumValue]) {
                newX = [self xForValue:_maximumValue];
            }
            else
            {
                newX = touchPoint.x;
            }
        }
        else{
            if (touchPoint.x < _minThumb.center.x + _minimumRange) {
                newX = _minThumb.center.x + _minimumRange;
            }
            else
            {
                newX = touchPoint.x;
            }
        }
        _maxThumb.center = CGPointMake(newX, _maxThumb.center.y);
    }
    [self setTrack];
    [self setTitle];
    [self setNeedsDisplay];
    
    return YES;
}

@end
