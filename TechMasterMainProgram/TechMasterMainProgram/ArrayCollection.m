//
//  ArrayCollection.m
//  TechMasterMainProgram
//
//  Created by ios31 on 7/30/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "ArrayCollection.h"

@interface ArrayCollection ()<UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txfNumber;

@end

@implementation ArrayCollection

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self drawBackground];
}

- (IBAction)onClickFindNumber:(id)sender {
    int number;
    UIAlertView *alert;
    if ([self stringIsNumeric:_txfNumber.text]) {
        number = (int)[_txfNumber.text integerValue];
        alert = [[UIAlertView alloc] initWithTitle:@"Number is" message:[self checkNumber:number] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    }
    else{
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"This text isn't number." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    }
    [alert show];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.text.length >= 4 && range.length == 0)
    {
        return NO; // return NO to not change text
    }
    else
    {return YES;}
}

-(BOOL) stringIsNumeric:(NSString *) str {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:str];
    return !!number; // If the string is not numeric, number will be nil
}

- (void)drawBackground
{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"maths"] drawInRect:self.view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}

- (NSString*)checkNumber:(int)num
{
    char digit [21][10] = { "", "one", "two", "three", "four", "five", "six", "seven",
        "eight", "nine", "ten", "eleven", "twelve", "thirteen",
        "fourteen", "fifteen", "sixteen", "seventeen", "eighteen",
        "nineteen"};
    char tens [11][10] = { "", "", "twenty", "thirty", "forty", "fifty", "sixty",
        "seventy", "eighty", "ninety"};
    
    NSString *str = @"";
    int prev=0, div=1000;
    
    while(div) {
        
        if ((num / div) % 10 > 0 || (div == 10 && (num%100) > 0)) {
            
            if (prev) {
                str = [str stringByAppendingString:@" and "];
                prev = 0;
            }
            
            switch(div) {
                case 1000:
                    str = [str stringByAppendingString:[NSString stringWithFormat:@"%s",digit[(num / div) % 10]]];
                    str = [str stringByAppendingString:@" thousand"];
                    prev = 1;
                    break;
                case 100:
                    str = [str stringByAppendingString:[NSString stringWithFormat:@"%s",digit[(num / div) % 10]]];
                    str = [str stringByAppendingString:@" hundred"];
                    prev = 1;
                    break;
                case 10:
                    if ( (num%100) >= 10 && (num%100) <= 19)
                        str = [str stringByAppendingString:[NSString stringWithFormat:@"%s",digit[num%100]]];
                    else {
                        str = [str stringByAppendingString:[NSString stringWithFormat:@"%s",tens[(num%100)/10]]];
                        str = [str stringByAppendingString:[NSString stringWithFormat:@" %s",digit[num%10]]];
                    }
                    break;
            }
        }
        
        div /= 10;
    }
    return str;
}

@end
