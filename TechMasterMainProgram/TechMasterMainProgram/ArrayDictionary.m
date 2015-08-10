//
//  ArrayDictionary.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/10/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "ArrayDictionary.h"
#import "AutoTableCell.h"

@interface ArrayDictionary ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ArrayDictionary
{
    UITextField *inputText;
    UIButton *btnGo;
    NSArray *resultArray;
    UITableView *autoTable;
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

}

-(void)onClick
{
    
}

- (void)filterFootballerWithName:(NSString *)name
{
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range  replacementString:(NSString *)string
{
    return YES;
}



@end
