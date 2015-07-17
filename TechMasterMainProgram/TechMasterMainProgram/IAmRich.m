//
//  IAmRich.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/16/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "IAmRich.h"

@interface IAmRich ()

@property (strong, nonatomic) IBOutlet UIImageView *ruby;
@property (strong, nonatomic) IBOutlet UILabel *text;
@end

@implementation IAmRich

- (void)viewDidLoad {
    [super viewDidLoad];
    _ruby.alpha = 0;
    _text.alpha = 0;
    [self running];
}

- (void)running
{
    [UIView animateWithDuration:4 animations:^{
        _ruby.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3 animations:^{
            _text.center = CGPointMake(_ruby.center.x, _ruby.center.y+_ruby.bounds.size.height/2 +20);
            _text.alpha = 1;

        } completion:nil];
    }];
}

@end
