//
//  NestedSquare.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/23/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "NestedSquare.h"

@interface NestedSquare ()

@end

@implementation NestedSquare
{
    int k;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    k = 0;
    [self drawNestedSquare];
    [self performSelector:@selector(rotateAllSquare) withObject:nil afterDelay:2];
}

- (void)drawNestedSquare{
    self.view.backgroundColor = [UIColor whiteColor];
    CGSize mainSize = self.view.bounds.size;
    CGFloat margin = 20.0;
    CGFloat naviHeight = [UIApplication sharedApplication].statusBarFrame.size.height+self.navigationController.navigationBar.bounds.size.height;
    
    CGFloat rectWidth = mainSize.width/sqrt(2.0) - margin * 2.0;
    CGPoint center = CGPointMake(mainSize.width*0.5, (mainSize.height+naviHeight)*0.5);
    
    for (int i = 0; i<10; i++) {
        UIView *square;
        if (i%2 == 0) {
            square = [self drawSquareByWitdh:rectWidth
                                   andRotate:false
                                    atCenter:center];
        }
        else{
            square = [self drawSquareByWitdh:rectWidth
                                   andRotate:true
                                    atCenter:center];
        }
        rectWidth = rectWidth*sqrt(2.0)*0.5;
        [self.view addSubview:square];
    }
}

- (UIView*)drawSquareByWitdh:(CGFloat)witdh
                andRotate:(BOOL)rotate
                 atCenter:(CGPoint)center{
    UIView *square = [[UIView alloc] initWithFrame:CGRectMake(0, 0, witdh, witdh)];
    square.center = center;
    square.transform = rotate?CGAffineTransformMakeRotation(M_PI_4):CGAffineTransformIdentity;
    square.backgroundColor = rotate?[UIColor whiteColor]:[UIColor grayColor];
    return square;
}

- (void)rotateAllSquare{
    [UIView animateWithDuration:2.0 animations:^{
        for (int i = 0; i < self.view.subviews.count; i++) {
//            if(i%2 == (k%2))
//                ((UIView *)self.view.subviews[i]).transform = CGAffineTransformMakeRotation(-M_PI_4);
//            else
//                ((UIView *)self.view.subviews[i]).transform = CGAffineTransformMakeRotation(M_PI_4);
            
            CATransform3D t = ((UIView *)self.view.subviews[i]).layer.transform;
            t.m34 = -0.005;
            if(i%2 == 0){
                t = CATransform3DRotate(t, M_PI_4, 0.0, 0.0, 1.0);
            }
            else{
                t = CATransform3DRotate(t, -M_PI_4, 0.0, 0.0, 1.0);
            }
            ((UIView *)self.view.subviews[i]).layer.transform = t;
                
        }
    } completion:^(BOOL finished) {
        k++;
        [self rotateAllSquare];
    }];
}

@end
