//
//  CircularSlider.h
//  TechMasterMainProgram
//
//  Created by ToanLH on 8/23/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircularSlider : UIControl

@property (nonatomic) int angle;

#pragma mark - Values
@property (nonatomic) float minimumValue;
@property (nonatomic) float maximumValue;

#pragma mark - Visual Customisation
@property (nonatomic) int lineWidth;
@property (nonatomic, strong) UIColor* filledColor;
@property (nonatomic, strong) UIColor* unfilledColor;

@end
