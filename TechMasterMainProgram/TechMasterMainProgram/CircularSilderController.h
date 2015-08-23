//
//  CircularSilderController.h
//  TechMasterMainProgram
//
//  Created by ToanLH on 8/23/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CircularSilderController : NSObject

+(CGFloat) angleFromPoint:(CGPoint)fromPoint
                  toPoint:(CGPoint)toPoint;

+(void) drawUnfilledCircleInContext:(CGContextRef)ctx
                             center:(CGPoint)center
                             radius:(CGFloat)radius
                          lineWidth:(CGFloat)lineWidth;

+(void) drawUnfilledArcInContext:(CGContextRef)ctx
                          center:(CGPoint)center
                          radius:(CGFloat)radius
                       lineWidth:(CGFloat)lineWidth
              fromAngleFromNorth:(CGFloat)fromAngleFromNorth
                toAngleFromNorth:(CGFloat)toAngleFromNorth;

@end
