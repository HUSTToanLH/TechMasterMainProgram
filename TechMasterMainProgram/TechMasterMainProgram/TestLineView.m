//
//  TestLineView.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/10/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "TestLineView.h"

@interface TestLineView ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *mainView;

@end

@implementation TestLineView
{
    UIView* line1;
    UICollectionView* collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLineView];
    self.scrollView.maximumZoomScale = 1.5;
    self.scrollView.minimumZoomScale = 0.5;
    _scrollView.panGestureRecognizer.enabled = NO;
    self.automaticallyAdjustsScrollViewInsets =NO;
}

-(void)initLineView
{
    _scrollView.contentSize = CGSizeMake(_mainView.frame.size.width, 1000);
    
    _scrollView.maximumZoomScale = 4.0;
    _scrollView.minimumZoomScale = 1.0;
    _scrollView.zoomScale = 1.0;
    [_scrollView setContentMode:UIViewContentModeScaleAspectFit];
    [_scrollView sizeToFit];

    line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 1)];
    line1.backgroundColor = [UIColor whiteColor];
    [_mainView addSubview:line1];
    
    UIView* line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 2)];
    line2.backgroundColor = [UIColor whiteColor];
    [_mainView addSubview:line2];
    
    UIView* line3 = [[UIView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 3)];
    line3.backgroundColor = [UIColor whiteColor];
    [_mainView addSubview:line3];
    
    UIView* line4 = [[UIView alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 4)];
    line4.backgroundColor = [UIColor whiteColor];
    [_mainView addSubview:line4];
    
    UIView* line5 = [[UIView alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 5)];
    line5.backgroundColor = [UIColor whiteColor];
    [_mainView addSubview:line5];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"height: %f", line1.frame.size.height);
    NSLog(@"contentOffset y: %f", scrollView.contentOffset.y);
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.mainView;
}

@end


@implementation CustomScrollview

- (void)setTransformWithoutScaling:(CGAffineTransform)newTransform;
{
    if (((int)(self.contentOffset.x*10)%2) == 0) {
        [super setTransform:newTransform];
        NSLog(@"redraw");
    } else {
        
        NSLog(@"not redraw");
    }
}

@end