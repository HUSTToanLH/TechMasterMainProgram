//
//  TapPanPinch.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 9/9/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "TapPanPinch.h"

@interface TapPanPinch ()

@end

@implementation TapPanPinch
{
    UIImageView *ball;
    NSTimer* _timer;
    CGFloat _velocity;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    [self initBall];
}

-(void)initBall
{
    UIImage *ballImg = [UIImage imageNamed:@"americanfootball.png"];
    ball = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.bounds.size.width*(ballImg.size.height/ballImg.size.width))];
    ball.image = ballImg;
    ball.userInteractionEnabled = YES;
    ball.multipleTouchEnabled = YES;
    [self.view addSubview:ball];
    
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                                                       action:@selector(rotateBall:)];
    [ball addGestureRecognizer:rotate];
    _velocity = 0.0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                              target:self
                                            selector:@selector(loop)
                                            userInfo:nil
                                             repeats:true];
}

-(void)rotateBall:(UIRotationGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan || gestureRecognizer.state == UIGestureRecognizerStateChanged) {
//        CGFloat pan = gestureRecognizer.velocity;
        _velocity = _velocity + gestureRecognizer.rotation;
    }
}

-(void)rotate
{
    CATransform3D t = ball.layer.transform;
    t.m34 = -0.005;
    t = CATransform3DRotate(t, _velocity, 0.0, 0.0, 1.0);
    ball.layer.transform = t;
    _velocity = _velocity*0.9;
}

-(void)loop
{
    [self rotate];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

@end
