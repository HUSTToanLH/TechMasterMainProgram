//
//  ArrayDictionary.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/10/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "ArrayDictionary.h"
#import "AutoTableCell.h"
#import "UIColor+Extend.h"
#import "QuickSort.h"

@interface ArrayDictionary ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property(strong, nonatomic) IBOutlet UITableView *autoTable;
@property(strong, nonatomic) IBOutlet UITextField *inputText;
@end

@implementation ArrayDictionary
{
    CGFloat width, height, margin;
//    UITextField *inputText;
    UIButton *btnGo;
    UIImageView *imgView;
    UILabel *lblViewInfo;
    NSMutableArray *resultArray;
//    UITableView *autoTable;
    NSDictionary *dic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initView];
    [self initAutoTable];
}

-(void)initView{
    CGFloat naviHeight = [UIApplication sharedApplication].statusBarFrame.size.height+self.navigationController.navigationBar.bounds.size.height;
    width = self.view.frame.size.width;
    height = self.view.frame.size.height-naviHeight;
    margin = 20;
    
    //set textfield
    _inputText = [[UITextField alloc] initWithFrame:CGRectMake(margin, margin, 4*(width-2*margin)/5, 40)];
    _inputText.placeholder = @"Enter name";
    [_inputText setFont:[UIFont systemFontOfSize:13]];
    _inputText.backgroundColor = [UIColor whiteColor];
    _inputText.borderStyle = UITextBorderStyleRoundedRect;
    _inputText.delegate = self;
    [self.view addSubview: _inputText];
    
    //set button
    btnGo = [[UIButton alloc] initWithFrame:CGRectMake(width-2*margin-_inputText.frame.size.width, margin, width-_inputText.frame.size.width-3*margin, 40)];
    btnGo.center = CGPointMake(_inputText.center.x+_inputText.frame.size.width*0.5+20+btnGo.frame.size.width*0.5, _inputText.center.y);
    [btnGo setTitle:@"GO" forState:UIControlStateNormal];
    [btnGo.titleLabel setFont:[UIFont systemFontOfSize:13]];
    [btnGo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[btnGo layer] setCornerRadius:8.0f];
    [[btnGo layer] setMasksToBounds:YES];
    [[btnGo layer] setBorderWidth:0.0f];
    btnGo.backgroundColor = [UIColor greenColor];
    [btnGo addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnGo];
    
    //set tableview
//    autoTable = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    
    //set imageView
    CGFloat imgHeight = (height-4*margin-_inputText.frame.size.height)*0.5;
    CGFloat imgWidth = imgHeight/1.5;
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake((width-imgWidth)*0.5, 2*margin+_inputText.frame.size.height, imgWidth, imgHeight)];
    imgView.image = [UIImage imageNamed:@"football.png"];
    [self.view addSubview:imgView];
    
    //set multilineLabel
    CGFloat viewHeight = height-imgView.frame.origin.y-imgView.frame.size.height-2*margin;
    lblViewInfo = [[UILabel alloc] initWithFrame:CGRectMake(margin, imgView.frame.origin.y+imgView.frame.size.height+margin, self.view.frame.size.width-2*margin, viewHeight*0.7)];
    lblViewInfo.backgroundColor = [[UIColor alloc] initColorHex:@"4ec5ff" alpha:1];
    lblViewInfo.textColor = [UIColor blackColor];
    lblViewInfo.numberOfLines = 10;
    lblViewInfo.font = [UIFont fontWithName:@"Helvetica" size:15];
    [self.view addSubview:lblViewInfo];
    
    //set content of dictionary
    dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dictionary" ofType:@"plist"]];
//    NSLog(@"dic: %@", dic);
}

