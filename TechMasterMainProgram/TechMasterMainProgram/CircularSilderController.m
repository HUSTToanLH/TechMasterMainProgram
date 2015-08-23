//
//  CircularSilderController.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 8/23/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "CircularSilderController.h"

#define CartesianToCompass(rad) ( rad + M_PI/2 )
#define CompassToCartesian(rad) ( rad - M_PI/2 )
#define DegToRad(deg) 		( (M_PI * (deg)) / 180.0 )
#define RadToDeg(rad)		( (180.0 * (rad)) / M_PI )

@implementation CircularSilderController

+(CGFloat) angleFromPoint:(CGPoint)fromPoint
                  toPoint:(CGPoint)toPoint
{
    CGPoint temp = CGPointMake(toPoint.x-fromPoint.x,toPoint.y-fromPoint.y);
    float hypotenuse = sqrt(pow(temp.x, 2)+ pow(temp.y, 2));
    temp.x /= hypotenuse;
    temp.y /= hypotenuse;
    double cartesianRadians = atan2(temp.y,temp.x);
    
    double compassRadians = CartesianToCompass(cartesianRadians);
    if (compassRadians < 0)
    {
        compassRadians += (2 * M_PI);
    }
    return RadToDeg(compassRadians);
}

+(void) drawUnfilledCircleInContext:(CGContextRef)ctx
                             center:(CGPoint)center
                             radius:(CGFloat)radius
                          lineWidth:(CGFloat)lineWidth
{
    [self drawUnfilledArcInContext:ctx
                            center:center
                            radius:radius
                         lineWidth:lineWidth
                fromAngleFromNorth:0
                  toAngleFromNorth:360]; // 0 - 360 is full circle
}

+(void) drawUnfilledArcInContext:(CGContextRef)ctx
                          center:(CGPoint)center
                          radius:(CGFloat)radius
                       lineWidth:(CGFloat)lineWidth
              fromAngleFromNorth:(CGFloat)fromAngleFromNorth
                toAngleFromNorth:(CGFloat)toAngleFromNorth
{
    float cartesianFromAngle = CompassToCartesian(DegToRad(fromAngleFromNorth));
    float cartesianToAngle   = CompassToCartesian(DegToRad(toAngleFromNorth));
    
    CGContextAddArc(ctx,
                    center.x,
                    center.y,
                    radius,
                    cartesianFromAngle,
                    cartesianToAngle,
                    0);
    
    CGContextSetLineWidth(ctx, lineWidth);
    CGContextSetLineCap(ctx, kCGLineCapButt);
    CGContextDrawPath(ctx, kCGPathStroke);
}

@end
