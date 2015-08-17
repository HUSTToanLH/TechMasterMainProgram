//
//  MutableArrayCategory.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/15/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "MutableArrayCategory.h"

#define VALIDATE_CHARACTER @"qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890'"
#define CHARACTERLESS @[@"i", @"the", @"am", @"is", @"to", @"an", @"were", @"was", @"demonstration"]

@interface MutableArrayCategory ()<UIScrollViewDelegate, UITextFieldDelegate>

@end

@implementation MutableArrayCategory
{
    UIScrollView *mainScrollView;
    UITextField *textfield;
    UIButton *button, *buttonAll, *buttonChange;
    CGFloat width, height, margin, wWord, hWord, space, contentWidth, penWidth;
    CGPoint atCenter;
    NSTimer *timer, *timerAll;
    NSArray *arrayContent;
    NSMutableArray *arrayAllButton;
    NSMutableArray *arrayRange, *arrayAll, *arrayTransfer;
    int counter, presentLine;
    UILabel *labelContent;
    NSDictionary *dic, *dicHightLight;
    NSString *strKey;
    BOOL isAction,isActionAll, isAll, isOne;
    UIImageView *pen;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    width = self.view.frame.size.width;
    CGFloat naviHeight = [UIApplication sharedApplication].statusBarFrame.size.height+self.navigationController.navigationBar.bounds.size.height;
    height = self.view.frame.size.height - naviHeight;
    
    margin = 20;
    wWord = 10;
    hWord = 20;
    space = 3;
    isAll = NO;
    isOne = NO;
    
    dicHightLight = @{NSFontAttributeName : [UIFont fontWithName:@"Snell Roundhand" size:16], NSForegroundColorAttributeName : [UIColor greenColor]};
    dic = @{NSFontAttributeName : [UIFont fontWithName:@"Snell Roundhand" size:16], NSForegroundColorAttributeName : [UIColor blackColor]};
    
    [self initContentLabel];
    [self initParameter];
    [self initArrayContentWithFileName:@"LutherKing" andType:@"rtf"];
    
    
}

-(void)initParameter
{
    [button setTitle:@"GO" forState:UIControlStateNormal];
    labelContent.text = @"";
    labelContent.attributedText = [[NSMutableAttributedString alloc] initWithString:@""];
    CGRect frame = labelContent.frame;
    frame.origin.y = 0;
    frame.size.height = hWord;
    labelContent.frame = frame;
    counter = 0;
    presentLine = 1;
    strKey = @"";
    arrayRange = [NSMutableArray new];
    arrayAllButton = [NSMutableArray new];
    isAction = NO;
    isActionAll = NO;
    timer = nil;
    
}

