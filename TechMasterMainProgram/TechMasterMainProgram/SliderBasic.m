//
//  SliderBasic.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/21/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "SliderBasic.h"

@interface SliderBasic ()
@property (strong, nonatomic) IBOutlet UISlider *slider;

@end

@implementation SliderBasic

- (void)viewDidLoad {
    [super viewDidLoad];
    [_slider setThumbImage:[UIImage imageNamed:@"thumb1.png"] forState:UIControlStateNormal];
    
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 5, 10,10);
    UIImage *maxTrack = [[UIImage imageNamed:@"maxTrack2.png"] resizableImageWithCapInsets:inset];
    UIEdgeInsets inset2 = UIEdgeInsetsMake(5, 5, 0, 5);
    UIImage *minTrack = [[UIImage imageNamed:@"minTrack2.png"] resizableImageWithCapInsets:inset2];
    
    [[UISlider appearance] setMaximumTrackImage:maxTrack forState:UIControlStateNormal];
    [[UISlider appearance] setMinimumTrackImage:minTrack forState:UIControlStateNormal];
    
    
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"background1.jpg"] drawInRect:self.view.bounds];
    UIImage *bg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:bg];
}
- (IBAction)onChangeSlider:(id)sender {
}

@end
