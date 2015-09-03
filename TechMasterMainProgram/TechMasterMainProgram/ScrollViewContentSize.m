//
//  ScrollViewContentSize.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 9/3/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "ScrollViewContentSize.h"

@interface ScrollViewContentSize ()<UIScrollViewDelegate>
@property(nonatomic, strong) IBOutlet UIScrollView *scrollView;
@end

@implementation ScrollViewContentSize
{
    UIImageView *imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self initScrollViewAndImage];
}

-(void)initScrollViewAndImage
{
    UIImage *image = [UIImage imageNamed:@"banner.png"];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(8, 8, self.view.bounds.size.width - 16, 300)];
    _scrollView.backgroundColor = [UIColor lightGrayColor];
    _scrollView.contentSize = CGSizeMake(image.size.width, image.size.height);
    
    //true: nảy lại khi đến cuối view, false: dừng lại ngay tại điểm cuối
    _scrollView.bounces = true;
    
    //hiển thị thanh báo cuộn dọc or ngang
    _scrollView.showsHorizontalScrollIndicator = YES;
    _scrollView.showsVerticalScrollIndicator = YES;
    
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    [_scrollView addSubview:imageView];
    
    [self.view addSubview:_scrollView];
}

@end
