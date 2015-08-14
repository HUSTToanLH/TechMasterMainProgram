//
//  AutoTableCell.m
//  TechMasterMainProgram
//
//  Created by TaiND on 8/10/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "AutoTableCell.h"
@interface AutoTableCell()
@property (weak, nonatomic) IBOutlet UILabel *lblContent;
@end
@implementation AutoTableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setContent:(NSString *)content{
    _lblContent.text = content;
}

-(NSString*)getContent{
    return _lblContent.text;
}

@end
