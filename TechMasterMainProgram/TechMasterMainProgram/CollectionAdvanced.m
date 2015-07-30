//
//  CollectionAdvanced.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/25/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "CollectionAdvanced.h"

@interface CollectionAdvanced ()
@property (strong, nonatomic) IBOutlet UIImageView *imgv_sanbong;
@property (strong, nonatomic) IBOutlet UIImageView *player11;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seg_setTeam;

@end

@implementation CollectionAdvanced

- (void)viewDidLoad {
    [super viewDidLoad];
    [self drawStadium];
    [self drawPositionPlayer];
}

- (void)drawStadium
{
    //set background
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"messi.png"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    
    //set stadium
    CATransform3D t = CATransform3DIdentity;
    t.m34 = -0.005;
    t = CATransform3DRotate( t, M_PI / 3.0, 1.0, 0.0, 0.0 );
    self.imgv_sanbong.layer.transform = t;
}

- (void)drawPositionPlayer
{
    _player11.alpha = 1.0;
}

- (IBAction)onChangeSegment:(id)sender {
    
}

@end