- (void)initArrayContentWithFileName:(NSString*)fileName andType:(NSString*)fileType
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *attrs = @{NSDocumentTypeDocumentAttribute: NSRTFTextDocumentType, NSWritingDirectionAttributeName:@[@(NSWritingDirectionRightToLeft | NSTextWritingDirectionOverride)]};
    NSError *error = nil;
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithData:data options:attrs documentAttributes:nil error:&error];
    
    NSArray *array = [[attrString string] componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    array = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
    
    NSMutableString *myString = [NSMutableString new];
    for (int i = 0; i < array.count; i++) {
        [myString appendString:array[i]];
        [myString appendString:@" \n "];
    }
    
    arrayContent = [myString componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (int)lineCountForLabel:(UILabel *)label
{
    CGFloat labelWidth = label.frame.size.width;
    int lineCount = 0;
    CGSize textSize = CGSizeMake(labelWidth, MAXFLOAT);
    
//    NSLog(@"rHeight: %f",[label sizeThatFits:textSize].height);
//    NSLog(@"charSize: %f",label.font.leading);
    
    long rHeight = lroundf([label sizeThatFits:textSize].height);
    long charSize = lroundf(label.font.leading);
    lineCount = (int)( rHeight / charSize );
    return lineCount+1;
}

- (void)initContentLabel
{
    UIImageView *paper = [[UIImageView alloc] initWithFrame:CGRectMake(0, margin, width, height-margin)];
    paper.image = [UIImage imageNamed:@"paper.png"];
    [self.view addSubview:paper];
    
    textfield = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    textfield.center = CGPointMake(width/2, 20);
    textfield.placeholder = @"Enter case";
    [textfield setFont:[UIFont systemFontOfSize:13]];
    textfield.backgroundColor = [UIColor whiteColor];
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    textfield.delegate = self;
    [self.view addSubview: textfield];
    
    button = [[UIButton alloc] initWithFrame:CGRectMake(textfield.frame.origin.x+textfield.frame.size.width+2, textfield.frame.origin.y, 50, 30)];
    [button setTitle:@"GO" forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[button layer] setCornerRadius:4.0f];
    [[button layer] setMasksToBounds:YES];
    [[button layer] setBorderWidth:0.0f];
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.enabled = YES;
    
    buttonAll = [[UIButton alloc] initWithFrame:CGRectMake(button.frame.origin.x+button.frame.size.width+24, button.frame.origin.y, 50, 30)];
    [buttonAll setTitle:@"ALL" forState:UIControlStateNormal];
    [buttonAll.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [buttonAll setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[buttonAll layer] setCornerRadius:4.0f];
    [[buttonAll layer] setMasksToBounds:YES];
    [[buttonAll layer] setBorderWidth:0.0f];
    buttonAll.backgroundColor = [UIColor grayColor];
    [buttonAll addTarget:self action:@selector(onClickAll) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonAll];
    buttonAll.enabled = NO;
    
    buttonChange = [[UIButton alloc] initWithFrame:CGRectMake(button.frame.origin.x+button.frame.size.width+2, button.frame.origin.y, 20, 30)];
    [[buttonChange layer] setCornerRadius:4.0f];
    [[buttonChange layer] setMasksToBounds:YES];
    [[buttonChange layer] setBorderWidth:0.0f];
    buttonChange.backgroundColor = [UIColor redColor];
    [buttonChange addTarget:self action:@selector(onClickChange) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonChange];

    
    mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 5*margin+5, width, height)];
    mainScrollView.contentSize = CGSizeMake(width, 1000);
    mainScrollView.backgroundColor = [UIColor clearColor];
    mainScrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:mainScrollView];
    
    UIImageView *bottomPaper = [[UIImageView alloc] initWithFrame:CGRectMake(0, height-90, width, 90)];
    bottomPaper.image = [UIImage imageNamed:@"bottomPaper3.png"];
    [self.view addSubview:bottomPaper];
    
    
    
    labelContent = [[UILabel alloc] initWithFrame:CGRectMake(2*margin, 0, width-4*margin, hWord)];
    labelContent.text = @"";
    labelContent.backgroundColor = [UIColor clearColor];
    labelContent.textAlignment = NSTextAlignmentLeft;
    labelContent.textColor = [UIColor blackColor];
    labelContent.font = [UIFont fontWithName:@"Snell Roundhand" size:16];
    labelContent.numberOfLines = 100;
    [mainScrollView addSubview:labelContent];
    
    [self initPen];
    
}

-(void)onClickChange
{
    [self stopTimer];
    [self initPen];
    [self initParameter];
    if (button.enabled == YES) {
        button.enabled = NO;
        button.backgroundColor = [UIColor grayColor];
        textfield.enabled = NO;
        buttonAll.enabled = YES;
        buttonAll.backgroundColor = [UIColor greenColor];
    }
    else if (buttonAll.enabled == YES){
        buttonAll.enabled = NO;
        buttonAll.backgroundColor = [UIColor grayColor];
        button.enabled = YES;
        button.backgroundColor = [UIColor greenColor];
        textfield.enabled = YES;
    }
}

-(void)initPen
{
    [pen stopAnimating];
    pen = [[UIImageView alloc] initWithFrame:CGRectMake(-margin, margin, 100, 100)];
    NSMutableArray *pens = [[NSMutableArray alloc] initWithCapacity:2];
    NSString *fileName = @"sig6.png";
    NSString *fileName2 = @"sig7.png";
    UIImage *imgPen = [UIImage imageNamed:fileName];
    UIImage *imgPen2 = [UIImage imageNamed:fileName2];
    [pens addObject:imgPen];
    [pens addObject:imgPen2];
    pen.animationImages = pens;
    pen.animationDuration = 1;
    pen.animationRepeatCount = -1;
    [self.view addSubview:pen];
    [pen startAnimating];
}

