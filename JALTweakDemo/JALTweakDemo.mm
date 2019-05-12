#line 1 "/Users/j066/Desktop/code/FTweak/Logos/JALTweakDemo/JALTweakDemo/JALTweakDemo.xm"


#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif







#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManager.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreMotion/CMStepCounter.h>
#import <UIKit/UIAlertController.h>
#import "ProcessSpringBoard.h"

double lat = 26.0646090000;
double lon = 119.2042990000;
extern "C" CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void);

#pragma mark - UIApplication




#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SpringBoard; @class SBAlertItem; @class UIViewController; @class SBAlertItemsController; @class UnityAppController; @class UIAlertController; @class UIApplication; @class CLLocation; @class SBUIController; @class CLLocationManager; @class SBHomeHardwareButtonActions; 
static void (*_logos_orig$_ungrouped$UIApplication$setDelegate$)(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$UIApplication$setDelegate$(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$UIApplication$_run)(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$UIApplication$_run(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL); static CLLocationCoordinate2D (*_logos_orig$_ungrouped$CLLocation$coordinate)(_LOGOS_SELF_TYPE_NORMAL CLLocation* _LOGOS_SELF_CONST, SEL); static CLLocationCoordinate2D _logos_method$_ungrouped$CLLocation$coordinate(_LOGOS_SELF_TYPE_NORMAL CLLocation* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIApplication *); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIApplication *); static void _logos_method$_ungrouped$SpringBoard$btnAction1$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$btnAction2$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$btnAction3$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$btnAction4$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$btnAction0$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$handleTapGestures$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$SpringBoard$handlePanGestures$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIPanGestureRecognizer *); static void _logos_method$_ungrouped$SpringBoard$savePos(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SpringBoard$processPos(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBHomeHardwareButtonActions$performDoublePressDownActions)(_LOGOS_SELF_TYPE_NORMAL SBHomeHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBHomeHardwareButtonActions$performDoublePressDownActions(_LOGOS_SELF_TYPE_NORMAL SBHomeHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$UnityAppController$application$didFinishLaunchingWithOptions$)(_LOGOS_SELF_TYPE_NORMAL UnityAppController* _LOGOS_SELF_CONST, SEL, UIApplication *, NSDictionary *); static BOOL _logos_method$_ungrouped$UnityAppController$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL UnityAppController* _LOGOS_SELF_CONST, SEL, UIApplication *, NSDictionary *); static SBAlertItem* (*_logos_orig$_ungrouped$SBAlertItem$init)(_LOGOS_SELF_TYPE_INIT SBAlertItem*, SEL) _LOGOS_RETURN_RETAINED; static SBAlertItem* _logos_method$_ungrouped$SBAlertItem$init(_LOGOS_SELF_TYPE_INIT SBAlertItem*, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$SBAlertItemsController$activateAlertItem$animated$)(_LOGOS_SELF_TYPE_NORMAL SBAlertItemsController* _LOGOS_SELF_CONST, SEL, id, BOOL); static void _logos_method$_ungrouped$SBAlertItemsController$activateAlertItem$animated$(_LOGOS_SELF_TYPE_NORMAL SBAlertItemsController* _LOGOS_SELF_CONST, SEL, id, BOOL); static void (*_logos_orig$_ungrouped$SBUIController$activateApplication$fromIcon$location$activationSettings$actions$)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL, id, id, long long, id, id); static void _logos_method$_ungrouped$SBUIController$activateApplication$fromIcon$location$activationSettings$actions$(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL, id, id, long long, id, id); static void (*_logos_orig$_ungrouped$SBUIController$activateApplicationAnimated$)(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL, SBApplication *); static void _logos_method$_ungrouped$SBUIController$activateApplicationAnimated$(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST, SEL, SBApplication *); static id (*_logos_meta_orig$_ungrouped$UIAlertController$alertControllerWithTitle$message$preferredStyle$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSString *, NSString *, UIAlertControllerStyle); static id _logos_meta_method$_ungrouped$UIAlertController$alertControllerWithTitle$message$preferredStyle$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSString *, NSString *, UIAlertControllerStyle); static void (*_logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$)(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST, SEL, UIViewController *, BOOL, void (^ )(void)); static void _logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST, SEL, UIViewController *, BOOL, void (^ )(void)); 

