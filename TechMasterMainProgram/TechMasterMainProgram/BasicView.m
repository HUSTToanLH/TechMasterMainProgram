//
//  BasicView.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/23/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "BasicView.h"

@interface BasicView ()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UISwitch *mySwitch;
@property (strong, nonatomic) IBOutlet UISlider *sliderAlpha;
@property (strong, nonatomic) IBOutlet UISlider *sliderRotate;
@property (strong, nonatomic) IBOutlet UISlider *sliderScale;
@property (strong, nonatomic) IBOutlet UISegmentedControl *mySegment;

@end

@implementation BasicView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self onShow:_mySwitch];
    [self onChangeAlpha:_sliderAlpha];
    [self rotateAndScale];
    [self onClickSegment:_mySegment];
}

- (IBAction)onShow:(id)sender {
    _contentView.hidden = !_mySwitch.on;
}

- (IBAction)onChangeAlpha:(id)sender {
    _contentView.alpha = (CGFloat)_sliderAlpha.value;
}

- (IBAction)onChangeRotate:(id)sender {
    [self rotateAndScale];
}

- (IBAction)onChangeScale:(id)sender {
    [self rotateAndScale];
}

-(void)rotateAndScale{
    CGAffineTransform rotateTransform = CGAffineTransformMakeRotation((CGFloat)_sliderRotate.value*(CGFloat)M_PI);
    CGAffineTransform scalaTransform = CGAffineTransformMakeScale((CGFloat)_sliderScale.value, (CGFloat)_sliderScale.value);
    _contentView.transform = CGAffineTransformConcat(rotateTransform, scalaTransform);
}

- (IBAction)onClickSegment:(id)sender {
    switch (_mySegment.selectedSegmentIndex) {
        case 0:
            _contentView.backgroundColor = [UIColor blackColor];
            break;
            
        case 1:
            _contentView.backgroundColor = [UIColor redColor];
            break;
            
        case 2:
            _contentView.backgroundColor = [UIColor yellowColor];
            break;
            
        case 3:
            _contentView.backgroundColor = [UIColor blueColor];
            break;
            
        default:
            break;
    }
}
@end
