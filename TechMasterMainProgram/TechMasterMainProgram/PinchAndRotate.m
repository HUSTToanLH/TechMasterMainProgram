//
//  PinchAndRotate.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 9/11/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "PinchAndRotate.h"
#import "UIColor+Extend.h"

@interface PinchAndRotate ()<UIGestureRecognizerDelegate>

@end

@implementation PinchAndRotate
{
    UIImageView *pretty;
    UIPinchGestureRecognizer *pinch;
    UIRotationGestureRecognizer *rotate;
//    UITabBarController *tabbar;
    CGFloat height, width, margin, buttonWidth;
    BOOL shouldRecognizeSimultaneouslyWithGestureRecognizer;
    BOOL shouldRequireFailureOfGestureRecognizer;
    BOOL shouldBeRequiredToFailByGestureRecognizer;
    
    UIButton *buttonOne, *buttonTwo, *buttonThree, *buttonFour, *buttonFive, *buttonSix, *buttonSeven;
    int activeNumber;
    BOOL pinchGes;
    UIView *tabbar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat navigationHeight = self.navigationController.navigationBar.bounds.size.height;
    height = self.view.bounds.size.height - statusBarHeight - navigationHeight;
    width = self.view.bounds.size.width;
    margin = 2;
    buttonWidth = (width - 4*margin)/5;
    pinchGes = YES;
    
    [self initImage];
    [self initButtonBar];
    [self setActiveNumber:0];
}

-(void)initImage
{
    UIImage *image = [UIImage imageNamed:@"pretty.jpg"];
    pretty = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, self.view.bounds.size.width - 10, (self.view.bounds.size.width - 10)*(image.size.height/image.size.width))];
    pretty.image = image;
    pretty.userInteractionEnabled = YES;
    pretty.multipleTouchEnabled = YES;
    [self.view addSubview:pretty];
    
    pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchImage:)];
    [pretty addGestureRecognizer:pinch];
    
    rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateImage:)];
    [pretty addGestureRecognizer:rotate];
}

-(void)initButtonBar{
    tabbar = [[UIView alloc] initWithFrame:CGRectMake(0, height - 40, self.view.bounds.size.width, 40)];
    tabbar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tabbar];
    
    buttonOne = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, 40)];
    buttonOne.tag = 1;
    [buttonOne setTitle:@"dft" forState:UIControlStateNormal];
    [buttonOne addTarget:self action:@selector(onClickButtonOne) forControlEvents:UIControlEventTouchUpInside];
    
    buttonTwo = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth + margin, 0, buttonWidth, 40)];
    buttonTwo.tag = 2;
    [buttonTwo setTitle:@"s Pi" forState:UIControlStateNormal];
    [buttonTwo addTarget:self action:@selector(onClickButtonTwo) forControlEvents:UIControlEventTouchUpInside];
    
    buttonFour = [[UIButton alloc] initWithFrame:CGRectMake((buttonWidth + margin)*2, 0, buttonWidth, 40)];
    buttonFour.tag = 4;
    [buttonFour setTitle:@"r1 Pi" forState:UIControlStateNormal];
    [buttonFour addTarget:self action:@selector(onClickButtonFour) forControlEvents:UIControlEventTouchUpInside];
    
    buttonFive = [[UIButton alloc] initWithFrame:CGRectMake((buttonWidth + margin)*3, 0, buttonWidth, 40)];
    buttonFive.tag = 5;
    [buttonFive setTitle:@"r Ro" forState:UIControlStateNormal];
    [buttonFive addTarget:self action:@selector(onClickButtonFive) forControlEvents:UIControlEventTouchUpInside];
    
    buttonSix = [[UIButton alloc] initWithFrame:CGRectMake((buttonWidth + margin)*4, 0, buttonWidth, 40)];
    buttonSix.tag = 6;
    [buttonSix setTitle:@"bR Ro" forState:UIControlStateNormal];
    [buttonSix addTarget:self action:@selector(onClickButtonSix) forControlEvents:UIControlEventTouchUpInside];
    
    [tabbar addSubview:buttonOne];
    [tabbar addSubview:buttonTwo];
    [tabbar addSubview:buttonFour];
    [tabbar addSubview:buttonFive];
    [tabbar addSubview:buttonSix];
}

