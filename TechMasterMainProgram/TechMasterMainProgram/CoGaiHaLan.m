//
//  CoGaiHaLan.m
//  TechMasterMainProgram
//
//  Created by ios31 on 8/2/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "CoGaiHaLan.h"
#import <AVFoundation/AVFoundation.h>

@interface CoGaiHaLan ()
@property (weak, nonatomic) IBOutlet UIImageView *imgWindMill1;
@property (weak, nonatomic) IBOutlet UIImageView *imgDutchLady;
@property (weak, nonatomic) IBOutlet UIImageView *imgMilkBucket;
@property (weak, nonatomic) IBOutlet UIImageView *imgBird;

@end

@implementation CoGaiHaLan
{
    UIImageView *windMill, *airplane, *glass;
    NSTimer *_timer;
    UIImageView *flyingBird;
    AVAudioPlayer* chimHot, *boKeu;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self drawBackGround];
    [self drawWindMill];
    [self drawBird];
    [self chimHot];
    [self flyingBird];
    [self drawAirplaneAndGlass];
    [self plannning];
    [self animatedDutchLady:2];
}

-(void)drawAirplaneAndGlass
{
    airplane = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"airplane.png"]];
//    airplane.frame = CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/2+100, 20, 10);
    airplane.center = CGPointMake(320, 368);
    NSLog(@"on: %f, %f",self.view.frame.size.width/2, self.view.frame.size.height/2);
    NSLog(@"on2: %f, %f",airplane.center.x, airplane.center.y);
    CGRect frame = airplane.frame;
    frame.size.width = 60;
    frame.size.height = 40;
    airplane.frame = frame;
    
    glass = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [glass setImage:[UIImage imageNamed:@"glassbroken.jpeg"]];
    glass.alpha = 0;
    
    [self.view addSubview:airplane];
    [self.view addSubview:glass];
}

-(void)drawWindMill
{
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity:44];
    for (int i = 0; i < 44; i++) {
        NSString *fileName;
        if (i<10)
            fileName = [NSString stringWithFormat:@"frame_0%d_delay-0.25s.gif",i];
        else
            fileName = [NSString stringWithFormat:@"frame_%d_delay-0.25s.gif",i];

        if([UIImage imageNamed:fileName] != nil)
            [images addObject:[UIImage imageNamed:fileName]];
    }
    _imgWindMill1.animationImages = images;
    _imgWindMill1.animationDuration = 1;
    _imgWindMill1.animationRepeatCount = 0;
    [self.view addSubview:_imgWindMill1];
    [_imgWindMill1 startAnimating];
}

-(void)plannning
{
    [UIView animateWithDuration:4 animations:^{
//        airplane.center = CGPointMake(200, 200);
//        CGRect frame = airplane.frame;
//        frame.size.width = 300;
//        frame.size.height = 150;
//        airplane.frame = frame;
        
        CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(0);
        CGAffineTransform scalaTransform = CGAffineTransformMakeScale(100, 50);
        airplane.transform = CGAffineTransformConcat(rotateTransform, scalaTransform);
        airplane.alpha = 1;
        glass.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)drawBird{
    CGFloat naviHeight = [UIApplication sharedApplication].statusBarFrame.size.height+self.navigationController.navigationBar.bounds.size.height;
    flyingBird = [[UIImageView alloc] initWithFrame:CGRectMake(20, 350, naviHeight, naviHeight)];
    NSMutableArray *birds = [[NSMutableArray alloc] initWithCapacity:6];
    for (int i = 0; i < 6; i++) {
        NSString *fileName = [NSString stringWithFormat:@"bird_%d_delay-0.1s.gif",i];
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

- (void)flyingBird{
    flyingBird.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:7 animations:^{
        flyingBird.center = CGPointMake(self.view.bounds.size.width-20, 350);
        [self boKeu];
    } completion:^(BOOL finished) {
        flyingBird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, 1), CGAffineTransformMakeRotation(0));
        [self boKeu];
        [UIView animateWithDuration:7 animations:^{
            flyingBird.center = CGPointMake(20, 350);
        } completion:^(BOOL finished) {
            [self flyingBird];
        }];
    }];
}

-(void)animatedDutchLady:(int)time
{
    [UIView animateWithDuration:1 animations:^{
        CATransform3D t = _imgDutchLady.layer.transform;;
        t.m34 = -0.005;
        t = CATransform3DRotate(t, M_PI/15.0, 0.0, 0.0, 1.0);
        self.imgDutchLady.layer.transform = t;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            CATransform3D t = _imgDutchLady.layer.transform;;
            t.m34 = -0.005;
            t = CATransform3DRotate(t, -M_PI/15.0, 0.0, 0.0, 1.0);
            self.imgDutchLady.layer.transform = t;
        } completion:^(BOOL finished) {
            [self animatedDutchLady:time-1];
        }];
    }];
}

-(void)drawBackGround
{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"dongco.png"] drawInRect:self.view.bounds];
    UIImage *bg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:bg];
}

-(void)flipDutchLady:(int)flip
{
    CGRect frame = _imgMilkBucket.frame;
    NSLog(@"1:%f",frame.origin.x);
    if (flip == 1) {
        _imgDutchLady.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, 1), CGAffineTransformMakeRotation(0));
        frame.origin.x = frame.origin.x + _imgDutchLady.frame.size.width;
    }
    else{
        _imgDutchLady.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 1), CGAffineTransformMakeRotation(0));
        frame.origin.x = frame.origin.x - _imgDutchLady.frame.size.width;
    }
    NSLog(@"2:%f",frame.origin.x);
    _imgMilkBucket.frame = frame;
}

-(void)chimHot
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"hoami" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    chimHot = [[AVAudioPlayer alloc] initWithContentsOfURL:url
                                                         error:&error];
    [chimHot prepareToPlay];
    [chimHot play];
}

-(void)boKeu
{
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"bokeu" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    boKeu = [[AVAudioPlayer alloc] initWithContentsOfURL:url
                                                     error:&error];
    [boKeu prepareToPlay];
    [boKeu play];
}
- (void) viewWillDisappear:(BOOL)animated {
    [chimHot stop];
    [boKeu stop];
}

@end
