//
//  UIAlertTweak.m
//  JALTweakDemo
//
//  Created by j066 on 2019/5/16.
//

#import <UIKit/UIKit.h>

#pragma mark - SBAlertItem
/****************************************************
 桌面弹窗
 ****************************************************/
%hook SBAlertItem
- (id)init
{
    NSLog(@"lqj-SBAlertItem.init");
    return %orig;
    //return nil; //可以屏蔽弹窗
}

%end

%hook SBAlertItemsController
- (void)activateAlertItem:(id)arg1 animated:(BOOL)arg2
{
    NSLog(@"lqj-SBAlertItemsController.activateAlertItem");
    %orig; //可以屏蔽弹窗
}
%end

#pragma mark - UIAlertView
%hook UIAlertView
- (void)show
{
    //可以屏蔽弹窗
    NSLog(@"lqj-UIAlertView.show");
    %orig;
}
%end

/*
 #pragma mark - UIAlertController
 %hook UIAlertController
 + (id)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle
 {
 NSLog(@"lqj-UIAlertController.alertControllerWithTitle:%@",title);
 return %orig;
 }
 %end
 */

#pragma mark - UIViewController
/****************************************************
 UIViewController
 ****************************************************/
%hook UIViewController
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ )(void))completion
{
    //可以屏蔽弹窗
    NSString *name = NSStringFromClass([viewControllerToPresent class]);
    NSLog(@"lqj-UIViewController.presentViewController:%@",name);
    if ([name isEqualToString:@"UIAlertController"] || [name isEqualToString:@"_SBAlertController"]) {
        
    }
    %orig;
}
%end
