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
    NSDictionary* codeCamp = @{SECTION: @"CodeCamp", MENU:@[
                                        @{TITLE: @"CoGaiHaLan", CLASS: @"CoGaiHaLan"}
                                        ]};

    NSDictionary* demoSwift = @{SECTION: @"DemoSwift", MENU:@[
                                      @{TITLE: @"ChessView", CLASS: @"ChessView"},
                                      @{TITLE: @"BasicView", CLASS: @"BasicView"}
                                      ]};
    NSDictionary* example = @{SECTION: @"Example", MENU:@[
                                      @{TITLE: @"DemoSelector", CLASS: @"DemoSelector"},
                                      @{TITLE: @"Switch", CLASS: @"Switch"},
                                      @{TITLE: @"SkewImage", CLASS: @"SkewImage"},
                                      @{TITLE: @"SliderAdvanced", CLASS: @"SliderAdvanced"}
                                    ]};

    NSDictionary* array = @{SECTION: @"Array", MENU:@[
                                    @{TITLE: @"Collection", CLASS: @"Collection"},
                                    @{TITLE: @"ArrayCategory", CLASS: @"ArrayCategory"},
                                    @{TITLE: @"CollectionAdvanced", CLASS: @"CollectionAdvanced"},
                                    @{TITLE: @"ArrayCollection", CLASS: @"ArrayCollection"},
                                    @{TITLE: @"QuickSort", CLASS: @"QuickSort"}
                                    
                                    ]};
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"IAmRich-OK", CLASS: @"IAmRich"},
                                    @{TITLE: @"IWeather-OK", CLASS: @"IWeather"},
                                    @{TITLE: @"RunningLED-Advanced", CLASS: @"RunningLED"},
                                    @{TITLE: @"ZigZag-OK", CLASS: @"ZigZag"},
                                    @{TITLE: @"UISlider-OK", CLASS: @"Slider"}
                          ]};
    NSDictionary* cartoon = @{SECTION: @"Cartoon", MENU: @[
                                    @{TITLE: @"CampFire", CLASS: @"CampFire"},
                                    @{TITLE: @"NestedSquare", CLASS: @"NestedSquare"},
                                    @{TITLE: @"FlyingBird", CLASS: @"FlyingBird"},
                                    @{TITLE: @"DemoPlanet", CLASS: @"DemoPlanet"}
                                  ]};
    NSDictionary* advanced = @{SECTION: @"Advanced", MENU: @[
                                    @{TITLE: @"Advanced C", CLASS: @"AdvancedC"}
                             ]};
    
    mainScreen.menu = @[codeCamp, demoSwift, example, array, basic, cartoon, advanced];
    mainScreen.title = @"FSS_ToanLH";
    mainScreen.about = @"This is code from TechMaster.vn";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    window.rootViewController = nav;
}
@end
