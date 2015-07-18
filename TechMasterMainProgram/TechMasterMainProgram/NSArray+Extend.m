//
//  NSArray+Extend.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/18/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "NSArray+Extend.h"

@implementation NSArray (Extend)

- (instancetype) unDuplicated:(int) count{
    NSMutableArray *temp = [[NSMutableArray new] initWithArray:self];
    NSMutableArray *tempResult = [[NSMutableArray new] initWithArray:self];
    
    for (int i = 0; i < self.count-1; i++) {
        for (int j = i; j < self.count; i++) {
            if ([temp[i] isEqual:temp[j]] && ![tempResult[j] isEqual:nil] && [tempResult[j] isEqual:temp[j]]) {
                [tempResult removeObjectAtIndex:j];
            }
        }
    }
    
    [self arrayByAddingObjectsFromArray:tempResult];
    return self;
}

@end
