//
//  ProcessSpringBoard.h
//  tweak1
//
//  Created by j066 on 2019/5/7.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/CALayer.h>
#import "sys/utsname.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProcessSpringBoard : NSObject
+ (ProcessSpringBoard *)shareInstance;
- (void)touch;
@end

@interface LSApplicationWorkspace : NSObject
+ (id)defaultWorkspace;
- (BOOL)uninstallApplication:(id)arg1 withOptions:(id)arg2;
- (BOOL)openApplicationWithBundleID:(id)arg1;
- (id)allApplications;
@end

@interface SBApplication : NSObject
- (NSString *)bundleIdentifier;
@end





NS_ASSUME_NONNULL_END
