//
//  ColorView.h
//  TechMasterMainProgram
//
//  Created by TaiND on 8/12/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorView : UILabel
-(instancetype)initColorHex:(NSString*)hex alpha:(float)alpha frame:(CGRect)rect;
@end
