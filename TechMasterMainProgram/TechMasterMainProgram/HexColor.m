//
//  HexColor.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 8/12/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "HexColor.h"
#import "UIColor+Extend.h"
#import "ColorView.h"

@interface HexColor ()<UITextFieldDelegate>

@end

@implementation HexColor
{
    UITextField *txfHex, *txfRed, *txfGreen, *txfBlue;
    UILabel *lblContent;
    UIButton *btnGo;
    NSArray *cp1, *cp2, *cp3, *cp4, *cp5, *cp6;
    NSArray *dp1, *dp2, *dp3, *dp4, *dp5, *dp6;
    NSArray *ep1, *ep2, *ep3, *ep4, *ep5, *ep6;
    NSArray *cpSum;
    CGFloat margin, width, height, txfWidth, txfHeight, centerY;
    int t;
    NSTimer *timer;
    NSString *validateHex;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initColorHex:@"#F1EFA5" alpha:1];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    t = 0;
    validateHex = @"abcdefABCDEF0123456789";
    
    cp1 = @[@"ECD078", @"D95B43", @"C02942", @"542437"];
    cp2 = @[@"00A0B0", @"6A4A3C", @"CC333F", @"EB6841"];
    cp3 = @[@"594F4F", @"547980", @"45ADA8", @"9DE0AD"];
    cp4 = @[@"FF9900", @"424242", @"E9E9E9", @"BCBCBC"];
    cp5 = @[@"5E412F", @"FCEBB6", @"78C0A8", @"F07818"];
    cp6 = @[@"FAD089", @"FF9C5B", @"F5634A", @"ED303C"];
    NSArray *cpArray = @[cp1, cp2, cp3, cp4, cp5, cp6];
    
    dp1 = @[@"69D2E7", @"A7DBD8", @"E0E4CC", @"F38630"];
    dp2 = @[@"FA6900", @"FE4365", @"FC9D9A", @"F9CDAD"];
    dp3 = @[@"C8C8A9", @"83AF9B", @"ECD078", @"D95B43"];
    dp4 = @[@"C02942", @"542437", @"53777A", @"556270"];
    dp5 = @[@"4ECDC4", @"C7F464", @"FF6B6B", @"C44D58"];
    dp6 = @[@"774F38", @"E08E79", @"F1D4AF", @"ECE5CE"];
    NSArray *dpArray = @[dp1, dp2, dp3, dp4, dp5, dp6];
    
    ep1 = @[@"C5E0DC", @"E8DDCB", @"CDB380", @"036564"];
    ep2 = @[@"036564", @"594F4F", @"547980", @"45ADA8"];
    ep3 = @[@"9DE0AD", @"E5FCC2", @"E94E77", @"D68189"];
    ep4 = @[@"C6A49A", @"C6E5D9", @"CBE86B", @"F2E9E1"];
    ep5 = @[@"00A8C6", @"40C0CB", @"F9F2E7", @"AEE239"];
    ep6 = @[@"8FBE00", @"D1E751", @"FFFFFF", @"4DBCE9"];
    NSArray *epArray = @[ep1, ep2, ep3, ep4, ep5, ep6];
    cpSum = @[cpArray, dpArray, epArray];
    
    //    [self initGridColorView];
    timer = [NSTimer scheduledTimerWithTimeInterval:3
                                             target:self
                                           selector:@selector(animateGridColor)
                                           userInfo:nil
                                            repeats:true];
    [self animateGridColor];
    [self initColorConvertView];
}

- (void)initGridColorView:(NSArray*)pArray
{
    margin = 20.0;
    width = self.view.frame.size.width;
    height = self.view.frame.size.height;
    
    CGFloat cpWidth = (width - 5*margin)/4;
    CGFloat cpHeight = cpWidth/3;
    
    int k = 0;
    for (NSArray *array in pArray) {
        for (int i = 0; i < array.count; i++) {
            NSString *hexColor = [array objectAtIndex:i];
            CGRect frame = CGRectMake(margin+i*(cpWidth+margin), 50.0+k*(margin+cpHeight), cpWidth, cpHeight);
            UILabel *label = [[ColorView alloc] initColorHex:hexColor alpha:1 frame:frame];
            [self.view addSubview:label];
        }
        k++;
    }
}

