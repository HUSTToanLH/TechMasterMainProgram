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
@property(strong, nonatomic) int pNumber;
@property(strong, nonatomic) int pCaptain;
@property(strong, nonatomic) NSString *pPosition;

- (instancetype) init: (NSString *)name withNumber: (int)number andCaptain:(int)captain atPosition: (NSString *)position;

@end
