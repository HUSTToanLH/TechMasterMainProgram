//
//  PinchAndRotate.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 9/11/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "PinchAndRotate.h"
#import "UIColor+Extend.h"

@interface PinchAndRotate ()

@end

@implementation PinchAndRotate
{
    UIImageView *pretty;
    UIPinchGestureRecognizer *pinch;
    UIRotationGestureRecognizer *rotate;
//    UITabBarController *tabbar;
    CGFloat height, width, margin, buttonWidth;
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
    buttonWidth = (width - 6*margin)/7;
    
    [self initImage];
    [self initButtonBar];
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
    UIView *tabbar = [[UIView alloc] initWithFrame:CGRectMake(0, height - 40, self.view.bounds.size.width, 40)];
    tabbar.backgroundColor = [UIColor redColor];
    [self.view addSubview:tabbar];
    
    UIButton *buttonOne = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, buttonWidth, 40)];
    buttonOne.backgroundColor = [[UIColor alloc] initColorHex:@"#7dab4f" alpha:1];
    [buttonOne addTarget:self action:@selector(onClickButtonOne) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonTwo = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth + margin, 0, buttonWidth, 40)];
    buttonTwo.backgroundColor = [[UIColor alloc] initColorHex:@"#7dab4f" alpha:1];
    [buttonTwo addTarget:self action:@selector(onClickButtonTwo) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonThree = [[UIButton alloc] initWithFrame:CGRectMake((buttonWidth + margin)*2, 0, buttonWidth, 40)];
    buttonThree.backgroundColor = [[UIColor alloc] initColorHex:@"#7dab4f" alpha:1];
    [buttonThree addTarget:self action:@selector(onClickButtonThree) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonFour = [[UIButton alloc] initWithFrame:CGRectMake((buttonWidth + margin)*3, 0, buttonWidth, 40)];
    buttonFour.backgroundColor = [[UIColor alloc] initColorHex:@"#7dab4f" alpha:1];
    [buttonFour addTarget:self action:@selector(onClickButtonFour) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonFive = [[UIButton alloc] initWithFrame:CGRectMake((buttonWidth + margin)*4, 0, buttonWidth, 40)];
    buttonFive.backgroundColor = [[UIColor alloc] initColorHex:@"#7dab4f" alpha:1];
    [buttonFive addTarget:self action:@selector(onClickButtonFive) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonSix = [[UIButton alloc] initWithFrame:CGRectMake((buttonWidth + margin)*5, 0, buttonWidth, 40)];
    buttonSix.backgroundColor = [[UIColor alloc] initColorHex:@"#7dab4f" alpha:1];
    [buttonSix addTarget:self action:@selector(onClickButtonSix) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *buttonSeven = [[UIButton alloc] initWithFrame:CGRectMake((buttonWidth + margin)*6, 0, buttonWidth, 40)];
    buttonSeven.backgroundColor = [[UIColor alloc] initColorHex:@"#7dab4f" alpha:1];
    [buttonSeven addTarget:self action:@selector(onClickButtonSeven) forControlEvents:UIControlEventTouchUpInside];
    
    [tabbar addSubview:buttonOne];
    [tabbar addSubview:buttonTwo];
    [tabbar addSubview:buttonThree];
    [tabbar addSubview:buttonFour];
    [tabbar addSubview:buttonFive];
    [tabbar addSubview:buttonSix];
    [tabbar addSubview:buttonSeven];
}

-(void)onClickButtonOne{
    NSLog(@"onClickButtonOne");
}

-(void)onClickButtonTwo{
    NSLog(@"onClickButtonTwo");
}

-(void)onClickButtonThree{
    NSLog(@"onClickButtonThree");
}

-(void)onClickButtonFour{
    NSLog(@"onClickButtonFour");
}

-(void)onClickButtonFive{
    NSLog(@"onClickButtonFive");
}

-(void)onClickButtonSix{
    NSLog(@"onClickButtonSix");
}

-(void)onClickButtonSeven{
    NSLog(@"onClickButtonSeven");
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
}

@end
