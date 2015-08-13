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
    CGFloat width, height, margin;
    UITextField *inputText;
    UIButton *btnGo;
    UIImageView *imgView;
    UILabel *lblViewInfo;
    NSArray *resultArray;
    UITableView *autoTable;
    NSDictionary *dic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initView];
    
}

-(void)initView{
    CGFloat naviHeight = [UIApplication sharedApplication].statusBarFrame.size.height+self.navigationController.navigationBar.bounds.size.height;
    width = self.view.frame.size.width;
    height = self.view.frame.size.height-naviHeight;
    margin = 20;
    
    //set textfield
    inputText = [[UITextField alloc] initWithFrame:CGRectMake(margin, margin, 4*(width-2*margin)/5, 40)];
    inputText.placeholder = @"Enter name";
    [inputText setFont:[UIFont systemFontOfSize:13]];
    inputText.backgroundColor = [UIColor whiteColor];
    inputText.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview: inputText];
    
    //set button
    btnGo = [[UIButton alloc] initWithFrame:CGRectMake(width-2*margin-inputText.frame.size.width, margin, width-inputText.frame.size.width-3*margin, 40)];
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
    CGFloat imgHeight = (height-4*margin-inputText.frame.size.height)*0.5;
    CGFloat imgWidth = imgHeight/1.5;
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake((width-imgWidth)*0.5, 2*margin+inputText.frame.size.height, imgWidth, imgHeight)];
    imgView.image = [UIImage imageNamed:@"football.png"];
    [self.view addSubview:imgView];
    
    //set multilineLabel
    CGFloat viewHeight = height-imgView.frame.origin.y-imgView.frame.size.height-2*margin;
    lblViewInfo = [[UILabel alloc] initWithFrame:CGRectMake(margin, imgView.frame.origin.y+imgView.frame.size.height+margin, self.view.frame.size.width-2*margin, viewHeight)];
    lblViewInfo.backgroundColor = [[UIColor alloc] initColorHex:@"4ec5ff" alpha:1];
    lblViewInfo.textColor = [UIColor blackColor];
    lblViewInfo.numberOfLines = 3;
    [self.view addSubview:lblViewInfo];
    
    //set content of dictionary
    dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dictionary" ofType:@"plist"]];
//    NSLog(@"dic: %@", dic);
}

-(void)onClick
{
    NSDictionary *content = [self filterFootballerWithName:inputText.text];
    if (content != nil) {
        lblViewInfo.text = [@"Description: " stringByAppendingString:[content objectForKey:@"des"]];
        NSURL *url = [NSURL URLWithString:[content objectForKey:@"picture"]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        imgView.image = [UIImage imageWithData:data];
    }
    else{
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

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range  replacementString:(NSString *)string
{
    return YES;
}



@end
