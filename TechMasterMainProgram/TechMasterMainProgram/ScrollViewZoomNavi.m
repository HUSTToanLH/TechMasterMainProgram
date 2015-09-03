//
//  ScrollViewZoomNavi.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 9/3/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "ScrollViewZoomNavi.h"

@interface ScrollViewZoomNavi ()<UIScrollViewDelegate>
@property(nonatomic, strong) IBOutlet UIScrollView *scrollView;
@end

@implementation ScrollViewZoomNavi
{
    UIImageView *imageView;
    UILabel *rightLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self initScrollViewAndImage];
    [self initRightLabelNavi];
}

-(void)initScrollViewAndImage
{
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"girl_scarf.png"]];
    [_scrollView addSubview:imageView];
    _scrollView.minimumZoomScale = 0.01;
    _scrollView.maximumZoomScale = 5;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
}

-(void)initRightLabelNavi
{
    rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 20)];
    rightLabel.backgroundColor = [UIColor clearColor];
    rightLabel.text = @"100%";
    rightLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
    rightLabel.textColor = [UIColor blueColor];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightLabel];
    self.navigationItem.rightBarButtonItem = rightItem;
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(0, 0, 32, 32);
//    [button setTitle:@"right" forState:UIControlStateNormal];
//    
//    UIBarButtonItem *barButton=[[UIBarButtonItem alloc] init];
//    [barButton setCustomView:button];
//    self.navigationItem.rightBarButtonItem=barButton;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
//    NSLog(@"%2.2f", _scrollView.zoomScale);
    rightLabel.text = [NSString stringWithFormat:@"%d%%",(int)(_scrollView.zoomScale*100)];
}

@end
