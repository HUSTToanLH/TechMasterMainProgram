//
//  SliderAdvanced.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/21/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "SliderAdvanced.h"

@interface SliderAdvanced ()
@property(strong, nonatomic) IBOutlet UIView *root;
@end

@implementation SliderAdvanced

- (void)viewDidLoad {
    [super viewDidLoad];
//    _root = [[[NSBundle mainBundle] loadNibNamed:@"SliderAdvanced" owner:self options:nil ] objectAtIndex:0];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.backBarButtonItem = backButton;
}

- (IBAction)onClickScreen1:(id)sender {
//    UIView *vScreen1 = [[[NSBundle mainBundle] loadNibNamed:@"SliderBasic" owner:self options:nil] lastObject];
//    [_root addSubview:vScreen1];
//    [self.view addSubview:_root];
    [self pushScreen:@"SliderBasic"];
}

- (IBAction)onClickScreen2:(id)sender {
    
}

- (IBAction)onClickScreen3:(id)sender {
    
}

-(void)pushScreen:(NSString *)xibName{
    UIViewController* detailScreen;
    if([[NSBundle mainBundle] pathForResource:xibName ofType:@"nib"] != nil)
    {
        //If the xib file exists
        detailScreen = [(UIViewController*)[NSClassFromString(xibName) alloc] initWithNibName:xibName bundle:nil];
    } else {
        //If the xib file does not exist
        detailScreen = [NSClassFromString(xibName) new];
    }
    detailScreen.title = xibName;
    
    if (detailScreen) {
        [self.navigationController pushViewController:detailScreen animated:YES];
    } else {
        //Warn if cannot initialize detailScreen
        NSString* message = [NSString stringWithFormat:@"Please implement screen %@", xibName];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
}

@end