-(void)animateGridColor
{
    if (t >= cpSum.count) {
        t = 0;
    }
    [self initGridColorView:cpSum[t]];
    t++;
}

-(CGFloat)checkMaxHeight
{
    CGFloat maxHeight = 0;
    for (UIView *subView in self.view.subviews) {
        if ((subView.frame.origin.y+subView.frame.size.height*0.5) > maxHeight) {
            maxHeight = subView.frame.origin.y+subView.frame.size.height*0.5;
        }
    }
    return maxHeight;
}

- (void)initColorConvertView
{
    centerY= 376;//100+[self checkMaxHeight];
    txfWidth = (width - 6*margin - 50)/4;
    txfHeight = txfWidth/2.5;
    
    [self addLabelAndTextField:@"Hex" centerX:margin+txfWidth width:2*txfWidth];
    [self addLabelAndTextField:@"Red" centerX:3*margin+txfWidth*1.5+50 width:txfWidth];
    [self addLabelAndTextField:@"Green" centerX:4*margin+50+2.5*txfWidth width:txfWidth];
    [self addLabelAndTextField:@"Blue" centerX:5*margin+50+3.5*txfWidth width:txfWidth];
    
    lblContent = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    lblContent.center = CGPointMake(width*0.5, txfHex.center.y+100);
    lblContent.backgroundColor = [UIColor clearColor];
    [self.view addSubview:lblContent];
    
    txfHex.delegate = self;
    txfRed.delegate = self;
    txfGreen.delegate = self;
    txfBlue.delegate = self;
    
    txfHex.autocapitalizationType = UITextAutocapitalizationTypeNone;
    
    //    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 25)];
    //    button.center = CGPointMake(2*margin+txfWidth+25, centerY+(txfHeight+margin)*0.5);
    //    button.backgroundColor = [[UIColor alloc] initColorHex:@"#FF9E9D" alpha:1];
    //    [[button layer] setCornerRadius:6.0f];
    //    [[button layer] setMasksToBounds:YES];
    //    [[button layer] setBorderWidth:0.5f];
    //    [self.view addSubview:button];
}

- (void)addLabelAndTextField:(NSString*)title centerX:(CGFloat)centerX width:(CGFloat)cWidth
{
    CGPoint center = CGPointMake(centerX, centerY);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cWidth, txfHeight)];
    label.center = center;
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [[UIColor alloc] initColorHex:@"#ffffff" alpha:1];
    label.font = [UIFont fontWithName:@"Helvetica" size:13];
    [self.view addSubview:label];
    
    if ([title isEqual:@"Hex"]) {
        txfHex = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, cWidth, txfHeight)];
        center.y = center.y + margin+txfHeight*0.5;
        txfHex.center = center;
        txfHex.borderStyle = UITextBorderStyleRoundedRect;
        txfHex.placeholder = title;
        txfHex.font = [UIFont fontWithName:@"Helvetica" size:13];
        txfHex.backgroundColor = [[UIColor alloc] initColorHex:@"#dae5e8" alpha:1];
        [self.view addSubview:txfHex];
    }
    if ([title isEqual:@"Red"]) {
        txfRed = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, cWidth, txfHeight)];
        center.y = center.y + margin+txfHeight*0.5;
        txfRed.center = center;
        txfRed.borderStyle = UITextBorderStyleRoundedRect;
        txfRed.placeholder = title;
        txfRed.font = [UIFont fontWithName:@"Helvetica" size:13];
        txfRed.backgroundColor = [[UIColor alloc] initColorHex:@"#dae5e8" alpha:1];
        [self.view addSubview:txfRed];
    }
    if ([title isEqual:@"Green"]) {
        txfGreen = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, cWidth, txfHeight)];
        center.y = center.y + margin+txfHeight*0.5;
        txfGreen.center = center;
        txfGreen.borderStyle = UITextBorderStyleRoundedRect;
        txfGreen.placeholder = title;
        txfGreen.font = [UIFont fontWithName:@"Helvetica" size:13];
        txfGreen.backgroundColor = [[UIColor alloc] initColorHex:@"#dae5e8" alpha:1];
        [self.view addSubview:txfGreen];
    }
    if ([title isEqual:@"Blue"]) {
        txfBlue = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, cWidth, txfHeight)];
        center.y = center.y + margin+txfHeight*0.5;
        txfBlue.center = center;
        txfBlue.borderStyle = UITextBorderStyleRoundedRect;
        txfBlue.placeholder = title;
        txfBlue.font = [UIFont fontWithName:@"Helvetica" size:13];
        txfBlue.backgroundColor = [[UIColor alloc] initColorHex:@"#dae5e8" alpha:1];
        [self.view addSubview:txfBlue];
    }
    
}

