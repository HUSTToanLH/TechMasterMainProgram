//
//  QuickSort.h
//  TechMasterMainProgram
//
//  Created by TaiND on 8/4/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "ConsoleScreen.h"

@interface QuickSort : ConsoleScreen
-(NSString *)getStringWithIndex:(int)index;
-(void)quickSortNSArrayWithLeft:(int)left andRight:(int)right;
@end
