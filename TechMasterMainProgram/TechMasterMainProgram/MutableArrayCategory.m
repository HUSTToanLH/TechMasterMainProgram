//
//  MutableArrayCategory.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/15/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "MutableArrayCategory.h"

@interface MutableArrayCategory ()

@end

@implementation MutableArrayCategory
{
    CGFloat width, height, margin, wWord, hWord, presentWidth, space;
    CGPoint atCenter;
    NSTimer *timer;
    NSArray *arrayContent;
    int counter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    width = self.view.frame.size.width;
    height = self.view.frame.size.height;
    
    counter = 0;
    margin = 8;
    wWord = 10;
    hWord = 20;
    presentWidth = 0;
    space = 3;
    
    [self initArrayContentWithFileName:@"LutherKing" andType:@"rtf"];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                             target:self
                                           selector:@selector(writeText)
                                           userInfo:nil
                                            repeats:true];
}

- (void)initArrayContentWithFileName:(NSString*)fileName andType:(NSString*)fileType
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
    NSString *content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:nil];

    NSLog(@"%@",content);
    NSArray *array = [content componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    array = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
    
    NSMutableString *myString = [NSMutableString new];
    for (int i = 0; i < array.count; i++) {
        NSString *string = array[i];
        if (![[string substringToIndex:1] isEqual: @"{"] && ![[string substringToIndex:1] isEqual: @"\\"]) {
            [myString appendString:string];
        }
    }
    
    NSMutableString *myString2 = [NSMutableString new];
    NSArray *array2 = [myString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    for (int i = 0; i < array2.count; i++) {
        NSString *string = array2[i];
        if (![[string substringToIndex:1] isEqual: @"\\"]) {
            [myString2 appendString:string];
            [myString2 appendString:@" "];

        }
    }
    
    NSString* result = [NSString new];
    NSRange replaceRange1 = [myString2 rangeOfString:@"\expnd0"];
    if (replaceRange1.location != NSNotFound){
        result = [myString2 stringByReplacingCharactersInRange:replaceRange1 withString:@""];
    }
    NSRange replaceRange2 = [myString2 rangeOfString:@"\expndtw0"];
    if (replaceRange2.location != NSNotFound){
        result = [myString2 stringByReplacingCharactersInRange:replaceRange2 withString:@""];
    }
    NSRange replaceRange3 = [myString2 rangeOfString:@"\\kerning0"];
    if (replaceRange3.location != NSNotFound){
        result = [myString2 stringByReplacingCharactersInRange:replaceRange3 withString:@""];
    }
    NSRange replaceRange4 = [myString2 rangeOfString:@"\expnd0\expndtw0\\kerning0"];
    if (replaceRange4.location != NSNotFound){
        result = [myString2 stringByReplacingCharactersInRange:replaceRange4 withString:@""];
    }
    
    
    
    arrayContent = [myString2 componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if (arrayContent.count > 0) {
        NSString *word = arrayContent[0];
        atCenter = CGPointMake(margin + wWord*(word.length)/2, 10);
    }
}

- (void)writeText
{
    if (counter < arrayContent.count) {
        [self addLabelWithWord:arrayContent[counter] andBeforeCenter:atCenter];
        [self setNewCenter];
    }
}

- (void)addLabelWithWord:(NSString*)word andBeforeCenter:(CGPoint)center
{
    UILabel *lblword = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, wWord*word.length, hWord)];
    lblword.center = center;
    lblword.text = word;
    lblword.font = [UIFont fontWithName:@"Helvetice" size:5];
    lblword.backgroundColor = [UIColor greenColor];
    lblword.textColor = [UIColor blackColor];
    lblword.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:lblword];
    presentWidth = wWord*word.length;
}

- (void)setNewCenter
{
    if (counter < arrayContent.count - 1) {
        counter++;
        NSString *nextWord = arrayContent[counter];
        CGFloat checkLengthX = atCenter.x + presentWidth/2 + space + wWord*nextWord.length + margin;
        if (checkLengthX <= width) {
            atCenter = CGPointMake(atCenter.x + presentWidth/2 + space + wWord*nextWord.length/2, atCenter.y);
        }
        else{
            CGFloat newCenterX = margin + wWord*nextWord.length/2;
            CGFloat newCenterY = atCenter.y + hWord + 2*space;
            atCenter = CGPointMake(newCenterX, newCenterY);
        }
    }
}

@end
