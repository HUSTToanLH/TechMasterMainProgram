//
//  TestLineView2.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/10/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "TestLineView2.h"

@interface TestLineView2 ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation TestLineView2

- (void)viewDidLoad {
    [super viewDidLoad];
     _collectionView.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 1)];
    line1.backgroundColor = [UIColor whiteColor];
    [_collectionView addSubview:line1];
    
    UIView* line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 2)];
    line2.backgroundColor = [UIColor whiteColor];
    [_collectionView addSubview:line2];
    
    UIView* line3 = [[UIView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 3)];
    line3.backgroundColor = [UIColor whiteColor];
    [_collectionView addSubview:line3];
    
    UIView* line4 = [[UIView alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 4)];
    line4.backgroundColor = [UIColor whiteColor];
    [_collectionView addSubview:line4];
    
    UIView* line5 = [[UIView alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 5)];
    line5.backgroundColor = [UIColor whiteColor];
    [_collectionView addSubview:line5];
    
    [_collectionView bringSubviewToFront:line1];
    [_collectionView setContentInset:UIEdgeInsetsMake(line1.frame.size.height, 0, 0, 0)];
    [_collectionView bringSubviewToFront:line2];
    [_collectionView setContentInset:UIEdgeInsetsMake(line1.frame.size.height, 0, 0, 0)];
    [_collectionView bringSubviewToFront:line3];
    [_collectionView setContentInset:UIEdgeInsetsMake(line1.frame.size.height, 0, 0, 0)];
    [_collectionView bringSubviewToFront:line4];
    [_collectionView setContentInset:UIEdgeInsetsMake(line1.frame.size.height, 0, 0, 0)];
    [_collectionView bringSubviewToFront:line5];
    [_collectionView setContentInset:UIEdgeInsetsMake(line1.frame.size.height, 0, 0, 0)];
}

@end
