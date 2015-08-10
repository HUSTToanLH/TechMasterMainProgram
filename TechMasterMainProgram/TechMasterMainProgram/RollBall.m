//
//  RollBall.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/6/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "RollBall.h"

@interface RollBall ()
@end

@implementation RollBall
{
    UIImageView *_rollBall;
    CGFloat maxWidth;
    int _reverse;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _reverse = 1;
    _rollBall = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 60.0, 60.0)];
    _rollBall.center = CGPointMake(30.0, 356.0);
    _rollBall.image = [UIImage imageNamed:@"football.png"];
    [self.view addSubview:_rollBall];
    NSLog(@"x: %f, y: %f", _rollBall.center.x, _rollBall.center.y);
    
    maxWidth = self.view.frame.size.width-30.0;
    [self performSelector:@selector(rollingBall) withObject:nil afterDelay:2];
//    [self rollingBall];
}

-(void)rollingBall
{
    [UIView animateWithDuration:0.00001 animations:^{
        [self setPositionBall];
    } completion:^(BOOL finished) {
        [self rollingBall];
    }];
}

-(void)setPositionBall
{
    if (_rollBall.center.x >= maxWidth){
        _reverse = -1;
    }
    if (_rollBall.center.x <= 30.0){
        _reverse = 1;
    }
    
    if(_reverse == 1){
        _rollBall.center = CGPointMake(_rollBall.center.x+(5*M_PI/6.0), _rollBall.center.y);
        
    }
    else{
        _rollBall.center = CGPointMake(_rollBall.center.x-(5*M_PI/6.0), _rollBall.center.y);
    }

    
    CATransform3D rotatedTransform = _rollBall.layer.transform;
    rotatedTransform.m34 = -0.005;
    rotatedTransform = CATransform3DRotate(rotatedTransform, _reverse*5*M_PI/180.0, 0.0f, 0.0f, 1.0f);
    _rollBall.layer.transform = rotatedTransform;
}

@end
