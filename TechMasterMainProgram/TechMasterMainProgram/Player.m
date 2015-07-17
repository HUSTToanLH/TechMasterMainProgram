//
//  Player.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/17/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init:(NSString *)name withNumber:(NSString *)number atPosition:(NSString *)position
{
    if(self = [super init]){
        self.pName = name;
        self.pNumber = number;
        self.pPosition = position;
    }
    return  self;
}

- (BOOL) isEqual:(id)object
{
    if([object isMemberOfClass:[Player class]]){
        Player* temp = (Player*) object;
        if([self.pName isEqual:temp.pName] && [self.pNumber isEqual:temp.pNumber] && [self.pPosition isEqual:temp.pPosition]){
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

@end
