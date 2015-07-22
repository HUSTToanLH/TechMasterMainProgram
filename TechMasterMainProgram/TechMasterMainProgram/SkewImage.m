//
//  SkewImage.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/22/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "SkewImage.h"

@interface SkewImage ()
@property (strong, nonatomic) IBOutlet UIImageView *imageSkew;
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UIButton *button;

@end

@implementation SkewImage
{
    int i;
    BOOL _isAuto;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    i = 0;
    _isAuto = false;
//    [_imageSkew setImage:[UIImage imageNamed:@"heart.jpg"]];
    [_imageSkew setImage:[UIImage imageNamed:@"footBall.jpeg"]];
}

- (IBAction)onChangeValueSlider:(id)sender {
    if (!_isAuto) {
        CATransform3D t = CATransform3DIdentity;
        t.m34 = -0.005;
        NSLog(@"pi = %f",M_PI/(180/_slider.value));
        t = CATransform3DRotate(t, M_PI*_slider.value/360, 0.0, 1.0, 0.0);
        self.imageSkew.layer.transform = t;
    }
}

- (IBAction)onCLickAutoButton:(id)sender {
    if (_isAuto) {
        _isAuto = false;
        i = -1;
        _slider.hidden = false;
        _button.backgroundColor = [UIColor lightGrayColor];
    }
    else{
        _isAuto = true;
        _button.backgroundColor = [UIColor greenColor];
        i = 0;
        _slider.hidden = true;
        [self rotateBallAfterSecond:1 withLoop:10000];
    }
}

- (void)rotateBallAfterSecond:(int)time withLoop:(int) circle{
    if (i>=0) {
        [UIView animateWithDuration:time animations:^{
            
            //        CATransform3D rotatedTransform = _imageSkew.layer.transform;
            //        rotatedTransform = CATransform3DRotate(rotatedTransform, 30 * M_PI / 180.0, 0.0f, 1.0f, 0.0f);//xoay ngang//(rotatedTransform, 30 * M_PI / 180.0, 0.0f, 0.0f, 1.0f) - xoay doc
            //        _imageSkew.layer.transform = rotatedTransform;
            //
            //        CATransform3D rotatedTransform2 = _imageSkew.layer.transform;
            //        rotatedTransform2 = CATransform3DRotate(rotatedTransform2, -30 * M_PI / 180.0, 0.0f, 1.0f, 0.0f);
            //        _imageSkew.layer.transform = rotatedTransform2;
            
            //ball
            
            i++;
            float degree = 6.0*pow(-1, i);
            
            CATransform3D t = CATransform3DIdentity;
            t.m34 = -0.005;
            t = CATransform3DRotate(t, M_PI / degree, 0.0, 1.0, 0.0);
            self.imageSkew.layer.transform = t;
            
        } completion:^(BOOL finished) {
            [self rotateBallAfterSecond:time withLoop:circle-1];
        }];
    }

}

@end
