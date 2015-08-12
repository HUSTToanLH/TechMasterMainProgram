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

@interface ArrayDictionary ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ArrayDictionary
{
    UITextField *inputText;
    UIButton *btnGo;
    UIImageView *imgView;
    UILabel *lblView, *lblViewHeader;
    NSArray *resultArray;
    UITableView *autoTable;
    NSDictionary *dic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    
}

-(void)initView{
    //set textfield
    inputText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    inputText.center = CGPointMake(self.view.frame.size.width*0.5, 200);
    inputText.placeholder = @"Enter name";
    [inputText setFont:[UIFont systemFontOfSize:13]];
    inputText.backgroundColor = [UIColor whiteColor];
    inputText.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview: inputText];
    
    //set button
    btnGo = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    btnGo.center = CGPointMake(inputText.center.x+inputText.frame.size.width*0.5+20+btnGo.frame.size.width*0.5, inputText.center.y);
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
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 160)];
    imgView.center = CGPointMake(self.view.frame.size.width*0.5, 310);
    imgView.image = [UIImage imageNamed:@"football.png"];
    [self.view addSubview:imgView];
    
    //set multilineLabel
    lblViewHeader = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-88, 50)];
    lblViewHeader.center = CGPointMake(self.view.frame.size.width*0.5, 420);
    lblViewHeader.backgroundColor = [[UIColor alloc] initColorHex:@"ffc89a" alpha:1];
    lblViewHeader.textColor = [UIColor blackColor];
    
    lblView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 88, 150)];
    lblView.center = CGPointMake(self.view.frame.size.width*0.5, 525);
    lblView.backgroundColor = [[UIColor alloc] initColorHex:@"4ec5ff" alpha:1];
    lblView.textColor = [UIColor blackColor];
    lblView.numberOfLines = 5;
    
    [self.view addSubview:lblViewHeader];
    [self.view addSubview:lblView];
    
    //set content of dictionary
    dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dictionary" ofType:@"plist"]];
    NSLog(@"dic: %@", dic);
}

-(void)onClick
{
    NSDictionary *content = [self filterFootballerWithName:inputText.text];
    if (content != nil) {
        lblViewHeader.text = [content objectForKey:@"name"];
        NSURL *url = [NSURL URLWithString:[content objectForKey:@"picture"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        imgView.image = [UIImage imageWithData:data];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Notice"
                                                        message:@"Not found footballer"
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

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range  replacementString:(NSString *)string
{
    return YES;
}



@end
