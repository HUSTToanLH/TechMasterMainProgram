//
//  RunningLED.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/16/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "RunningLED.h"

@interface RunningLED ()
@property (strong, nonatomic) IBOutlet UIView *mainView;

@end

@implementation RunningLED
{
    CGFloat _margin;//>ball radius
    int _numberOfBall;
    CGFloat _space;//>ball diameter
    CGFloat _ballDiameter;
    NSTimer* _timer;
    int lastONLED;
    int x_lastONLED;
    int y_lastONLED;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _ballDiameter = [self getDiameterOfBall:@"lightBall"];
    _margin = _ballDiameter;
    //    lastONLED = _numberOfBall;
    
    x_lastONLED = -1;
    y_lastONLED = -1;
    
    _numberOfBall = [self getMaxNumberOfBall];
    
//    [self drawBall: _numberOfBall];
//    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runningLed) userInfo:nil repeats:true];
    
//    matrix
        [self drawBallAd: _numberOfBall];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(runningLedAd) userInfo:nil repeats:true];
}

- (void) runningLedAd
{
    if(x_lastONLED != -1 && y_lastONLED != -1){
        [self turnOFFLedAd:x_lastONLED andY:y_lastONLED];
    }
    
    if (y_lastONLED != _numberOfBall && x_lastONLED != _numberOfBall) {
        if(x_lastONLED == -1){
            x_lastONLED++;
        }
        y_lastONLED++;
    }
    else if (y_lastONLED == _numberOfBall && x_lastONLED != _numberOfBall){
        y_lastONLED = 0;
        x_lastONLED++;
    }
    else if (y_lastONLED != _numberOfBall && x_lastONLED == _numberOfBall){
        y_lastONLED++;
    }
    else if (y_lastONLED == _numberOfBall && x_lastONLED == _numberOfBall){
        x_lastONLED = 0;
        y_lastONLED = 0;
    }
    
    [self turnONLedAd:x_lastONLED andY:y_lastONLED];
}

- (void) runningLedContrary
{
    if(lastONLED != _numberOfBall){
        [self turnOFFLed:lastONLED];
    }
    
    if (lastONLED != 0) {
        lastONLED--;
    }else{
        lastONLED = _numberOfBall;
    }
    [self turnONLed:lastONLED];
}


- (void)runningLed
{
    if(lastONLED != -1){
        [self turnOFFLed:lastONLED];
    }
    
    if (lastONLED != _numberOfBall) {
        lastONLED++;
    }else{
        lastONLED = 0;
    }
    [self turnONLed:lastONLED];
}

- (void)turnONLed:(int)index
{
    UIView* view = [self.view viewWithTag:index+100];
    if(view && [view isMemberOfClass:[UIImageView class]]){
        UIImageView* ball = (UIImageView*)view;
        ball.image = [UIImage imageNamed:@"lightBall"];
    }
}

- (void)turnONLedAd:(int)x andY:(int)y
{
    UIView* view = [self.view viewWithTag:(x+1)*100+y];
    if(view && [view isMemberOfClass:[UIImageView class]]){
        UIImageView* ball = (UIImageView*)view;
        ball.image = [UIImage imageNamed:@"lightBall"];
    }
}

- (void)turnOFFLed:(int)index
{
    UIView* view = [self.view viewWithTag:index+100];
    if(view && [view isMemberOfClass:[UIImageView class]]){
        UIImageView* ball = (UIImageView*)view;
        ball.image = [UIImage imageNamed:@"darkBall"];
    }
}

- (void)turnOFFLedAd:(int)x andY:(int)y
{
    UIView* view = [self.view viewWithTag:(x+1)*100+y];
    if(view && [view isMemberOfClass:[UIImageView class]]){
        UIImageView* ball = (UIImageView*)view;
        ball.image = [UIImage imageNamed:@"darkBall"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)placeLightBallAtX: (CGFloat) x
                     andY: (CGFloat) y
                  withTag: (int) tag
{
    UIImageView* ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"darkBall"]];
    ball.center = CGPointMake(x, y);
    ball.tag = tag;
    [_mainView addSubview: ball];
    //    NSLog(@"w: %3.0f, h: %3.0f", ball.bounds.size.width, ball.bounds.size.height);
}

- (CGFloat)getSpaceWhenNumberOfBallIsKnown: (int) n
{
    return (self.view.bounds.size.width - 2*_margin)/(n-1);
}

- (void) drawBallAd:(int)numberBall
{
    CGFloat space = [self getSpaceWhenNumberOfBallIsKnown:numberBall];
    for (int i = 0; i < numberBall; i++) {
        for (int j = 0; j < numberBall; j++) {
            [self placeLightBallAtX:_margin + j*space
                               andY:140 + i*space
                            withTag:(i+1)*100+j];
        }
    }
}

- (void) drawBall:(int)numberBall
{
    CGFloat space = [self getSpaceWhenNumberOfBallIsKnown:numberBall];
    for (int i = 0; i < numberBall; i++) {
        [self placeLightBallAtX:_margin + i*space
                           andY:140
                        withTag:i+100];
    }
}

//- (int) numberOfBallvsSpace
//{
//    bool stop = false;
//    int n = 3;
//    while (!stop) {
//        CGFloat space = [self getSpaceWhenNumberOfBallIsKnown: n];
//        if(space < _ballDiameter)
//            stop = true;
//        else
//            NSLog(@"Number ball is: %d with space: %3.0f",n, space);
//        n++;
//    }
//    return n;
//}

- (int) getMaxNumberOfBall
{
    bool stop = false;
    int n = 3;
    while (!stop) {
        CGFloat space = [self getSpaceWhenNumberOfBallIsKnown: n];
        if(space <= 2*_ballDiameter)
            stop = true;
        else
            NSLog(@"ball: %d, space: %3.0f",n,space);
        n++;
    }
    return n-1;
}

- (CGSize) getSizeOfApp
{
    CGSize size = self.view.bounds.size;
    //    NSLog(@"width: %3.0f, height: %3.0f", size.width, size.height);
    return size;
}

- (CGFloat) getDiameterOfBall:(NSString *)nameOfBall
{
    UIImageView* ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:nameOfBall]];
    return ball.bounds.size.width;
}

@end
