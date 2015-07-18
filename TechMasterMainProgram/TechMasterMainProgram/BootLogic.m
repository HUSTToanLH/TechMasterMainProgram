//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* array = @{SECTION: @"Array", MENU:@[
                                    @{TITLE: @"Collection", CLASS: @"Collection"},
                                    @{TITLE: @"ArrayCategory", CLASS: @"ArrayCategory"}
                                    ]};
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"IAmRich", CLASS: @"IAmRich"},
                                    @{TITLE: @"IWeather", CLASS: @"IWeather"},
                                    @{TITLE: @"RunningLED", CLASS: @"RunningLED"},
                                    @{TITLE: @"ZigZag", CLASS: @"ZigZag"},
                                    @{TITLE: @"UISlider", CLASS: @"Slider"}
                          ]};
    NSDictionary* intermediate = @{SECTION: @"Intermediate", MENU: @[
                                    @{TITLE: @"Inter A", CLASS: @"InterB"},
                                    @{TITLE: @"Inter B", CLASS: @"InterB"}
                                  ]};
    NSDictionary* advanced = @{SECTION: @"Advanced", MENU: @[
                                    @{TITLE: @"Advanced C", CLASS: @"AdvancedC"}
                             ]};
    
    mainScreen.menu = @[array, basic, intermediate, advanced];
    mainScreen.title = @"FSS_ToanLH";
    mainScreen.about = @"This is code from TechMaster.vn";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    window.rootViewController = nav;
}
@end
