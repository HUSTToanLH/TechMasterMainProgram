//
//  QuickSort.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/4/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "QuickSort.h"

@interface QuickSort ()

@end

@implementation QuickSort
{
    int arr[8][8], arr2[64];
    NSMutableArray *array;
    NSString *RANDOM_CHARACTER;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self initCArray];
//    [self printCArrayWithTitle:@"Unsorted array:"];
//    [self quickSortCArrayWithLeft:0 andRight:63];
//    [self resultCArray];
//    [self printCArrayWithTitle:@"\nSorted array:"];
    
    //NSArray
    [self initNSArray];
    [self printNSArrayWithTitle:@"Unsorted nsarray:"];
    [self quickSortNSArrayWithLeft:0 andRight:80];
    [self printNSArrayWithTitle:@"\nSorted nsarray:"];
}

-(void)initCArray
{
    for (int i = 0; i < 8; i++) {
        for (int j = 0;  j < 8; j++) {
            arr[i][j] = arc4random_uniform(99);
            arr2[i*8+j] = arr[i][j];
        }
    }
}

-(void)initNSArray
{
    array = [NSMutableArray new];
    RANDOM_CHARACTER = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    for (int i = 0; i < 81; i++) {
        [array addObject:[self randomStringWithLength:3]];
    }
}

-(NSString *) randomStringWithLength: (int) len {
    NSMutableString *s = [NSMutableString stringWithCapacity:len];
    for (NSUInteger i = 0U; i < len; i++) {
        u_int32_t r = arc4random() % [RANDOM_CHARACTER length];
        unichar c = [RANDOM_CHARACTER characterAtIndex:r];
        [s appendFormat:@"%C", c];
    }
    return s;
}

-(void)resultCArray
{
    for (int k = 0; k < 64; k++) {
        int i = k/8;
        int j = k - i*8;
        arr[i][j] = arr2[k];
    }
}

-(void)quickSortNSArrayWithLeft:(int)left andRight:(int)right
{
    NSString *pivot = [self getStringWithIndex:(left+right)/2];
    int i = left, j = right;
    
    do {
        while ([self getStringWithIndex:i] < pivot) {
            i++;
        }
        
        while ([self getStringWithIndex:j] > pivot) {
            j--;
        }
        
        if (i <= j) {
            int temp = arr2[i];
            arr2[i] = arr2[j];
            arr2[j] = temp;
            
            i++;
            j--;
        }
    } while (i < j);
    
    if (left < j) {
        [self quickSortCArrayWithLeft:left andRight:j];
    }
    
    if (i < right) {
        [self quickSortCArrayWithLeft:i andRight:right];
    }
}

-(void)quickSortCArrayWithLeft:(int)left andRight:(int)right
{
    int pivot = arr2[(left+right)/2];
    int i = left, j = right;
    
    do {
        while (arr2[i] < pivot) {
            i++;
        }
        
        while (arr2[j] > pivot) {
            j--;
        }
        
        if (i <= j) {
            int temp = arr2[i];
            arr2[i] = arr2[j];
            arr2[j] = temp;
            
            i++;
            j--;
        }
    } while (i < j);
    
    if (left < j) {
        [self quickSortCArrayWithLeft:left andRight:j];
    }
    
    if (i < right) {
        [self quickSortCArrayWithLeft:i andRight:right];
    }
}

-(void)printNSArrayWithTitle:(NSString*)title
{
    [self writeln:title];
    for (int i = 0; i < 81; i++) {
        [self write:[[NSString alloc] initWithFormat:@"%@ ", [self getStringWithIndex:i]]];
    }
}

-(NSString *)getStringWithIndex:(int)index
{
    NSData *data = [array[index] dataUsingEncoding:NSUTF8StringEncoding];
    NSString *fooString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return fooString;
}

-(void)printCArrayWithTitle:(NSString *)title
{
    [self writeln:title];
    for (int i = 0; i < 8; i++) {
        for (int j = 0;  j < 8; j++) {
            if (arr[i][j] > 9) {
                [self write:[[NSString alloc] initWithFormat:@"%d ", arr[i][j]]];
            }
            else{
                [self write:[[NSString alloc] initWithFormat:@"0%d ", arr[i][j]]];
            }
        }
        [self writeln:@""];
    }
}

@end
