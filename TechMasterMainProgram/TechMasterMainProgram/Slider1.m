//
//  Slider1.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 8/23/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "Slider1.h"
#import "UIColor+Extend.h"
#import "SliderBasic.h"

@interface Slider1 ()

@end

@implementation Slider1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initColorHex:@"#00FFFF" alpha:1];
    [self initViewContainer];
}

-(void)initViewContainer
{
    UIView *viewContainer = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2-40, self.view.frame.size.width, 40)];
    [self.view addSubview:viewContainer];
    
    SliderBasic *slider =  [SliderBasic alloc];
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.selectedValue = 30;
    
    slider = [slider initWithFrame:viewContainer.bounds];
    [viewContainer addSubview:slider];
}

@end