-(void)onClickButtonOne{
    [self setActiveNumber:1];
    NSLog(@"onClickButtonOne");
}

-(void)onClickButtonTwo{
    [self setActiveNumber:2];
    if (shouldRecognizeSimultaneouslyWithGestureRecognizer == true) {
        shouldRecognizeSimultaneouslyWithGestureRecognizer =  false;
        [buttonTwo setTitle:@"s Pi" forState:UIControlStateNormal];
    }
    else{
        shouldRecognizeSimultaneouslyWithGestureRecognizer = true;
        [buttonTwo setTitle:@"s Ro" forState:UIControlStateNormal];
    }

    NSLog(@"onClickButtonTwo");
}

-(void)onClickButtonFour{
    [self setActiveNumber:4];
    if (pinchGes == YES) {
        [pinch requireGestureRecognizerToFail:rotate];
        [buttonFour setTitle:@"r1 Ro" forState:UIControlStateNormal];
        pinchGes = NO;
    }else{
        [rotate requireGestureRecognizerToFail:pinch];
        [buttonFour setTitle:@"r1 Pi" forState:UIControlStateNormal];
        pinchGes = YES;
    }
    
    NSLog(@"onClickButtonFour");
}

-(void)onClickButtonFive{
    [self setActiveNumber:5];
    if (shouldRequireFailureOfGestureRecognizer == true) {
        shouldRequireFailureOfGestureRecognizer =  false;
        [buttonFive setTitle:@"r Pi" forState:UIControlStateNormal];
    }
    else{
        shouldRequireFailureOfGestureRecognizer = true;
        [buttonFive setTitle:@"r Ro" forState:UIControlStateNormal];
    }
    NSLog(@"onClickButtonFive");
}

-(void)onClickButtonSix{
    [self setActiveNumber:6];
    if (shouldBeRequiredToFailByGestureRecognizer == true) {
        shouldBeRequiredToFailByGestureRecognizer =  false;
        [buttonSix setTitle:@"bR Pi" forState:UIControlStateNormal];
    }
    else{
        shouldBeRequiredToFailByGestureRecognizer = true;
        [buttonSix setTitle:@"bR Ro" forState:UIControlStateNormal];
    }
    NSLog(@"onClickButtonSix");
}

-(void)pinchImage:(UIPinchGestureRecognizer*)gesture{
    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
        [self adjustAnchorPoint:gesture];
        [self pinch:gesture.scale];
    }
}

-(void)adjustAnchorPoint:(UIGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        UIView *view = gesture.view;
        CGPoint locationInView = [gesture locationInView:view];
        CGPoint locationInSuperView = [gesture locationInView:view.superview];
        
        view.layer.anchorPoint = CGPointMake(locationInView.x/view.bounds.size.width, locationInView.y/view.bounds.size.height);
        view.center = locationInSuperView;
    }
}

-(void)pinch:(CGFloat)scale{
//    pretty.transform = CGAffineTransformMakeScale(scale, scale);
    CGAffineTransform t = pretty.transform;
    t = CGAffineTransformMakeScale(scale, scale);
    pretty.transform = t;
    NSLog(@"Pinch");
}

-(void)rotateImage:(UIRotationGestureRecognizer*)gesture{
    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) {
        [self rotate:gesture.rotation];
    }
}

-(void)rotate:(CGFloat)rotation
{
    CATransform3D t = pretty.layer.transform;
    t.m34 = -0.005;
    t = CATransform3DRotate(t, rotation, 0.0, 0.0, 1.0);
    pretty.layer.transform = t;
    NSLog(@"Rotate");
}

//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
//    return shouldRecognizeSimultaneouslyWithGestureRecognizer;
//}

//-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
//    if ([gestureRecognizer isMemberOfClass:[UIPinchGestureRecognizer class]] && [otherGestureRecognizer isKindOfClass:[UIRotationGestureRecognizer class]]) {
//        return shouldRequireFailureOfGestureRecognizer;
//    }
//    else{
//        return !shouldRequireFailureOfGestureRecognizer;
//    }
//}

-(void)setActiveNumber:(int)number{
    activeNumber = number;
    for (UIButton *btn in [tabbar subviews]) {
        if (btn.tag == activeNumber) {
            btn.backgroundColor = [UIColor greenColor];
        }
        else{
            btn.backgroundColor = [UIColor grayColor];
        }
    }
}

@end