#line 29 "/Users/j066/Desktop/code/FTweak/Logos/JALTweakDemo/JALTweakDemo/JALTweakDemo.xm"

NSString *appName;
NSString *delegateClassName;
static void NotificationReceivedCallback(CFNotificationCenterRef center,void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
    if([appName isEqualToString:@"SpringBoard"]) {

    } else {
        NSString *friendlyNSString = (__bridge NSString *)object;
        NSArray<NSString *> *array = [friendlyNSString componentsSeparatedByString:@","];
        
        lat = array[0].floatValue;
        lon = array[1].floatValue;
        
        if ([delegateClassName isEqualToString:@"UnityAppController"]) {
            
            
            
        } else if ([appName isEqualToString:@"MapsApp"]) {
            
            
            
        }
    }
}


static void _logos_method$_ungrouped$UIApplication$setDelegate$(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id delegate) {
    appName = NSStringFromClass([self class]);
    delegateClassName = NSStringFromClass([delegate class]);
    NSLog(@"lqj-setDelegate|appName=%@|delegate=%@",appName,delegateClassName);
    _logos_orig$_ungrouped$UIApplication$setDelegate$(self, _cmd, delegate);
}


static void _logos_method$_ungrouped$UIApplication$_run(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSMutableDictionary *posDict = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/lqj.plist"];
    if(posDict) {
        lat = ((NSString *)posDict[@"lat"]).floatValue;
        lon = ((NSString *)posDict[@"lon"]).floatValue;
    }
    

    CFNotificationCenterAddObserver(CFNotificationCenterGetDistributedCenter(),
    NULL,
    &NotificationReceivedCallback,
    CFSTR("com.lqj.gps-change"),
    NULL,
    kCFNotificationDeliverImmediately);

    _logos_orig$_ungrouped$UIApplication$_run(self, _cmd);
}



#pragma mark - CLLocationManager








#pragma mark - CLLocation






static CLLocationCoordinate2D _logos_method$_ungrouped$CLLocation$coordinate(_LOGOS_SELF_TYPE_NORMAL CLLocation* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    CLLocationCoordinate2D oldCoordinate = _logos_orig$_ungrouped$CLLocation$coordinate(self, _cmd);
    oldCoordinate.latitude = lat;
    oldCoordinate.longitude = lon;
    return oldCoordinate;
}



#pragma mark - SpringBoard



UIWindow *window;
UIWindow *statusbarWin;
UIButton *btn1;
UIButton *btn2;
UIButton *btn3;
UIButton *btn4;
UIButton *btn;
@interface SpringBoard
- (void)btnAction0:(id)btn;
- (void)btnAction1:(id)btn;
- (void)btnAction2:(id)btn;
- (void)btnAction3:(id)btn;
- (void)btnAction4:(id)btn;
- (void)handlePanGestures:(UIPanGestureRecognizer *)paramSender;
- (void)handleTapGestures:(UITapGestureRecognizer *)gestureRecognizer;
- (void)savePos;
- (void)processPos;
@end






