//
//  SwitchResuse.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 8/24/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "SwitchResuse.h"
#import "CustomSwitch.h"
#import "UIColor+Extend.h"

@interface SwitchResuse ()

@end

@implementation SwitchResuse
{
    CustomSwitch *mySwitch;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initColorHex:@"fde8f0" alpha:1];
    [self initSwitch];
}

-(void)initSwitch
{
    mySwitch = [CustomSwitch alloc];
    mySwitch.leftOff = [UIImage imageNamed:@"leftOff.png"];
    mySwitch.leftOn = [UIImage imageNamed:@"leftOn.png"];
    mySwitch.rightOff = [UIImage imageNamed:@"rightOff.png"];
    mySwitch.rightOn = [UIImage imageNamed:@"rightOn.png"];
    
    mySwitch = [mySwitch initWithFrame:self.view.frame];
    [mySwitch addTarget:self action:@selector(valueChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:mySwitch];
}

-(void)valueChange
{
    NSLog(@"value: %d", mySwitch.value);
}

@end
