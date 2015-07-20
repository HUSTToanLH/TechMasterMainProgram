//
//  ArrayCategory.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/18/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "ArrayCategory.h"
#import "NSArray+Extend.h"

@interface ArrayCategory ()
{
    NSArray* _Barcelona;
}
@end

@implementation ArrayCategory

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
    Player* rafinha = [[Player new] init:@"Rafinha" withNumber:12 isCaptain:0 atPosition:@"MF"];
    Player* bravo = [[Player new] init:@"Bravo" withNumber:13 isCaptain:0 atPosition:@"GK"];
    Player* mascherano = [[Player new] init:@"Mascherano" withNumber:14 isCaptain:0 atPosition:@"MF"];
    Player* bartra = [[Player new] init:@"Bartra" withNumber:15 isCaptain:0 atPosition:@"DF"];
    Player* douglas = [[Player new] init:@"Douglas" withNumber:16 isCaptain:0 atPosition:@"DF"];
    Player* alba = [[Player new] init:@"Alba" withNumber:18 isCaptain:0 atPosition:@"DF"];
    Player* roberto = [[Player new] init:@"Roberto" withNumber:20 isCaptain:0 atPosition:@"MF"];
    Player* adriano = [[Player new] init:@"Adriano" withNumber:21 isCaptain:0 atPosition:@"DF"];
    Player* alves = [[Player new] init:@"Alves" withNumber:22 isCaptain:0 atPosition:@"DF"];
    Player* vermaelen = [[Player new] init:@"Vermaelen" withNumber:23 isCaptain:0 atPosition:@"DF"];
    Player* mathieu = [[Player new] init:@"Mathieu" withNumber:24 isCaptain:0 atPosition:@"DF"];
    Player* masip = [[Player new] init:@"Masip" withNumber:25 isCaptain:0 atPosition:@"GK"];
    Player* song = [[Player new] init:@"Song" withNumber:0 isCaptain:0 atPosition:@"MF"];
    Player* turan = [[Player new] init:@"Turan" withNumber:0 isCaptain:0 atPosition:@"MF"];
    Player* vidal = [[Player new] init:@"Vidal" withNumber:0 isCaptain:0 atPosition:@"MF"];
    
    _Barcelona = @[stegen, pique, rakitic, busquets, rodrigues,stegen2, pique2, rakitic2, busquets2, rodrigues2, iniesta, suarez, messi, neymar, rafinha, bravo, mascherano, bartra, douglas, alba, roberto, adriano, alves, vermaelen, mathieu, masip, song, turan, vidal];
    [_Barcelona unDuplicated:10];
    NSLog(@"count: %d",(int)_Barcelona.count);
    [self showListTeamStart:_Barcelona];
}

- (void)showListTeamStart:(NSArray *)_teamStart{
    for(int i = 0; i < _teamStart.count; i++){
        Player* player = (Player*)_teamStart[i];
        [self writeln:[NSString stringWithFormat:@"%2d - %@ - %@",player.pNumber, player.pPosition, player.pName]];
    }
}

@end
