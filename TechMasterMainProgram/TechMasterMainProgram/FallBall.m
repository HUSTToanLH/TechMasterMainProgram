//
//  FallBall.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/6/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "FallBall.h"

@interface FallBall ()

@end

@implementation FallBall
{
    UIImageView *_fallBall;
    int _reverse;
    float _top;
    BOOL _stop;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _top = 100.0;
    _reverse = 1;
    _stop = NO;
    _fallBall = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, 60.0, 60.0)];
    _fallBall.center = CGPointMake(207.0, 100.0);
    _fallBall.image = [UIImage imageNamed:@"football.png"];
    [self.view addSubview:_fallBall];
    [self performSelector:@selector(fallingBall:) withObject:@0.00001 afterDelay:2];
}

-(void)fallingBall:(float)time
{
    if(_stop == NO){
        [UIView animateWithDuration:time animations:^{
            [self setPositionBall];
        } completion:^(BOOL finished) {
            [self fallingBall:time];
        }];
    }
}

-(void)setPositionBall
{
    if (_top >= 626.0) {
        _stop = YES;
    }
    else{
        if (_fallBall.center.y >= 657.0){
            _reverse = -1;
        }
        if (_fallBall.center.y <= _top){
            _reverse = 1;
            
        }
        
        if(_reverse == 1){
            _fallBall.center = CGPointMake(_fallBall.center.x, _fallBall.center.y + (10*M_PI/6.0));
        }
        else{
            _fallBall.center = CGPointMake(_fallBall.center.x, _fallBall.center.y - (10*M_PI/6.0));
            if (_fallBall.center.y >= _top) {
                _top = _top + 50.0;
            }
        }
    }

}

@end
