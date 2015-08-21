//
//  SecondApp.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/18/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "SecondApp.h"

@interface SecondApp ()

@end

@implementation SecondApp
{
    UIButton *button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initButton];
}

//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//    // Override point for customization after application launch.
//    
//    self.window.rootViewController = self.viewController;
//    [self.window makeKeyAndVisible];
//    
//    //Display error is there is no URL
//    if (![launchOptions objectForKey:UIApplicationLaunchOptionsURLKey]) {
//        UIAlertView *alertView;
//        alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"This app was launched without any text. Open this app using the Sender app to send text." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [alertView show];
//    }
//    
//    return YES;
//}

-(void)initButton
{
    button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width/2, 40)];
    button.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    [button setTitle:@"Open First App" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor greenColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(onClickButton) forControlEvents:UIControlEventTouchUpInside];
}

-(void)onClickButton
{
    NSString *customURL = @"TCBSApp://";
    
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:customURL]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"URL error"
                                                        message:[NSString stringWithFormat:@"No custom URL defined for %@", customURL]
                                                       delegate:self cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
    }

}

@end
