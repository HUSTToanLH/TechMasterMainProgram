//
//  ColorView.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/12/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "ColorView.h"
#import "UIColor+Extend.h"

@implementation ColorView

-(instancetype)initColorHex:(NSString*)hex alpha:(float)alpha frame:(CGRect)rect
{
    self = [super initWithFrame:rect];
    self.backgroundColor = [[UIColor alloc] initColorHex:hex alpha:alpha];
    self.text = [@"#" stringByAppendingString:hex];
    self.textAlignment = NSTextAlignmentCenter;
    self.textColor = [UIColor blackColor];
    self.font = [UIFont fontWithName:@"Helvetica" size:13];
    return self;
}

@end
