//
//  SwitchView.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 8/24/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "SwitchView.h"
#import "CustomSwitch.h"
#import "UIColor+Extend.h"

@interface SwitchView ()

@end

@implementation SwitchView
{
    CustomSwitch *mySwitch;
    UIImageView *light;
    UIImage *lightOn, *lightOff;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initColorHex:@"" alpha:1];
    [self initSwitchAndLight];
}

-(void)initSwitchAndLight
{
    lightOn = [UIImage imageNamed:@"lightOn.png"];
    lightOff = [UIImage imageNamed:@"lightOff.png"];
    light = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x - lightOff.size.width/2, 100, lightOff.size.width, lightOff.size.height)];
    light.image = lightOff;
    [self.view addSubview:light];
    
    mySwitch = [[CustomSwitch alloc] initWithFrame:CGRectMake(0, self.view.frame.origin.y + lightOff.size.height, self.view.frame.size.width, (self.view.frame.size.height - self.view.frame.origin.y - lightOff.size.height)/2)];
    [mySwitch addTarget:self action:@selector(switchValueChange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:mySwitch];

}

-(void)switchValueChange
{
    if (mySwitch.value == NO) {
        light.image = lightOff;
    }
    else if (mySwitch.value == YES){
        light.image = lightOn;
    }
}

@end
