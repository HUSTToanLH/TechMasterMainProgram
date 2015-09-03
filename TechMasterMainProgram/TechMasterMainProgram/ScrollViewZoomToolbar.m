//
//  ScrollViewZoomToolbar.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 9/3/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "ScrollViewZoomToolbar.h"

@interface ScrollViewZoomToolbar ()<UIScrollViewDelegate>
@property(nonatomic, strong) IBOutlet UIScrollView *scrollView;
@end


@implementation ScrollViewZoomToolbar
{
    UIImageView *imageView;
    UILabel *rightLabel;
    UIToolbar *toolBar;
    UISlider *slider;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initToolBarAndSlider];
    [self initScrollViewAndImage];
    [self initRightLabelNavi];
}

-(void)initScrollViewAndImage
{
    CGRect frame = CGRectMake(0,toolBar.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height - toolBar.frame.size.height - self.navigationController.navigationBar.bounds.size.height);
    _scrollView = [[UIScrollView alloc] initWithFrame:frame];
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

-(void)initToolBarAndSlider
{
    toolBar = [UIToolbar new];
    [toolBar sizeToFit];
    
    slider = [[UISlider alloc] initWithFrame:CGRectMake(8, 0, self.view.bounds.size.width - 16, 40)];
    slider.maximumValue = 5;
    slider.value = slider.minimumValue;
    [slider addTarget:self
               action:@selector(onChangeSlider:)
     forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:slider];
    toolBar.items = @[barButton];
    toolBar.frame = CGRectMake(0, 0, toolBar.bounds.size.width, toolBar.bounds.size.height);
    NSLog(@"bound: %f",toolBar.bounds.size.height);
    NSLog(@"frame: %f",toolBar.frame.size.height);
    [self.view addSubview:toolBar];
}

-(void)onChangeSlider:(UISlider *)mySlider
{
    [_scrollView setZoomScale:mySlider.value];
}


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageView;
}

-(void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    //    NSLog(@"%2.2f", _scrollView.zoomScale);
    rightLabel.text = [NSString stringWithFormat:@"%d%%",(int)(_scrollView.zoomScale*100)];
    slider.value = _scrollView.zoomScale;
}

@end