-(void)onClick
{
    [self stopTimer];
    isAll = NO;
    isOne = YES;
    [self setArrayTransfer];
    if (![textfield.text isEqual:@""]) {
        NSLog(@"%@", button.titleLabel.text);
        if (![button.titleLabel.text isEqual:@"GO"] && isAction == YES) {
            [timer invalidate];
            isAction = NO;
            return;
        }
        [self.view endEditing:YES];
        strKey = textfield.text;
        [self startTimer];
        [button setTitle:@"0" forState:UIControlStateNormal];
        isAction = YES;
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                        message:@"Please enter text"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void)startTimer
{
    if (!timer) {
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                 target:self
                                               selector:@selector(writeText)
                                               userInfo:nil
                                                repeats:true];
    }
}

- (void)startTimerAll
{
    if (!timerAll) {
        timerAll = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                 target:self
                                               selector:@selector(writeTextAll)
                                               userInfo:nil
                                                repeats:true];
    }
}

-(void)stopTimer
{
    if ([timer isValid]) {
        [timer invalidate];
    }
    timer = nil;
    
    if ([timerAll isValid]) {
        [timerAll invalidate];
    }
    timerAll = nil;
}

-(void)onClickAll
{
    [self stopTimer];
    isAll = YES;
    isOne = NO;
    [self setArrayTransfer];
    pen.image = nil;
//    [self initPen];
    
    if (isActionAll == YES) {
        isActionAll = NO;
        [self stopTimer];
        return;
    }
    else
    {
        arrayAll = [[NSMutableArray alloc] initWithCapacity:arrayContent.count];
        for (NSString *object in arrayContent) {
            if (![object isEqual:@"\n"]) {
                NSMutableString *mutableString = [NSMutableString new];
                for (int i = 0; i < object.length; i++) {
                    NSString *content = [NSString stringWithFormat:@"%c",[object characterAtIndex:i]];
                    if ([VALIDATE_CHARACTER rangeOfString:content
                                                  options:NSCaseInsensitiveSearch].location != NSNotFound) {
                        [mutableString appendString:[content lowercaseString]];
                    }
                }
                [arrayAll addObject:mutableString];
            }
        }
        
        NSCountedSet *countedSet = [[NSCountedSet alloc] initWithArray:arrayAll];
        //    NSMutableString *countedString = [NSMutableString new];
        for (NSString *string in countedSet) {
            if (string.length > 0 && [CHARACTERLESS containsObject:string] == FALSE) {
                [arrayAllButton addObject:[NSString stringWithFormat:@"%@ : %lu",string, (unsigned long)[countedSet countForObject:string]]];
                [arrayAllButton addObject:@"\n"];
            }
        }
        
//        [self initParameter];
        isActionAll = YES;
        [self startTimerAll];
        
    }
}

-(void)setArrayTransfer
{
    arrayTransfer = [NSMutableArray new];
    if (isAll == YES && isOne == NO) {
        arrayTransfer = arrayAllButton;
        penWidth = labelContent.frame.size.width/4;
    }
    else if (isOne == YES && isAll == NO){
        arrayTransfer = [[NSMutableArray alloc] initWithArray:arrayContent];
        penWidth = labelContent.frame.size.width;
    }
    
}

- (void)writeTextAll
{
    if (counter < arrayTransfer.count) {
        strKey = @"";
        [self setHightLightText:arrayTransfer[counter]];
        counter++;
        
        presentLine++;
        if (presentLine%2 == 0) {
            CGRect frame = labelContent.frame;
            if (frame.size.height > height - 200) {
                frame.origin.y = frame.origin.y - hWord;
            }
            frame.size.height = frame.size.height + hWord;
            NSLog(@"labelFrame: %f",frame.size.height);
            labelContent.frame = frame;
            
            CGRect frame2 = pen.frame;
            if (frame2.origin.y <= height - 200) {
                frame2.origin.y = frame2.origin.y + hWord;
                frame2.origin.x = 2*margin;
            }
            pen.frame = frame2;
        }
        else{
            CGRect frame2 = pen.frame;
            if (pen.frame.origin.x < penWidth) {
                frame2.origin.x += 30;
            }
            else{
                frame2.origin.x = 2*margin;
            }
            
            pen.frame = frame2;
        }
    }
    else{
        [pen stopAnimating];
        pen.image = [UIImage imageNamed:@"sig6.png"];
        [UIView animateWithDuration:2 animations:^{
            CGRect frame = labelContent.frame;
            frame.origin.y = 0;
            labelContent.frame = frame;
            
            pen.center = CGPointMake(width-3*margin, height-70);
            
            mainScrollView.contentSize = CGSizeMake(width, labelContent.frame.size.height+190);
            [timer invalidate];
        } completion:nil];
    }
}

