//
//  NSArrayTruyVan_2.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/18/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "NSArrayTruyVan_2.h"
#import "NSArray+Extend.h"

@interface NSArrayTruyVan_2 ()
{
    NSArray* _Barcelona;
}
@end

@implementation NSArrayTruyVan_2

- (void)viewDidLoad {
    [super viewDidLoad];
    Player* stegen = [[Player new] init:@"Stegen" withNumber:1 isCaptain:0 atPosition:@"GK"];
    Player* pique = [[Player new] init:@"Pique" withNumber:3 isCaptain:4 atPosition:@"DF"];
    Player* rakitic = [[Player new] init:@"Rakitic" withNumber:4 isCaptain:0 atPosition:@"MF"];
    Player* busquets = [[Player new] init:@"Busquets" withNumber:5 isCaptain:3 atPosition:@"MF"];
    Player* rodrigues = [[Player new] init:@"Rodrigues" withNumber:7 isCaptain:0 atPosition:@"FW"];
    //duplicate
    Player* stegen2 = [[Player new] init:@"Stegen" withNumber:1 isCaptain:0 atPosition:@"GK"];
    Player* pique2 = [[Player new] init:@"Pique" withNumber:3 isCaptain:4 atPosition:@"DF"];
    Player* rakitic2 = [[Player new] init:@"Rakitic" withNumber:4 isCaptain:0 atPosition:@"MF"];
    Player* busquets2 = [[Player new] init:@"Busquets" withNumber:5 isCaptain:3 atPosition:@"MF"];
    Player* rodrigues2 = [[Player new] init:@"Rodrigues" withNumber:7 isCaptain:0 atPosition:@"FW"];
    
    Player* iniesta = [[Player new] init:@"Iniesta" withNumber:8 isCaptain:1 atPosition:@"MF"];
    Player* suarez = [[Player new] init:@"Suarez" withNumber:9 isCaptain:0 atPosition:@"FW"];
    Player* messi = [[Player new] init:@"Messi" withNumber:10 isCaptain:2 atPosition:@"FW"];
    Player* neymar = [[Player new] init:@"Neymar" withNumber:11 isCaptain:0 atPosition:@"FW"];
    
    _Barcelona = @[stegen, stegen2, pique, rakitic, rakitic2, busquets, rodrigues, pique2, busquets2, rodrigues2, iniesta, suarez, messi, neymar];
    
    [self writeln:@"Input Array"];
    [self showListTeamStart:_Barcelona];
    _Barcelona = [_Barcelona unDuplicated:10];
    NSLog(@"count: %d",(int)_Barcelona.count);
    
    [self writeln:@"Output Array"];
    [self showListTeamStart:_Barcelona];
}

- (void)showListTeamStart:(NSArray *)_teamStart{
    for(int i = 0; i < _teamStart.count; i++){
        Player* player = (Player*)_teamStart[i];
        [self writeln:[NSString stringWithFormat:@"%2d - %@ - %@",player.pNumber, player.pPosition, player.pName]];
    }
}

@end
