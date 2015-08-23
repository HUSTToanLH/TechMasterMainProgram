//
//  SliderRangle.h
//  TechMasterMainProgram
//
//  Created by TaiND on 8/20/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderRangle : UIControl
@property(nonatomic, assign) float minimumValue;
@property(nonatomic, assign) float maximumValue;
@property(nonatomic, assign) float minimumRange;
@property(nonatomic, assign) float selectedMinimumValue;
@property(nonatomic, assign) float selectedMaximumValue;

@end
