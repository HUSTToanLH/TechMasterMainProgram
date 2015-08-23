//
//  SliderBasic.h
//  TechMasterMainProgram
//
//  Created by ToanLH on 8/23/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderBasic : UIControl
@property(nonatomic, assign) float minimumValue;
@property(nonatomic, assign) float maximumValue;
@property(nonatomic, assign) float selectedValue;
@property(nonatomic, assign) float contentValue;
@property(nonatomic, assign) CGFloat contentWidth;
@property(nonatomic, strong) IBOutlet UIImage *trackFore;
@property(nonatomic, strong) IBOutlet UIImage *trackBack;
@property(nonatomic, strong) IBOutlet UIImage *thumbImg;

@property(nonatomic, assign) float currentSecond;
-(void)start;
-(void)stop;
@end
