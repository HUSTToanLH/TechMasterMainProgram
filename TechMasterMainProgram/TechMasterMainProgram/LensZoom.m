//
//  LensZoom.m
//  TechMasterMainProgram
//
//  Created by TaiND on 9/22/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "LensZoom.h"

@interface LensZoom ()<UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic) CGPoint circleCenter;
@property (nonatomic) CGFloat circleRadius;

@property (nonatomic, weak) CAShapeLayer *maskLayer;
@property (nonatomic, weak) CAShapeLayer *circleLayer;

@property (nonatomic, weak) UIPanGestureRecognizer *pan;
@property (nonatomic, weak) UIPinchGestureRecognizer *pinch;
@end

@implementation LensZoom

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    self.imageView.layer.mask = maskLayer;
    self.maskLayer = maskLayer;
    
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    circleLayer.lineWidth = 2.0;
    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, 100, 100)] CGPath]];
    circleLayer.fillColor = [[UIColor clearColor] CGColor];
    circleLayer.strokeColor = [[UIColor blackColor] CGColor];
    [self.imageView.layer addSublayer:circleLayer];
    self.circleLayer = circleLayer;
    
    [self updateCircleWithCenter:CGPointMake(self.view.bounds.size.width*0.5, self.view.bounds.size.height*0.5) andRadius:self.view.bounds.size.width*0.20];
    
    
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    pan.delegate = self;
    [self.imageView addGestureRecognizer:pan];
    self.imageView.userInteractionEnabled = YES;
//    self.imageView.multipleTouchEnabled = YES;
    self.pan = pan;
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch:)];
    pinch.delegate = self;
    [self.imageView addGestureRecognizer:pinch];
    self.pinch = pinch;
}

-(void)updateCircleWithCenter:(CGPoint)center andRadius:(CGFloat)radius{
    self.circleCenter = center;
    self.circleRadius = radius;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path addArcWithCenter:self.circleCenter
//                    radius:self.circleRadius
//                startAngle:0.0
//                  endAngle:M_PI*2.0
//                 clockwise:YES];
    
    path  = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(self.circleCenter.x, self.circleCenter.y, 100 + self.circleRadius, 60 + self.circleRadius)];
    
    self.maskLayer.path = [path CGPath];
    self.circleLayer.path = [path CGPath];
}

-(void)onPan:(UIPanGestureRecognizer*)ges{
    NSLog(@"pan");
    static CGPoint oldPoint;
    CGPoint translation = [ges translationInView:ges.view];
    if (ges.state == UIGestureRecognizerStateBegan) {
        oldPoint = self.circleCenter;
    }
    CGPoint newPoint = CGPointMake(oldPoint.x + translation.x, oldPoint.y + translation.y);
    [self updateCircleWithCenter:newPoint andRadius:self.circleRadius];
}

-(void)onPinch:(UIPinchGestureRecognizer*)ges{
    static CGFloat oldRadius;
    CGFloat scale = [ges scale];
    if (ges.state == UIGestureRecognizerStateBegan) {
        oldRadius = self.circleRadius;
    }
    CGFloat newRadius = oldRadius * scale;
    [self updateCircleWithCenter:self.circleCenter andRadius:newRadius];
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if ((gestureRecognizer == self.pan && otherGestureRecognizer == self.pinch) || (gestureRecognizer == self.pinch && otherGestureRecognizer == self.pan)) {
        return YES;
    }
    else{
        return NO;
    }
}

@end
