//
//  DemoPlanet.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/3/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "DemoPlanet.h"

@interface DemoPlanet ()

@end

@implementation DemoPlanet
{
    UIImageView *_earth, *_moon;
    float _radiusEarth, _radiusMoon;
    int _posEarth, _posMoon;
    float _rootX, _rootY;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initPlanet];
    [self runningPlanet];
    
}

-(void)initPlanet
{
    _posEarth = 0;
    _posMoon = 0;
    _radiusEarth = 130.0;
    _radiusMoon = 50.0;
    
    _rootX = self.view.frame.size.width/2;
    _rootY = self.view.frame.size.height/2;
    
    //init sun static
    UIImageView *sun;
    sun = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sun.png"]];
    sun.frame = CGRectMake(0, 0, 120, 120);
    sun.center = CGPointMake(_rootX,_rootY);
    [self.view addSubview:sun];
    
    //init earth
    _earth = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"earth.png"]];
    _earth.frame = CGRectMake(0, 0, 48, 48);
    _earth.center = CGPointMake(_rootX,_rootY);
    [self.view addSubview:_earth];
    
    //init moon
    _moon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"moon.png"]];
    _moon.frame = CGRectMake(0, 0, 24, 24);
    _moon.center = CGPointMake(_rootX-40,_rootY);
    [self.view addSubview:_moon];
    
    
}

-(void)runningPlanet
{
    [UIView animateWithDuration:0.05 animations:^{
        [self setPossitionEarth:_posEarth];
        [self setPossitionMoon:_posMoon andPosEarth:_posEarth];
    } completion:^(BOOL finished) {
        if (_posEarth >= 0) {
            if (_posEarth == 360) {
                _posEarth = 0;
            }
            _posEarth = _posEarth+1;
            
            if (_posMoon == 360) {
                _posMoon = 0;
            }
            _posMoon = _posMoon + 3;
            
            [self runningPlanet];
        }
    }];
}

-(void)setPossitionEarth:(int)pos
{
    float posX, posY, radian;
    radian = -pos*(M_PI/180);
    posX = _rootX - _radiusEarth*cos(radian);
    posY = _rootY - _radiusEarth*sin(radian);

    _earth.center = CGPointMake(posX, posY);
    NSLog(@"cos: %f, sin: %f",cos(radian), sin(radian));
}

-(void)setPossitionMoon:(int)pos andPosEarth:(int)posEarth
{
    float posX, posY, radianMoon, radianEarth;
    radianMoon = -pos*(M_PI/180);
    radianEarth = -posEarth*(M_PI/180);
    
    posX = _rootX - _radiusEarth*cos(radianEarth)-_radiusMoon*cos(radianMoon);
    posY = _rootY - _radiusEarth*sin(radianEarth)-_radiusMoon*sin(radianMoon);
    
    _moon.center = CGPointMake(posX, posY);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    _posEarth = -1;
}

@end
