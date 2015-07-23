//
//  DemoSelector.m
//  TechMasterMainProgram
//
//  Created by TaiND on 7/20/15.
//  Copyright (c) 2015 GiangNX. All rights reserved.
//

#import "DemoSelector.h"

@interface DemoSelector ()
@property (strong, nonatomic) IBOutlet UISlider *slider;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *labelCountDown;

@end

@implementation DemoSelector
{
    NSTimer *timer;
    int count;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageView.alpha = 1;
    count = 10;
    self.view.backgroundColor = [UIColor blackColor];
//    [self performSelector:@selector(animateImageView) withObject:nil afterDelay:2];
    [self performSelector:@selector(log:) withObject:@[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10] afterDelay:3];
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:true];
}

- (IBAction)onCruchData:(id)sender {
    [NSThread sleepForTimeInterval:3];
}

- (void)animateImageView{
    [UIView animateWithDuration:3 animations:^{
        _imageView.alpha = 0.05;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:3 animations:^{
            _imageView.alpha = 1;
        } completion:^(BOOL finished) {
            [self animateImageView];
        }];
    }];
}

- (void)log:(NSArray*)array {
    for (int i = 0; i < array.count; i++) {
            NSLog(@"count: %lu", [array[i] integerValue]);
    }
}

- (void)countDown{
    if (count > 0) {
        _labelCountDown.text = [NSString stringWithFormat:@"%d", count];
        count--;
    }
    else{
        _labelCountDown.text = @"OK";
        [self happy];
    }
    
}

- (void)happy{
    NSMutableArray *images= [[NSMutableArray alloc] initWithCapacity:46];
    for (int i = 0; i < 46; i++) {
        NSString *fileName;
        if (i<10) {
            fileName = [NSString stringWithFormat:@"77ef19d8e9.gif.00%d.gif", i];
        }
        else
            fileName = [NSString stringWithFormat:@"77ef19d8e9.gif.0%d.gif", i];
        UIImage *image = [UIImage imageNamed:fileName];
        [images addObject:image];
    }
    _imageView.animationImages = images;
    _imageView.animationDuration = 0.9;
    _imageView.animationRepeatCount = 0;
    [_imageView startAnimating];
}

@end
