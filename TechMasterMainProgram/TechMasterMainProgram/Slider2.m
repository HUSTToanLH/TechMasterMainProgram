//
//  Slider2.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/20/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "Slider2.h"

@interface Slider2 ()

@end

@implementation Slider2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initSubBackground];
    [self initThumb];
    [self initBackground];
}

-(void)initBackground
{
    UIImageView *subBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"circularSliderBound.png"]];
    subBackground.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:subBackground];
}

-(void)initSubBackground
{
    UIImageView *subBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"circularSliderTrackFull.png"]];
    subBackground.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:subBackground];
}

-(void)initThumb
{

}

@end