static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIApplication * application) {
    _logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$(self, _cmd, application);

    
    statusbarWin = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    UIColor *color = [UIColor colorWithRed:0/255 green:0/255 blue:0/255 alpha:0.05];
    statusbarWin.backgroundColor = color;
    statusbarWin.windowLevel = UIWindowLevelAlert;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestures:)];
    [statusbarWin addGestureRecognizer:tap];
    statusbarWin.hidden = NO;

    
    window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 100, 150, 150)];
    window.windowLevel = UIWindowLevelAlert;

    btn1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 0, 50, 50)];
    btn1.backgroundColor = UIColor.redColor;
    [btn1 addTarget:self action:@selector(btnAction1:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:btn1];

    btn2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 50, 50)];
    btn2.backgroundColor = UIColor.redColor;
    [btn2 addTarget:self action:@selector(btnAction2:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:btn2];

    btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, 50, 50)];
    btn3.backgroundColor = UIColor.redColor;
    [btn3 addTarget:self action:@selector(btnAction3:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:btn3];

    btn4 = [[UIButton alloc] initWithFrame:CGRectMake(100, 50, 50, 50)];
    btn4.backgroundColor = UIColor.redColor;
    [btn4 addTarget:self action:@selector(btnAction4:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:btn4];

    btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    btn.backgroundColor = UIColor.greenColor;
    [btn addTarget:self action:@selector(btnAction0:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:btn];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestures:)];
    [window addGestureRecognizer:pan];
    window.hidden = NO;

    
    NSMutableDictionary *posDict = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/lqj.plist"];
    if(!posDict)
        [self savePos];

    
    [ProcessSpringBoard Fun1];
}



static void _logos_method$_ungrouped$SpringBoard$btnAction1$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id btn) {
    lat += 0.0002;
    [self processPos];
}



static void _logos_method$_ungrouped$SpringBoard$btnAction2$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id btn) {
    lat -= 0.0002;
    [self processPos];
}



static void _logos_method$_ungrouped$SpringBoard$btnAction3$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id btn) {
    lon -= 0.0002;
    [self processPos];
}



static void _logos_method$_ungrouped$SpringBoard$btnAction4$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id btn) {
    lon += 0.0002;
    [self processPos];
}



static void _logos_method$_ungrouped$SpringBoard$btnAction0$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id btn) {
    if (!window.hidden) {
        window.hidden = YES;
    }
}



static void _logos_method$_ungrouped$SpringBoard$handleTapGestures$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITapGestureRecognizer * gestureRecognizer) {
    window.hidden = NO;
}



static void _logos_method$_ungrouped$SpringBoard$handlePanGestures$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIPanGestureRecognizer * paramSender) {
    if (paramSender.state != UIGestureRecognizerStateEnded && paramSender.state != UIGestureRecognizerStateFailed){

        CGPoint location = [paramSender locationInView:[UIApplication sharedApplication].keyWindow];
        int x = location.x - window.bounds.size.width/2;
        int y = location.y - window.bounds.size.height/2;
        [window setFrame:CGRectMake(x, y, 150, 150)];
    }
}



static void _logos_method$_ungrouped$SpringBoard$savePos(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSString *latStr = [NSString stringWithFormat:@"%f",lat];
    NSString *lonStr = [NSString stringWithFormat:@"%f",lon];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:latStr forKey:@"lat"];
    [dic setObject:lonStr forKey:@"lon"];
    [dic writeToFile:@"/var/mobile/Library/Preferences/lqj.plist" atomically:YES];
}



static void _logos_method$_ungrouped$SpringBoard$processPos(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    [self savePos];
    NSString *posStr = [NSString stringWithFormat:@"%f,%f",lat,lon];
    CFStringRef yourFriendlyCFString = (__bridge CFStringRef)posStr;
    CFNotificationCenterPostNotification(CFNotificationCenterGetDistributedCenter(), CFSTR("com.lqj.gps-change"), yourFriendlyCFString, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}



#pragma mark - SBHomeHardwareButtonActions





static void _logos_method$_ungrouped$SBHomeHardwareButtonActions$performDoublePressDownActions(_LOGOS_SELF_TYPE_NORMAL SBHomeHardwareButtonActions* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$SBHomeHardwareButtonActions$performDoublePressDownActions(self, _cmd);
}


#pragma mark - AppDelegate





static BOOL _logos_method$_ungrouped$UnityAppController$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL UnityAppController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIApplication * application, NSDictionary * launchOptions) {
    NSLog(@"lqj-AppDelegate=UnityAppController");
    _logos_orig$_ungrouped$UnityAppController$application$didFinishLaunchingWithOptions$(self, _cmd, application, launchOptions);
    
    return YES;
}


#pragma mark - SBAlertItem





