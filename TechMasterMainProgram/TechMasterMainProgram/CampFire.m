//
//  CampFire.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/23/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "CampFire.h"

@interface CampFire ()

@end

@implementation CampFire
{
    UIImageView* fire;
}

- (void)loadView{
    [super loadView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self burnFire];
}

- (void) burnFire{
    fire = [[UIImageView alloc] initWithFrame:self.view.bounds];
    NSMutableArray *images = [[NSMutableArray alloc] initWithCapacity:17];
    for (int i = 0; i < 18; i++) {
        NSString *fileName;
        if (i<10)
            fileName = [NSString stringWithFormat:@"campFire0%d.gif",i];
        else
            fileName = [NSString stringWithFormat:@"campFire%d.gif",i];
        if([UIImage imageNamed:fileName] != nil)
            [images addObject:[UIImage imageNamed:fileName]];
    }
    fire.animationImages = images;
    fire.animationDuration = 1;
    fire.animationRepeatCount = 0;
    [self.view addSubview:fire];
    [fire startAnimating];
}

@end
