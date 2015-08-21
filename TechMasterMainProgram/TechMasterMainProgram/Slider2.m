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
    [self initBackground];
    [self initSubBackground];
}

-(void)initBackground
{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"buttonBackground"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}

-(void)initSubBackground
{
    UIImageView *subBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"buttonBack2.png"]];
//    subBackground.frame = CGRectMake(0, 0, subBackground.frame.size.width, subBackground.frame.size.height);
    subBackground.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [self.view addSubview:subBackground];
}

@end
