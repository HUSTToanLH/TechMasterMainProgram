//
//  StartField.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/7/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "StartField.h"

@interface StartField ()

@end

@implementation StartField
{
    UIImageView *starBlack, *starWhite, *starBlue, *starYellow;
    CGPoint center;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initStar];
}

-(void)initStar
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
//    starBlack = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"starBlack.png"]];
//    starWhite = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"starWhite.png"]];
//    starBlue = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"starBlue.png"]];
//    starYellow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"starYellow.png"]];
//    starBlack = [[[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 60, 60)]];
    
    center = CGPointMake(self.view.frame.size.width*0.5, (self.view.frame.size.height-60)*0.5);
    [self setPossitionInit];
    
    [self.view addSubview:starBlack];
    [self.view addSubview:starWhite];
    [self.view addSubview:starBlue];
    [self.view addSubview:starYellow];
}

-(void)setPossitionInit
{
    starBlack.center = center;
    starWhite.center = center;
    starBlue.center = center;
    starYellow.center = center;
}
@end
