//
//  Ship.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 8/9/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "Ship.h"
#import <AVFoundation/AVFoundation.h>

@interface Ship ()

@end

@implementation Ship
{
    UIImageView *sea1, *sea2, *sea3, *ship;
    CGFloat width, height;
    AVAudioPlayer *audioPlayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self drawShipAndSea];
    [self animateSea];
    [self animateShip];
    [self playMusic];
}

-(void)drawShipAndSea
{
    width = self.view.bounds.size.width;
    height = self.view.bounds.size.height;
    
    sea1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    sea1.image = [UIImage imageNamed:@"sea1.png"];
    [self.view addSubview:sea1];
    
    sea2 = [[UIImageView alloc] initWithFrame:CGRectMake(width, 0, width, height)];
    sea2.image = [UIImage imageNamed:@"sea2.png"];
    [self.view addSubview:sea2];
    
    sea3 = [[UIImageView alloc] initWithFrame:CGRectMake(width*2, 0, width, height)];
    sea3.image = [UIImage imageNamed:@"sea3.png"];
    [self.view addSubview:sea3];
    
    ship = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ship.png"]];
    ship.frame = CGRectMake(0, 0, 80, 100);
    ship.center = CGPointMake(width*0.5, height - 160);
    [self.view addSubview:ship];
}

-(void)animateShip
{
    [UIView animateWithDuration:1
                     animations:^{
                         ship.transform = CGAffineTransformMakeRotation(-0.05);
                     } completion:^(BOOL finished) {
                         [UIView animateWithDuration:1
                                          animations:^{
                                              ship.transform = CGAffineTransformMakeRotation(0.05);
                                          } completion:^(BOOL finished) {
                                              [self animateShip];
                                          }];
                     }];
}

-(void)animateSea
{
    sea3.frame = CGRectMake(width, 0, width, height);
    [UIView animateWithDuration:15
                     animations:^{
                         sea1.frame = CGRectMake(-width, 0, width, height);
                         sea2.frame = CGRectMake(0, 0, width, height);
                     } completion:^(BOOL finished) {
                         sea1.frame = CGRectMake(width, 0, width, height);
                         [UIView animateWithDuration:15
                                          animations:^{
                                              sea2.frame = CGRectMake(-width, 0, width, height);
                                              sea3.frame = CGRectMake(0, 0, width, height);
                                          } completion:^(BOOL finished) {
                                              sea2.frame = CGRectMake(width, 0, width, height);
                                              [UIView animateWithDuration:15
                                                               animations:^{
                                                                   sea1.frame = CGRectMake(0, 0, width, height);
                                                                   sea3.frame = CGRectMake(-width, 0, width, height);
                                                               } completion:^(BOOL finished) {
                                                                   [self animateSea];
                                                               }];
                                          }];
                     }];
}

-(void)playMusic
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SeeYouAgain" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url
                                                         error:&error];
    [audioPlayer prepareToPlay];
    [audioPlayer play];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [audioPlayer stop];
    sea1 = sea2 = sea3 = ship = nil;
}

@end
