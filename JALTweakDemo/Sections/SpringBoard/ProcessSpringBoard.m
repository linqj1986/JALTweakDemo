//
//  ProcessSpringBoard.m
//  tweak1
//
//  Created by j066 on 2019/5/7.
//

#import "ProcessSpringBoard.h"
#import "PTFakeTouch/PTFakeTouch.h"

@implementation ProcessSpringBoard

+ (ProcessSpringBoard *)shareInstance
{
    static ProcessSpringBoard *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ProcessSpringBoard alloc] init];
    });
    return instance;
}

- (void)touch
{
    /*UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = UIColor.grayColor;
    [btn setTitle:@"KillSB" forState:UIControlStateNormal];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = UIColor.whiteColor;
    [view addSubview:btn];*/
}

@end