-(void)viewDidAppear:(BOOL)animated
{
    cp1 = cp2 = cp3 = cp4 = cp5 = cp6 = nil;
}

-(void)convertColorToRGB:(NSString *) hexCode
{
    NSString *hex = hexCode;
    
    NSMutableString *filterHex = [[NSMutableString alloc] initWithCapacity:6];
    
    for (int i = 0; i < hex.length; i++) {
        unichar item = [hex characterAtIndex:i];
        NSString *itemStr = [[NSString alloc] initWithFormat:@"%c", item];
        if ([validateHex rangeOfString:itemStr
                               options:NSCaseInsensitiveSearch].location != NSNotFound) {
            [filterHex appendString:itemStr];
        }
    }
    
    if (filterHex.length == 6) {
        unsigned long long colorValue;
        NSScanner *scanner = [[NSScanner alloc] initWithString:filterHex];
        [scanner scanHexLongLong:&colorValue];
        
        CGFloat redColor = (CGFloat)((colorValue & 0XFF0000) >> 16) /255.0;
        CGFloat greenColor = (CGFloat)((colorValue & 0X00FF00) >> 8) /255.0;
        CGFloat blueColor = (CGFloat)((colorValue & 0X0000FF))/255.0;
        
        txfRed.text = [NSString stringWithFormat:@"%d", (int)(redColor*255.0)];
        txfGreen.text = [NSString stringWithFormat:@"%d", (int)(greenColor*255.0)];
        txfBlue.text = [NSString stringWithFormat:@"%d", (int)(blueColor*255.0)];
        
        lblContent.backgroundColor = [[UIColor alloc] initColorHex:hex alpha:1];
    }
    else{
        txfRed.text = nil;
        txfGreen.text = nil;
        txfBlue.text = nil;
        lblContent.backgroundColor = [UIColor clearColor];
    }
}

-(void)convertColorToHex
{
    int red = [txfRed.text intValue];
    int green = [txfGreen.text intValue];
    int blue = [txfBlue.text intValue];
    txfHex.text  = [[NSString stringWithFormat:@"#%02x%02x%02x",
                     ((int)red),((int)green),((int)blue)] uppercaseString];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string

{
    if (textField == txfHex) {
        NSString *text;
        if (textField.text.length > 0) {
            text = [textField.text substringToIndex:1];
        }
        else{
            text = string;
        }
        int length;
        if ([text isEqual:@"#"]) {
            length = 7;
        }
        else{
            length = 6;
        }
        textField.text = [textField.text uppercaseString];
        if (![string isEqual:@""]) {
            if ([validateHex rangeOfString:string
                                   options:NSCaseInsensitiveSearch].location == NSNotFound) {
                if (range.location > 0) {
                    return NO;
                }
                else{
                    if (![string isEqual:@"#"]) {
                        return NO;
                    }
                }
            }
        }
        if (textField.text.length >= length && range.length == 0)
        {
            return NO; // return NO to not change text
        }
        
        NSString *hexcode;
        if (![string isEqual:@""]) {
            hexcode = [textField.text stringByAppendingString:string];
        }
        else{
            if (textField.text.length >= 2) {
                hexcode = [textField.text substringToIndex:textField.text.length-2];
            }
        }
        [self convertColorToRGB:hexcode];
    }
    
    if (textField == txfRed || textField == txfGreen || textField == txfBlue) {
        if (![string isEqual:@""]) {
            if ([@"0123456789" rangeOfString:string
                                     options:NSCaseInsensitiveSearch].location == NSNotFound) {
                return NO;
            }
        }
        
        if ([[textField.text stringByAppendingString:string] intValue] >= 255) {
            return NO;
        }
        
        if (textField.text.length >= 3 && range.length == 0)
        {
            return NO;
        }
        
        
        NSString *rgbCode = [textField.text stringByAppendingString:string];
        NSString *key;
//        if ([txfRed is]) {
//            <#statements#>
//        }
        
        
        [self convertColorToHex];
    }
    return YES;
}


@end
