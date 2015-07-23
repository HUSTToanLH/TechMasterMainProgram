//
//  Player.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/17/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init:(NSString *)name withNumber:(int)number isCaptain:(int)captain atPosition:(NSString *)position
{
    if(self = [super init]){
        self.pName = name;
        self.pNumber = number;
        self.pCaptain = captain;
        self.pPosition = position;
    }
    return  self;
}

- (BOOL) isEqual:(id)object
{
    if([object isMemberOfClass:[Player class]]){
        Player* temp = (Player*) object;
        if([self.pName isEqual:temp.pName] && self.pNumber == temp.pNumber && self.pCaptain == temp.pCaptain && [self.pPosition isEqual:temp.pPosition]){
            return true;
        }
        else{
            return false;
        }
    }
    else{
        return false;
    }
}

- (instancetype)init{
    return self;
}

- (void)init:(NSString *)string{
    
}

@end
