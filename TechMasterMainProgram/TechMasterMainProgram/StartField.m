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
    CGFloat rectX, rectY;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initStar];
}

-(void)initStar
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    starBlack = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    starWhite = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    starBlue = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    starYellow = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    
    starBlack.image = [UIImage imageNamed:@"starBlack.png"];
    starWhite.image = [UIImage imageNamed:@"starWhite.png"];
    starBlue.image = [UIImage imageNamed:@"starBlue.png"];
    starYellow.image = [UIImage imageNamed:@"starYellow.png"];
    
    center = CGPointMake(self.view.frame.size.width*0.5, (self.view.frame.size.height-60)*0.5);
    [self setPossitionInit];
    
    [self.view addSubview:starBlack];
    [self.view addSubview:starWhite];
    [self.view addSubview:starBlue];
    [self.view addSubview:starYellow];
    
    rectX = 100.0;
    rectY = 100.0;
    [self starAnimate];
}

-(void)setPossitionInit
{
    starBlack.center = center;
    starWhite.center = center;
    starBlue.center = center;
    starYellow.center = center;
}

-(void)starAnimate
{
    [UIView animateWithDuration:1 animations:^{
        starBlack.center = CGPointMake(starBlack.center.x+rectX, starBlack.center.y+rectY);
        starWhite.center = CGPointMake(starWhite.center.x-rectX, starWhite.center.y+rectY);
        starBlue.center = CGPointMake(starBlue.center.x-rectX, starBlue.center.y-rectY);
        starYellow.center = CGPointMake(starYellow.center.x+rectX, starYellow.center.y-rectY);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            starBlack.center = CGPointMake(starBlack.center.x, starBlack.center.y-rectY);
            starWhite.center = CGPointMake(starWhite.center.x+rectX, starWhite.center.y);
            starBlue.center = CGPointMake(starBlue.center.x, starBlue.center.y+rectY);
            starYellow.center = CGPointMake(starYellow.center.x-rectX, starYellow.center.y);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:1 animations:^{
                [self setPossitionInit];
            } completion:^(BOOL finished) {
                [self starAnimate];
            }];
        }];
    }];
}

@end
