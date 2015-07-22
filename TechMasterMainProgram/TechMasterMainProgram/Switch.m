//
//  Switch.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/22/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "Switch.h"

@interface Switch ()
@property (strong, nonatomic) IBOutlet UIImageView *light;
@property (strong, nonatomic) IBOutlet UIButton *bWLeft;
@property (strong, nonatomic) IBOutlet UIButton *bWRight;

@property (strong, nonatomic) IBOutlet UIButton *bBLetf;
@property (strong, nonatomic) IBOutlet UIButton *bBRight;

@property (strong, nonatomic) IBOutlet UIImage *imageLight;
@end

@implementation Switch
{
    BOOL _isOn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _isOn = true;
}
- (IBAction)onClickbWLeft:(id)sender {
    if (_isOn == false) {
        UIImage *imageButtonLeft = [UIImage imageNamed:@"OnWhiteLeft"];
        UIImage *imageButtonRight = [UIImage imageNamed:@"OffWhiteRight"];
        _imageLight = [UIImage imageNamed:@"lighton.jpg"];
        [_bWLeft setImage:imageButtonLeft forState:UIControlStateNormal];
        [_bWRight setImage:imageButtonRight forState:UIControlStateNormal];
        [_light setImage:_imageLight];
        _isOn = true;
        CGRect frame = _bWRight.frame;
        frame.size.height = frame.size.height + 1;
        _bWRight.frame = frame;
        CGRect frame2 = _bWLeft.frame;
        frame2.size.height = frame.size.height - 1;
        _bWLeft.frame = frame2;
        self.view.backgroundColor = [UIColor yellowColor];
    }
}
- (IBAction)onClickbWRight:(id)sender {
    if (_isOn == true) {
        UIImage *imageButtonRight = [UIImage imageNamed:@"OnWhiteRight"];
        UIImage *imageButtonLeft = [UIImage imageNamed:@"OffWhiteLeft"];
        _imageLight = [UIImage imageNamed:@"lightoff.jpg"];
        [_bWLeft setImage:imageButtonLeft forState:UIControlStateNormal];
        [_bWRight setImage:imageButtonRight forState:UIControlStateNormal];
        [_light setImage:_imageLight];
        _isOn = false;
        CGRect frame = _bWRight.frame;
        frame.size.height = frame.size.height - 1;
        _bWRight.frame = frame;
        CGRect frame2 = _bWLeft.frame;
        frame2.size.height = frame.size.height + 1;
        _bWLeft.frame = frame2;
        self.view.backgroundColor = [UIColor whiteColor];
    }
}
- (IBAction)onClickbBLeft:(id)sender {
    if (_isOn == false) {
        UIImage *imageButtonLeft = [UIImage imageNamed:@"OnBlackLeft"];
        UIImage *imageButtonRight = [UIImage imageNamed:@"OffBlackRight"];
        _imageLight = [UIImage imageNamed:@"lighton.jpg"];
        [_bBLetf setImage:imageButtonLeft forState:UIControlStateNormal];
        [_bBRight setImage:imageButtonRight forState:UIControlStateNormal];
        [_light setImage:_imageLight];
        _isOn = true;
        self.view.backgroundColor = [UIColor yellowColor];
    }
}
- (IBAction)onCLickbBRight:(id)sender {
    if (_isOn == true) {
        UIImage *imageButtonRight = [UIImage imageNamed:@"OnBlackRight"];
        UIImage *imageButtonLeft = [UIImage imageNamed:@"OffBlackLeft"];
        _imageLight = [UIImage imageNamed:@"lightoff.jpg"];
        [_bBLetf setImage:imageButtonLeft forState:UIControlStateNormal];
        [_bBRight setImage:imageButtonRight forState:UIControlStateNormal];
        [_light setImage:_imageLight];
        _isOn = false;
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

@end
