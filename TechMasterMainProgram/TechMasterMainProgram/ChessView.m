//
//  ChessView.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/23/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "ChessView.h"

@interface ChessView ()
//@property(strong, nonatomic) IBOutlet UIView *containerView;
@end

@implementation ChessView{
    CGFloat _margin;
    CGFloat _h0;
    UIView *_containerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _margin = 10.0;
    _h0 = 160.0;
    
    self.view.backgroundColor = [UIColor grayColor];
    
    [self drawChessTable];
    [self drawSlider];
}

-(void)drawSlider{
    UISlider *slider = [UISlider new];
    slider.frame = CGRectMake(20, self.view.bounds.size.height-100, self.view.bounds.size.width-40, 10);
    slider.minimumValue = -1;
    slider.maximumValue = 1;
    slider.value = 0;
    
    [slider addTarget:self action:@selector(onRotate:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}

-(void)onRotate:(UISlider *)sender{
    _containerView.transform = CGAffineTransformMakeRotation((CGFloat)sender.value * (CGFloat)M_PI);
}

-(void)drawChessTable{
    _containerView = [UIView new];
    
    CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width - _margin * 2.0, self.view.bounds.size.width - _margin * 2.0);
    [_containerView setFrame:frame];

//    NSLog(@"x: %f, y: %f, h: %f, w: %f",_containerView.frame.origin.x, _containerView.frame.origin.y, _containerView.frame.size.height, _containerView.frame.size.width);
//    NSLog(@"x: %f, y: %f, h: %f, w: %f",_containerView.frame.origin.x, _containerView.frame.origin.y, self.view.bounds.size.width - _margin * 2.0, self.view.bounds.size.width - _margin * 2.0);
    
    _containerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_containerView];
    _containerView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    
    CGFloat cellWidth = (self.view.bounds.size.width - _margin * 2.0)/8.0;
    for (int rowIndex = 0; rowIndex < 8; rowIndex++) {
        for (int colIndex = 0; colIndex < 8; colIndex++) {
            CGRect rect = CGRectMake(colIndex * cellWidth, rowIndex *cellWidth, cellWidth, cellWidth);
            UIView *cell = [UIView new];
            cell.frame = rect;
            if (rowIndex%2 == 0) {
                cell.backgroundColor = (colIndex%2 == 0)?[UIColor blackColor]:[UIColor whiteColor];
            }
            else{
                cell.backgroundColor = (colIndex%2 == 0)?[UIColor whiteColor]:[UIColor blackColor];
            }
            [_containerView addSubview:cell];
        }
    }
}

@end
