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

//    NSDictionary* iAmIOS = @{SECTION: @"iAmiOS", MENU: @[
//                                    @{TITLE: @"IAmRich-OK", CLASS: @"IAmRich"},
//                                    @{TITLE: @"IWeather-OK", CLASS: @"IWeather"},
//                                    @{TITLE: @"ZigZag-OK", CLASS: @"ZigZag"}
//                                    ]};
    
//    NSDictionary* example = @{SECTION: @"Example", MENU: @[
//                                    @{TITLE: @"PerformSelector", CLASS: @"DemoSelector"}
//                                    ]};
    
    NSDictionary* uiKit = @{SECTION: @"UIKit", MENU: @[
//                                    @{TITLE: @"Slider", CLASS: @"Slider"},
                                    @{TITLE: @"SkewImage", CLASS: @"SkewImage"},
//                                    @{TITLE: @"RunningLED", CLASS: @"RunningLED"},
                                    @{TITLE: @"SliderAdvanced", CLASS: @"SliderAdvanced"},
                                    @{TITLE: @"Switch", CLASS: @"Switch"}
                                    ]};
    
    NSDictionary* array = @{SECTION: @"Array", MENU:@[
//                                    @{TITLE: @"NSArrayTruyVan_1", CLASS: @"NSArrayTruyVan_1"},
//                                    @{TITLE: @"NSArrayTruyVan_2", CLASS: @"NSArrayTruyVan_2"},
//                                    @{TITLE: @"NSArrayFindNumber", CLASS: @"NSArrayFindNumber"},
//                                    @{TITLE: @"QuickSort", CLASS: @"QuickSort"},
//                                    @{TITLE: @"ArrayDictionary", CLASS: @"ArrayDictionary"},
//                                    @{TITLE: @"TestLineView", CLASS: @"TestLineView"},
                                    @{TITLE: @"MutableArray", CLASS: @"MutableArrayCategory"}
                                    ]};
    
//    NSDictionary* uiView = @{SECTION: @"UIView", MENU: @[
//                                    @{TITLE: @"ChessView", CLASS: @"ChessView"},
//                                    @{TITLE: @"BasicView", CLASS: @"BasicView"},
//                                    @{TITLE: @"CampFire", CLASS: @"CampFire"},
//                                    @{TITLE: @"NestedSquare", CLASS: @"NestedSquare"},
//                                    @{TITLE: @"FlyingBird", CLASS: @"FlyingBird"},
//                                     @{TITLE: @"StartField", CLASS: @"StartField"},
//                                     @{TITLE: @"RollBall", CLASS: @"RollBall"},
//                                     @{TITLE: @"DemoPlanet", CLASS: @"DemoPlanet"},
//                                     @{TITLE: @"DropBall", CLASS: @"DropBall"},
//                                     @{TITLE: @"ShipAndSea", CLASS: @"Ship"},
//                                     @{TITLE: @"HexColor", CLASS: @"HexColor"}
//                                     ]};
    
//    NSDictionary* codeCamp = @{SECTION: @"CodeCamp", MENU: @[
//                                       @{TITLE: @"CoGaiHaLan", CLASS: @"CoGaiHaLan"}
//                                       ]};
    
    mainScreen.menu = @[uiKit, array];
    mainScreen.title = @"FSS_ToanLH";
    mainScreen.about = @"This is code from fss.com.vn";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    window.rootViewController = nav;
}
@end