static SBAlertItem* _logos_method$_ungrouped$SBAlertItem$init(_LOGOS_SELF_TYPE_INIT SBAlertItem* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    NSLog(@"lqj-SBAlertItem filter");
    return _logos_orig$_ungrouped$SBAlertItem$init(self, _cmd);
    
}





static void _logos_method$_ungrouped$SBAlertItemsController$activateAlertItem$animated$(_LOGOS_SELF_TYPE_NORMAL SBAlertItemsController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, BOOL arg2) {
    NSLog(@"lqj-SBAlertItemsController");
    _logos_orig$_ungrouped$SBAlertItemsController$activateAlertItem$animated$(self, _cmd, arg1, arg2); 
}


#pragma mark - SBUIController





static void _logos_method$_ungrouped$SBUIController$activateApplication$fromIcon$location$activationSettings$actions$(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, long long arg3, id arg4, id arg5) {
    NSLog(@"lqj-activateApplication=%@",arg1);
    if ([[arg1 bundleIdentifier] isEqualToString:@"com.tencent.yuling"])
    {
        return;
    }
    _logos_orig$_ungrouped$SBUIController$activateApplication$fromIcon$location$activationSettings$actions$(self, _cmd, arg1, arg2, arg3, arg4, arg5);
}


static void _logos_method$_ungrouped$SBUIController$activateApplicationAnimated$(_LOGOS_SELF_TYPE_NORMAL SBUIController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, SBApplication * arg1) {
    if ([[arg1 bundleIdentifier] isEqualToString:@"com.tencent.yuling"])
    {
        return;
    }
    _logos_orig$_ungrouped$SBUIController$activateApplicationAnimated$(self, _cmd, arg1);
}


#pragma mark - UIAlertController





static id _logos_meta_method$_ungrouped$UIAlertController$alertControllerWithTitle$message$preferredStyle$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * title, NSString * message, UIAlertControllerStyle preferredStyle) {
    NSLog(@"lqj-alertControllerWithTitle:%@",title);
    return _logos_meta_orig$_ungrouped$UIAlertController$alertControllerWithTitle$message$preferredStyle$(self, _cmd, title, message, preferredStyle);
}


#pragma mark - UIViewController





