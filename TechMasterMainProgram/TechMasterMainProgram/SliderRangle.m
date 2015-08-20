//
//  SliderRangle.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/20/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "SliderRangle.h"

@implementation SliderRangle
{
    BOOL _maxThumbOn;
    BOOL _minThumbOn;
    
    float _padding;
    
    UIImageView * _minThumb;
    UIImageView * _maxThumb;
    UIImageView * _track;
    UIImageView * _trackBackground;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self){
        // Set the initial state
        _minThumbOn = false;
        _maxThumbOn = false;
        _padding = 20; // 20 is a good value
        
        _trackBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar-background.png"]];
        _trackBackground.frame = CGRectMake((frame.size.width - _trackBackground.frame.size.width) / 2, (frame.size.height - _trackBackground.frame.size.height) / 2, _trackBackground.frame.size.width, _trackBackground.frame.size.height);
        [self addSubview:_trackBackground];
        
        _track = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar-highlight.png"]];
        _track.frame = CGRectMake((frame.size.width - _track.frame.size.width) / 2, (frame.size.height - _track.frame.size.height) / 2, _track.frame.size.width, _track.frame.size.height);
        [self addSubview:_track];
    }
    return self;
}

@end
