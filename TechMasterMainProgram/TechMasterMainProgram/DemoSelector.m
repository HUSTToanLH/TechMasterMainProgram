//
//  DemoSelector.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/20/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "DemoSelector.h"

@interface DemoSelector ()
@property (strong, nonatomic) IBOutlet UISlider *slider;

@end

@implementation DemoSelector

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self];
}

- (IBAction)onCruchData:(id)sender {
    [NSThread sleepForTimeInterval:3];
}

@end
