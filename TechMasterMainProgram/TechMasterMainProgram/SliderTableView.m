//
//  SliderTableView.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/20/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "SliderTableView.h"
#import "UIColor+Extend.h"

@interface SliderTableView ()

@end

@implementation SliderTableView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initColorHex:@"#F6CED8" alpha:1];
    [self initViewContainer];
}

-(void)initViewContainer
{
    UIView *viewContainer = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2-40, self.view.frame.size.width, 40)];
    [self.view addSubview:viewContainer];
    
    SliderRangle *slider =  [SliderRangle alloc];
    slider.minimumValue = 0;
    slider.selectedMinimumValue = 20;
    slider.maximumValue = 100;
    slider.selectedMinimumValue = 80;
    slider.minimumRange = 20;
    
    slider = [slider initWithFrame:viewContainer.bounds];
    [viewContainer addSubview:slider];
    
//    NSLog(@"container x: %f,container y: %f", viewContainer.frame.origin.x, viewContainer.frame.origin.y);
//    NSLog(@"container w: %f,container h: %f", viewContainer.frame.size.width, viewContainer.frame.size.height);
}

@end
