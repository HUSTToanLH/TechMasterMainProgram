//
//  CustomSwitch.h
//  TechMasterMainProgram
//
//  Created by ToanLH on 8/24/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSwitch : UIControl
@property(nonatomic, assign) BOOL value;
@property(nonatomic, strong) IBOutlet UIImage *leftOn;
@property(nonatomic, strong) IBOutlet UIImage *leftOff;
@property(nonatomic, strong) IBOutlet UIImage *rightOn;
@property(nonatomic, strong) IBOutlet UIImage *rightOff;
@end