static void _logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIViewController * viewControllerToPresent, BOOL flag, void (^ completion)(void)) {
    NSString *name = NSStringFromClass([viewControllerToPresent class]);
    NSLog(@"lqj-presentViewController:%@",name);
    _logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$(self, _cmd, viewControllerToPresent, flag, completion);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIApplication = objc_getClass("UIApplication"); MSHookMessageEx(_logos_class$_ungrouped$UIApplication, @selector(setDelegate:), (IMP)&_logos_method$_ungrouped$UIApplication$setDelegate$, (IMP*)&_logos_orig$_ungrouped$UIApplication$setDelegate$);MSHookMessageEx(_logos_class$_ungrouped$UIApplication, @selector(_run), (IMP)&_logos_method$_ungrouped$UIApplication$_run, (IMP*)&_logos_orig$_ungrouped$UIApplication$_run);Class _logos_class$_ungrouped$CLLocation = objc_getClass("CLLocation"); MSHookMessageEx(_logos_class$_ungrouped$CLLocation, @selector(coordinate), (IMP)&_logos_method$_ungrouped$CLLocation$coordinate, (IMP*)&_logos_orig$_ungrouped$CLLocation$coordinate);Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(btnAction1:), (IMP)&_logos_method$_ungrouped$SpringBoard$btnAction1$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(btnAction2:), (IMP)&_logos_method$_ungrouped$SpringBoard$btnAction2$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(btnAction3:), (IMP)&_logos_method$_ungrouped$SpringBoard$btnAction3$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(btnAction4:), (IMP)&_logos_method$_ungrouped$SpringBoard$btnAction4$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(btnAction0:), (IMP)&_logos_method$_ungrouped$SpringBoard$btnAction0$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITapGestureRecognizer *), strlen(@encode(UITapGestureRecognizer *))); i += strlen(@encode(UITapGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(handleTapGestures:), (IMP)&_logos_method$_ungrouped$SpringBoard$handleTapGestures$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIPanGestureRecognizer *), strlen(@encode(UIPanGestureRecognizer *))); i += strlen(@encode(UIPanGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(handlePanGestures:), (IMP)&_logos_method$_ungrouped$SpringBoard$handlePanGestures$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(savePos), (IMP)&_logos_method$_ungrouped$SpringBoard$savePos, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(processPos), (IMP)&_logos_method$_ungrouped$SpringBoard$processPos, _typeEncoding); }Class _logos_class$_ungrouped$SBHomeHardwareButtonActions = objc_getClass("SBHomeHardwareButtonActions"); MSHookMessageEx(_logos_class$_ungrouped$SBHomeHardwareButtonActions, @selector(performDoublePressDownActions), (IMP)&_logos_method$_ungrouped$SBHomeHardwareButtonActions$performDoublePressDownActions, (IMP*)&_logos_orig$_ungrouped$SBHomeHardwareButtonActions$performDoublePressDownActions);Class _logos_class$_ungrouped$UnityAppController = objc_getClass("UnityAppController"); MSHookMessageEx(_logos_class$_ungrouped$UnityAppController, @selector(application:didFinishLaunchingWithOptions:), (IMP)&_logos_method$_ungrouped$UnityAppController$application$didFinishLaunchingWithOptions$, (IMP*)&_logos_orig$_ungrouped$UnityAppController$application$didFinishLaunchingWithOptions$);Class _logos_class$_ungrouped$SBAlertItem = objc_getClass("SBAlertItem"); MSHookMessageEx(_logos_class$_ungrouped$SBAlertItem, @selector(init), (IMP)&_logos_method$_ungrouped$SBAlertItem$init, (IMP*)&_logos_orig$_ungrouped$SBAlertItem$init);Class _logos_class$_ungrouped$SBAlertItemsController = objc_getClass("SBAlertItemsController"); MSHookMessageEx(_logos_class$_ungrouped$SBAlertItemsController, @selector(activateAlertItem:animated:), (IMP)&_logos_method$_ungrouped$SBAlertItemsController$activateAlertItem$animated$, (IMP*)&_logos_orig$_ungrouped$SBAlertItemsController$activateAlertItem$animated$);Class _logos_class$_ungrouped$SBUIController = objc_getClass("SBUIController"); MSHookMessageEx(_logos_class$_ungrouped$SBUIController, @selector(activateApplication:fromIcon:location:activationSettings:actions:), (IMP)&_logos_method$_ungrouped$SBUIController$activateApplication$fromIcon$location$activationSettings$actions$, (IMP*)&_logos_orig$_ungrouped$SBUIController$activateApplication$fromIcon$location$activationSettings$actions$);MSHookMessageEx(_logos_class$_ungrouped$SBUIController, @selector(activateApplicationAnimated:), (IMP)&_logos_method$_ungrouped$SBUIController$activateApplicationAnimated$, (IMP*)&_logos_orig$_ungrouped$SBUIController$activateApplicationAnimated$);Class _logos_class$_ungrouped$UIAlertController = objc_getClass("UIAlertController"); Class _logos_metaclass$_ungrouped$UIAlertController = object_getClass(_logos_class$_ungrouped$UIAlertController); MSHookMessageEx(_logos_metaclass$_ungrouped$UIAlertController, @selector(alertControllerWithTitle:message:preferredStyle:), (IMP)&_logos_meta_method$_ungrouped$UIAlertController$alertControllerWithTitle$message$preferredStyle$, (IMP*)&_logos_meta_orig$_ungrouped$UIAlertController$alertControllerWithTitle$message$preferredStyle$);Class _logos_class$_ungrouped$UIViewController = objc_getClass("UIViewController"); MSHookMessageEx(_logos_class$_ungrouped$UIViewController, @selector(presentViewController:animated:completion:), (IMP)&_logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$, (IMP*)&_logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$);} }
#line 364 "/Users/j066/Desktop/code/FTweak/Logos/JALTweakDemo/JALTweakDemo/JALTweakDemo.xm"