-(void)onClick
{
    NSDictionary *content = [self filterFootballerWithName:_inputText.text];
    if (content != nil) {
        NSString *des = @"  Information\n";
        des = [des stringByAppendingString:[@"\n    FullName : " stringByAppendingString:[content objectForKey:@"fullname"]]];
        des = [des stringByAppendingString:[@"\n    Club : " stringByAppendingString:[content objectForKey:@"club"]]];
        des = [des stringByAppendingString:[@"\n    Number : " stringByAppendingString:[content objectForKey:@"number"]]];
        des = [des stringByAppendingString:[@"\n    Age : " stringByAppendingString:[content objectForKey:@"age"]]];
        lblViewInfo.text = des;
        
        NSURL *url = [NSURL URLWithString:[content objectForKey:@"picture"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        imgView.image = [UIImage imageWithData:data];
    }
    else{
        lblViewInfo.text = nil;
        imgView.image = nil;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice"
                                                        message:@"Footballer not found"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
    
}

- (NSDictionary*)filterFootballerWithName:(NSString*)nameInput
{
    if (nameInput.length > 0) {
        NSString *name = nameInput;
        NSString *keyName = [name substringToIndex:1];
        NSArray *check = (NSArray*)[dic objectForKey:keyName];
        for (int i = 0; i < check.count; i++) {
            if ([[check[i] objectForKey:@"name"] isEqual:name]) {
                return check[i];
            }
        }
    }
    return nil;
}

-(void)filterForAutoCompleteWithName:(NSString*)nameInput
{
    [resultArray removeAllObjects];
    if (nameInput.length > 0) {
        NSString *name = nameInput;
        NSString *keyName = [name substringToIndex:1];
        NSArray *check = (NSArray*)[dic objectForKey:keyName];
        if (check != nil) {
            for (int i = 0; i < check.count; i++) {
                if ([check[i] isKindOfClass:[NSDictionary class]]) {
                    if ([check[i] objectForKey:@"name"] != nil && ![[check[i] objectForKey:@"name"] isEqual: @""]) {
                        NSString *nameValidate = [check[i] objectForKey:@"name"];
                        if (nameInput.length <= nameValidate.length) {
                            if ([[nameValidate substringToIndex:nameInput.length] isEqual:nameInput]) {
                                [resultArray addObject:[check[i] objectForKey:@"name"]];
                            }
                        }
                    }
                }
            }
        }
        if (resultArray.count>1) {
            [self quickSortNSArrayWithLeft:0 andRight:(int)resultArray.count-1];
        }
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range  replacementString:(NSString *)string
{
    if (range.location < 1 && [string isEqual:@""]) {
        _autoTable.hidden = YES;
    }
    else{
        _autoTable.hidden = NO;
    }
    
    NSString *substring = [NSString stringWithString:textField.text];
    substring = [substring
                 stringByReplacingCharactersInRange:range withString:string];
    [self filterForAutoCompleteWithName:substring];
    
    CGRect frame = _autoTable.frame;
    if (resultArray.count > 5) {
        frame.size.height = 30*5;
    }
    else{
        frame.size.height = 30*resultArray.count;
    }
    _autoTable.frame = frame;
    [_autoTable reloadData];
    return YES;
}

-(void)initAutoTable
{
    _autoTable = [[UITableView alloc] initWithFrame:CGRectMake(_inputText.frame.origin.x, _inputText.frame.origin.y+_inputText.frame.size.height, _inputText.frame.size.width, _inputText.frame.size.height) style:UITableViewStylePlain];
    _autoTable.dataSource = self;
    _autoTable.delegate = self;
    _autoTable.scrollEnabled = YES;
    _autoTable.hidden = YES;
    _autoTable.separatorStyle = UITextAutocapitalizationTypeNone;
    [self.view addSubview:_autoTable];
    
    resultArray = [[NSMutableArray alloc] initWithObjects:@"ToanLH",@"LeeDino", nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AutoTableCell *ce;
    if (!ce) {
        ce = [[NSBundle mainBundle] loadNibNamed:@"AutoTableCell" owner:nil options:nil].firstObject;
    }
    [ce setContent:resultArray[(int)indexPath.row]];
    return ce;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AutoTableCell *cell = (AutoTableCell *)[tableView cellForRowAtIndexPath:indexPath];
    _inputText.text = [cell getContent];
    _autoTable.hidden = YES;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return resultArray.count;
}

-(void)quickSortNSArrayWithLeft:(int)left andRight:(int)right
{
    NSString *pivot = [self getStringWithIndex:(left+right)/2];
    int i = left, j = right;
    
    do {
        while ([[self getStringWithIndex:i] compare:pivot] == NSOrderedAscending) {
            i++;
            //            NSComparisonResult res = [[self getStringWithIndex:i] compare:pivot];
        }
        
        while ([[self getStringWithIndex:j] compare:pivot] == NSOrderedDescending) {
            j--;
        }
        
        if (i <= j) {
            NSString *temp = resultArray[i];
            resultArray[i] = resultArray[j];
            resultArray[j] = temp;
            
            i++;
            j--;
            if (resultArray == nil) {
                NSLog(@"i: %d, j: %d", i, j);
            }
        }
    } while (i < j);
    
    if (left < j) {
        [self quickSortNSArrayWithLeft:left andRight:j];
    }
    
    if (i < right) {
        [self quickSortNSArrayWithLeft:i andRight:right];
    }
}

-(NSString *)getStringWithIndex:(int)index
{
    return resultArray[index];
}

@end
