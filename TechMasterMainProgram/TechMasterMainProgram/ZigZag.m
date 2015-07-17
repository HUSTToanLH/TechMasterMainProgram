//
//  ZigZag.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/16/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "ZigZag.h"

@interface ZigZag ()

@end

@implementation ZigZag{
    int b[5][21];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int height = 5;
    int width = 21;
    int space = (height - 1)*2;
    
    for(int i = 1; i < height+1; i++){
        for(int s = height; s < width+1; s = s+space){
            int count = s+1-height+space;
            if(width+1-s<space)
                count = width+1;
            for(int j = s+1-height; j < count; j++){
                if(j == s-i+1 || j == s+i-1)
                    [self write:@"+"];
                else
                    [self write:@" "];
            }
        }
        [self write:@"\n"];
    }
    
    
    b[4][0] = 1;
    
    CGPoint p1 = [self geneLine:4 basePointY:0 direct:DIRECT_UP];
    CGPoint p2 = [self geneLine:p1.x basePointY:p1.y direct:DIRECT_DOWN];
    CGPoint p3 = [self geneLine:p2.x basePointY:p2.y direct:DIRECT_UP];
    CGPoint p4 = [self geneLine:p3.x basePointY:p3.y direct:DIRECT_DOWN];
    [self geneLine:p4.x basePointY:p4.y direct:DIRECT_UP];
    
    [self printArray];
}

static int DIRECT_UP = -1;
static int DIRECT_DOWN = 1;


// ve 1 duong gom 4 diem
-(CGPoint) geneLine:(int)pointX basePointY:(int)pointY direct:(int) direct {
    
    for (int i =0; i<5; i++) {
        int posX =pointX+(i*direct);
        int posY =pointY+i;
        b[posX][posY] = 1;
    }
    return CGPointMake(pointX+(4*direct), pointY+4);
}

-(void) printArray {
    for (int i= 0; i<5; i++) {
        for (int j= 0; j<21; j++) {
            if (b[i][j] ==0) {
                [self write:@" "];
            } else if (b[i][j] ==1) {
                [self write:@"+"];
            }
        }
        [self write:@"\n"];    }
}

@end
