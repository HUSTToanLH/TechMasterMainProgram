//
//  NSArray+Extend.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/18/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "NSArray+Extend.h"

@implementation NSArray (Extend)

- (NSArray*) unDuplicated:(int) count{
    
    NSEnumerator *enumerator = [self objectEnumerator];
    NSMutableArray *tempResult = [NSMutableArray arrayWithCapacity:self.count];

    for (id e in enumerator) {
        [tempResult addObject:e];
    }
    
    NSLog(@"temp: %d",(int)tempResult.count);
    int i = 0;
    while(i < tempResult.count){
        NSLog(@"count: %d",(int)tempResult.count);
        NSMutableArray *check = [NSMutableArray new];
        for (int j = i; j < tempResult.count; j++) {
            if([tempResult[i] isEqual:tempResult[j]]){
                NSNumber *number = [NSNumber numberWithInt:j];
                [check addObject:number];
            }
        }
        
        for (int k = (int)check.count-1; k>0; k--) {
            [tempResult removeObjectAtIndex:[check[k] integerValue]];
        }
        
        i++;
    }
    
    NSLog(@"temp: %d",(int)tempResult.count);
    
    NSArray *result = [[NSArray new] arrayByAddingObjectsFromArray:tempResult];

    return result;
}

@end
