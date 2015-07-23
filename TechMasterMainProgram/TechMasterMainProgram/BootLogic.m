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
    NSDictionary* demoSwift = @{SECTION: @"DemoSwift", MENU:@[
                                      @{TITLE: @"ChessView", CLASS: @"ChessView"},
                                      @{TITLE: @"BasicView", CLASS: @"BasicView"}
                                      ]};
    NSDictionary* example = @{SECTION: @"Example", MENU:@[
                                      @{TITLE: @"Selector", CLASS: @"DemoSelector"},
                                      @{TITLE: @"Switch", CLASS: @"Switch"},
                                      @{TITLE: @"SkewImage", CLASS: @"SkewImage"},
                                      @{TITLE: @"SliderAdvanced", CLASS: @"SliderAdvanced"}
                                    ]};

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
    NSDictionary* cartoon = @{SECTION: @"Cartoon", MENU: @[
                                    @{TITLE: @"CampFire", CLASS: @"CampFire"},
                                    @{TITLE: @"NestedSquare", CLASS: @"NestedSquare"}
                                  ]};
    NSDictionary* advanced = @{SECTION: @"Advanced", MENU: @[
                                    @{TITLE: @"Advanced C", CLASS: @"AdvancedC"}
                             ]};
    
    mainScreen.menu = @[demoSwift, example, array, basic, cartoon, advanced];
    mainScreen.title = @"FSS_ToanLH";
    mainScreen.about = @"This is code from TechMaster.vn";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    window.rootViewController = nav;
}
@end
