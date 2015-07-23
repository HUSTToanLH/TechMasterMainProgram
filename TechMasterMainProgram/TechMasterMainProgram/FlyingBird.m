//
//  FlyingBird.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/23/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "FlyingBird.h"

@interface FlyingBird ()

@end

@implementation FlyingBird
{
    UIImageView *background, *flyingBird;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self drawJungle];
    [self drawBird];
    [self flyUpAndDown];
    
}

- (void)drawJungle{
    background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    background.frame = self.view.bounds;
    background.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:background];
}

- (void)drawBird{
    CGFloat naviHeight = [UIApplication sharedApplication].statusBarFrame.size.height+self.navigationController.navigationBar.bounds.size.height;
    flyingBird = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, naviHeight, naviHeight)];
    NSMutableArray *birds = [[NSMutableArray alloc] initWithCapacity:6];
    for (int i = 0; i < 6; i++) {
        NSString *fileName = [NSString stringWithFormat:@"bird%d.png",i];
        UIImage *bird;
        if([UIImage imageNamed:fileName] != nil)
            bird = [UIImage imageNamed:fileName];
        [birds addObject:bird];
    }
    flyingBird.animationImages = birds;
    flyingBird.animationDuration = 1;
    flyingBird.animationRepeatCount = -1;
    [self.view addSubview:flyingBird];
    [flyingBird startAnimating];
}

- (void)flyUpAndDown{
    flyingBird.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:7 animations:^{
        flyingBird.center = CGPointMake(self.view.bounds.size.width-20, self.view.bounds.size.height-20);
    } completion:^(BOOL finished) {
        flyingBird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, 1), CGAffineTransformMakeRotation(M_PI_4));
        [UIView animateWithDuration:7 animations:^{
            flyingBird.center = CGPointMake(20, 20);
        } completion:^(BOOL finished) {
            [self flyUpAndDown];
        }];
    }];
}

@end
