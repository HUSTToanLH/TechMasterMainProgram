//
//  Player.h
//  TechMasterMainProgram
//
//  Created by TaiND on 7/17/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
@property(strong, nonatomic) NSString *pName;
@property(nonatomic) int pNumber;
@property(nonatomic) int pCaptain;
@property(nonatomic) NSString *pPosition;

- (instancetype) init: (NSString *)name withNumber: (int)number isCaptain:(int)captain atPosition: (NSString *)position;

@end
