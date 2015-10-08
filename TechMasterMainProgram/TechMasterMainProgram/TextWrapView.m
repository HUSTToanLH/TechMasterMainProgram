//
//  TextWrapView.m
//  DemoTableviewFixed
//
//  Created by ToanLH on 10/6/15.
//  Copyright © 2015 ToanLH. All rights reserved.
//

#import "TextWrapView.h"
#import <CoreText/CoreText.h>
@implementation TextWrapView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    /* Define some defaults */
    float padding = 10.0f;
    
    /* Get the graphics context for drawing */
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    /* Core Text Coordinate System is OSX style */
    CGContextSetTextMatrix(ctx, CGAffineTransformIdentity);
    CGContextTranslateCTM(ctx, 0, self.bounds.size.height);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    CGRect textRect = CGRectMake(padding, 0, self.frame.size.width - padding*2, self.frame.size.height);
    
    /* Create a path to draw in and add our text path */
    CGMutablePathRef pathToRenderIn = CGPathCreateMutable();
    CGPathAddRect(pathToRenderIn, NULL, textRect);
    
    /* Add a image path to clip around, region where you want to place image */
    CGRect clipRect = CGRectMake(self.frame.size.width - 150 - 2*padding,  self.frame.size.height + 100, 200, 80);
    CGPathAddRect(pathToRenderIn, NULL, clipRect);
    
    /* Build up an attributed string with the correct font */
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:self.Text];
    
    //setFont
    CTFontRef font = CTFontCreateWithName((CFStringRef) [UIFont systemFontOfSize:10].fontName, [UIFont systemFontOfSize:10].lineHeight, NULL);
    CFAttributedStringSetAttribute(( CFMutableAttributedStringRef) attrString, CFRangeMake(0, attrString.length), kCTFontAttributeName,font);
    
    //set text color
    CGColorRef _white=[UIColor whiteColor].CGColor;
    CFAttributedStringSetAttribute(( CFMutableAttributedStringRef)(attrString), CFRangeMake(0, attrString.length),kCTForegroundColorAttributeName, _white);
    
    /* Get a framesetter to draw the actual text */
    CTFramesetterRef fs = CTFramesetterCreateWithAttributedString(( CFAttributedStringRef) attrString);
    CTFrameRef frame = CTFramesetterCreateFrame(fs, CFRangeMake(0, attrString.length), pathToRenderIn, NULL);
    
    /* Draw the text */
    CTFrameDraw(frame, ctx);
    
    /* Release the stuff we used */
    CFRelease(frame);
    CFRelease(pathToRenderIn);
    CFRelease(fs);
}

@end
