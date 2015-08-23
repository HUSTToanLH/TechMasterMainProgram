//
//  CircularSlider.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 8/23/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "CircularSlider.h"
#import "CircularSilderController.h"

@interface CircularSlider()

@property (nonatomic) CGFloat radius;
@property (nonatomic, strong) NSMutableDictionary *labelsWithPercents;

@property (nonatomic, readonly) CGFloat innerLabelRadialDistanceFromCircumference;
@property (nonatomic, readonly) CGPoint centerPoint;

@property (nonatomic, readonly) CGFloat radiusForDoubleCircleOuterCircle;
@property (nonatomic, readonly) CGFloat lineWidthForDoubleCircleOuterCircle;
@property (nonatomic, readonly) CGFloat radiusForDoubleCircleInnerCircle;
@property (nonatomic, readonly) CGFloat lineWidthForDoubleCircleInnerCircle;

@end

static const CGFloat kFitFrameRadius = -1.0;

@implementation CircularSlider

@synthesize radius = _radius;

#pragma mark - Initialisation
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDefaultValuesWithRadius:kFitFrameRadius];
    }
    return self;
}

-(void) initDefaultValuesWithRadius:(CGFloat)radius
{
    _radius        = radius;
    _maximumValue  = 100.0f;
    _minimumValue  = 0.0f;
    _lineWidth     = 5;
    _unfilledColor = [UIColor blackColor];
    _filledColor   = [UIColor redColor];
    
    _angle = 270;
    
    self.backgroundColor = [UIColor clearColor];
}

#pragma mark - Public setter overrides
-(void) setLineWidth:(int)lineWidth
{
    _lineWidth = lineWidth;
}

-(void) setFilledColor:(UIColor*)filledColor
{
    _filledColor = filledColor;
}

-(void) setUnfilledColor:(UIColor*)unfilledColor
{
    _unfilledColor = unfilledColor;
}

-(void)setMinimumValue:(float)minimumValue
{
    _minimumValue = minimumValue;
}

-(void)setMaximumValue:(float)maximumValue
{
    _maximumValue = maximumValue;
}

#pragma mark - Public getter overrides
-(CGFloat) radius
{
    if (_radius == kFitFrameRadius)
    {
        CGFloat minimumDimension = MIN(self.bounds.size.height, self.bounds.size.width);
        int halfLineWidth = ceilf(self.lineWidth / 2.0);
        return minimumDimension * 0.5 - halfLineWidth;
    }
    return _radius;
}

#pragma mark - Private getter overrides
-(CGPoint)centerPoint
{
    return CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
}

#pragma mark - Method overrides

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // Draw the circular lines
    [self drawLine:ctx];
}


#pragma mark - Drawing methods

-(void) drawLine:(CGContextRef)ctx
{
    // Draw an unfilled circle
    [self.unfilledColor set];
    [CircularSilderController drawUnfilledCircleInContext:ctx
                                         center:self.centerPoint
                                         radius:self.radius
                                      lineWidth:self.lineWidth];
    
    // Draw an unfilled arc up to the currently filled point
    [self.filledColor set];
    [CircularSilderController drawUnfilledArcInContext:ctx
                                      center:self.centerPoint
                                      radius:self.radius
                                   lineWidth:self.lineWidth
                          fromAngleFromNorth:180
                            toAngleFromNorth:self.angle];
}

#pragma mark - UIControl functions

-(BOOL) continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [super continueTrackingWithTouch:touch withEvent:event];
    
    CGPoint lastPoint = [touch locationInView:self];
    int currentAngle = floor([CircularSilderController angleFromPoint:self.centerPoint
                                                              toPoint:lastPoint]);
    if (currentAngle < 180 && currentAngle > 90) {
        return NO;
    }
    self.angle = currentAngle;
    [self setNeedsDisplay];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    return YES;
}

-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [super endTrackingWithTouch:touch withEvent:event];
    CGPoint lastPoint = [touch locationInView:self];
    int currentAngle = floor([CircularSilderController angleFromPoint:self.centerPoint
                                                              toPoint:lastPoint]);
    if (currentAngle < 180 && currentAngle > 90) {
        return;
    }
    self.angle = currentAngle;
    [self setNeedsDisplay];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

@end
