//
//  TestWrapViewVC.m
//  TechMasterMainProgram
//
//  Created by ToanLH on 10/6/15.
//  Copyright © 2015 GiangNX. All rights reserved.
//

#import "TestWrapViewVC.h"
#import "TextWrapView.h"

@interface TestWrapViewVC ()
@property(nonatomic, strong) IBOutlet TextWrapView *textView;
@end

@implementation TestWrapViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    _textView = [[TextWrapView alloc] initWithFrame:self.view.frame];
    _textView.Text = @"qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghsdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfgh";
    _textView.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:_textView];
    
//    UIImageView* imgV= [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 160, 15, 150, 135)];
//    imgV.image = [UIImage imageNamed:@"pretty.jpg"];
//    [self.view addSubview:imgV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