- (void)writeText
{
    if (counter < arrayTransfer.count) {
        labelContent.text = [labelContent.text stringByAppendingString:@" "];
        [self setHightLightText:arrayTransfer[counter]];
        counter++;
        
        if ([self lineCountForLabel:labelContent] > presentLine) {
            presentLine++;
            CGRect frame = labelContent.frame;
            if (frame.size.height > height - 200) {
                frame.origin.y = frame.origin.y - hWord;
            }
            frame.size.height = frame.size.height + hWord;
//            NSLog(@"labelFrame: %f",frame.size.height);
            labelContent.frame = frame;
            
            CGRect frame2 = pen.frame;
            if (frame2.origin.y <= height - 200) {
                frame2.origin.y = frame2.origin.y + hWord;
                frame2.origin.x = 2*margin;
            }
            pen.frame = frame2;
        }
        else{
            CGRect frame2 = pen.frame;
            if (pen.frame.origin.x < penWidth) {
                frame2.origin.x += 30;
            }
            else{
                frame2.origin.x = 2*margin;
            }
            
            pen.frame = frame2;
        }
    }
    else{
        [pen stopAnimating];
        pen.image = [UIImage imageNamed:@"sig6.png"];
        [UIView animateWithDuration:2 animations:^{
            CGRect frame = labelContent.frame;
            frame.origin.y = 0;
            labelContent.frame = frame;
    
            pen.center = CGPointMake(width-3*margin, height-70);
            
            mainScrollView.contentSize = CGSizeMake(width, labelContent.frame.size.height+190);
            [timer invalidate];
        } completion:nil];
    }
}

-(void)setHightLightText:(NSString*)strAppend
{
    NSLog(@"%@",strAppend);
    NSMutableAttributedString *attrStringContent = [labelContent.attributedText mutableCopy];

    NSMutableString *mutableString = [[NSMutableString alloc] init];
    for (int i = 0; i < strAppend.length; i++) {
        NSString *string = [NSString stringWithFormat:@"%c",[strAppend characterAtIndex:i]];
        if ([VALIDATE_CHARACTER rangeOfString:string
                                      options:NSCaseInsensitiveSearch].location != NSNotFound) {
            [mutableString appendString:string];
        }
    }
    
    if(button.enabled == YES){
        if ([[mutableString uppercaseString] isEqual:[strKey uppercaseString]]) {
            NSAttributedString *tailString = [[NSAttributedString alloc] initWithString:strAppend attributes:dicHightLight];
            NSString *location = labelContent.text;
            [arrayRange addObject:location];
            [attrStringContent appendAttributedString:tailString];
        }
        else{
            NSAttributedString *tailString = [[NSAttributedString alloc] initWithString:strAppend attributes:dic];
            [attrStringContent appendAttributedString:tailString];
        }
        
        if (isOne == YES && isAll == NO) {
            [button setTitle:[NSString stringWithFormat:@"%lu", (unsigned long)arrayRange.count] forState:UIControlStateNormal];
        }
        
        for (int i = 0; i < arrayRange.count; i++) {
            NSString *loc = arrayRange[i];
            NSUInteger location = loc.length;
            NSRange range = NSMakeRange(location, strKey.length);
            [attrStringContent addAttribute:NSForegroundColorAttributeName
                                      value:[UIColor greenColor]
                                      range:range];
        }
    }
    else
    {
        NSAttributedString *tailString = [[NSAttributedString alloc] initWithString:strAppend attributes:dic];
        [attrStringContent appendAttributedString:tailString];
    }
    
    labelContent.attributedText = attrStringContent;
}

- (CGRect)boundingRectForCharacterRange:(NSRange)range attributeText:(NSMutableAttributedString*)attr
{
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithAttributedString:attr];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:labelContent.frame.size];
    textContainer.lineFragmentPadding = 0;
    [layoutManager addTextContainer:textContainer];
    
    NSRange glyphRange;
    
    // Convert the range for glyphs.
    [layoutManager characterRangeForGlyphRange:range actualGlyphRange:&glyphRange];
    
    return [layoutManager boundingRectForGlyphRange:glyphRange inTextContainer:textContainer];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [timer invalidate];
    
    [self initParameter];
    pen.image = nil;
    [self initPen];
//    NSLog(@"%f", mainScrollView.frame.origin.y);
//    NSLog(@"%f", labelContent.frame.origin.y);
    return YES;
}

@end
