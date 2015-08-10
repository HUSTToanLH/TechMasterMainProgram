//
//  DropBall.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/6/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "DropBall.h"

@interface DropBall ()

@end

@implementation DropBall
{
    UIImageView *ball;
    NSTimer *timer;
    CGFloat maxHeight;
    CGFloat ballRadius;
    CGFloat x,y,vanToc, giaToc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    ballRadius = 30.0;
    
    CGFloat naviHeight = [UIApplication sharedApplication].statusBarFrame.size.height+self.navigationController.navigationBar.bounds.size.height;
    maxHeight = self.view.frame.size.height - ballRadius - naviHeight;
    
    x = self.view.frame.size.width*0.5;
    y = ballRadius;
    
    vanToc = 0.0;
    giaToc = 4.0;
    
    [self initBall];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil
                                            repeats:true];
    
}

- (void) initBall
{
    ball = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 60.0, 60.0)];
    ball.center = CGPointMake(x, y);
    ball.image = [UIImage imageNamed:@"football.png"];
    [self.view addSubview:ball];
}

- (void) dropBall
{
    vanToc += giaToc;
    y += vanToc;
    if (y > maxHeight) {
        vanToc = -vanToc*0.88;
        y = maxHeight;
    }
    
    ball.center = CGPointMake(x,y);
}

@end
