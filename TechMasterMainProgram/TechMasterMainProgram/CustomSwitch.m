//
//  CustomSwitch.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 8/24/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "CustomSwitch.h"

@implementation CustomSwitch
{
    UIButton *leftButton, *rightButton;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    CGFloat height = self.frame.size.height;
    CGFloat oX = self.center.x;

    
    if (self) {
        if (_leftOn == nil) {
            _leftOn = [UIImage imageNamed:@"leftButtonOn.png"];
        }
        if (_leftOff == nil) {
            _leftOff = [UIImage imageNamed:@"leftButtonOff.png"];
        }
        if (_rightOn == nil) {
            _rightOn = [UIImage imageNamed:@"rightButtonOn.png"];
        }
        if (_rightOff == nil) {
            _rightOff = [UIImage imageNamed:@"rightButtonOff.png"];
        }
        
        leftButton = [[UIButton alloc] initWithFrame:CGRectMake(oX - _leftOff.size.width, height/2, _leftOff.size.width, _leftOff.size.height)];
        [leftButton setImage:_leftOff forState:UIControlStateNormal];
        [leftButton addTarget:self action:@selector(pressLeftButton) forControlEvents:UIControlEventTouchUpInside];
        
        rightButton = [[UIButton alloc] initWithFrame:CGRectMake(oX, height/2, _rightOn.size.width, _rightOn.size.height)];
        [rightButton setImage:_rightOn forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(pressRightButton) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:leftButton];
        [self addSubview:rightButton];
        _value = NO;
    }
    return self;
}

-(void)pressLeftButton
{
    if (_value == NO) {
        _value = YES;
        [leftButton setImage:_leftOn forState:UIControlStateNormal];
        [rightButton setImage:_rightOff forState:UIControlStateNormal];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

-(void)pressRightButton
{
    if (_value == YES) {
        _value = NO;
        [leftButton setImage:_leftOff forState:UIControlStateNormal];
        [rightButton setImage:_rightOn forState:UIControlStateNormal];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}

@end
