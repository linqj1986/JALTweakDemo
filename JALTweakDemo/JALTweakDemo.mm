#line 1 "/Users/j066/Desktop/code/FTweak/JALTweakDemo/JALTweakDemo/JALTweakDemo.xm"


#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif







#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManager.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreMotion/CMStepCounter.h>
#import <UIKit/UIAlertController.h>
#import <CoreMotion/CMPedometer.h>
#import <HealthKit/HealthKit.h>
#import <HealthKit/HKSource.h>
#import <objc/runtime.h>
#import "ProcessSpringBoard.h"

NSString *LOCATION_FILE = @"/var/mobile/Library/Preferences/lqj.plist";
double lat = 26.0646090000;
double lon = 119.2042990000;
int step = 6133;
NSString *lastDateString;
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

@class UIViewController; @class UIApplication; @class CLLocationManager; @class SBAlertItemsController; @class UIAlertController; @class SBAlertItem; @class SpringBoard; @class SBHomeHardwareButtonActions; @class CMPedometerData; @class CLLocation; @class CMPedometer; @class UnityAppController; @class CMStepCounter; 
static void (*_logos_orig$_ungrouped$UIApplication$setDelegate$)(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$UIApplication$setDelegate$(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$UIApplication$_run)(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$UIApplication$_run(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST, SEL); static CLLocationCoordinate2D (*_logos_orig$_ungrouped$CLLocation$coordinate)(_LOGOS_SELF_TYPE_NORMAL CLLocation* _LOGOS_SELF_CONST, SEL); static CLLocationCoordinate2D _logos_method$_ungrouped$CLLocation$coordinate(_LOGOS_SELF_TYPE_NORMAL CLLocation* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$CMStepCounter$queryStepCountStartingFrom$to$toQueue$withHandler$)(_LOGOS_SELF_TYPE_NORMAL CMStepCounter* _LOGOS_SELF_CONST, SEL, id, id, id, id); static void _logos_method$_ungrouped$CMStepCounter$queryStepCountStartingFrom$to$toQueue$withHandler$(_LOGOS_SELF_TYPE_NORMAL CMStepCounter* _LOGOS_SELF_CONST, SEL, id, id, id, id); static void (*_logos_orig$_ungrouped$CMPedometer$queryPedometerDataFromDate$toDate$withHandler$)(_LOGOS_SELF_TYPE_NORMAL CMPedometer* _LOGOS_SELF_CONST, SEL, id, id, id); static void _logos_method$_ungrouped$CMPedometer$queryPedometerDataFromDate$toDate$withHandler$(_LOGOS_SELF_TYPE_NORMAL CMPedometer* _LOGOS_SELF_CONST, SEL, id, id, id); static BOOL (*_logos_meta_orig$_ungrouped$CMPedometer$isStepCountingAvailable)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL _logos_meta_method$_ungrouped$CMPedometer$isStepCountingAvailable(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_meta_orig$_ungrouped$CMPedometer$isDistanceAvailable)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static BOOL _logos_meta_method$_ungrouped$CMPedometer$isDistanceAvailable(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL); static NSNumber * (*_logos_orig$_ungrouped$CMPedometerData$numberOfSteps)(_LOGOS_SELF_TYPE_NORMAL CMPedometerData* _LOGOS_SELF_CONST, SEL); static NSNumber * _logos_method$_ungrouped$CMPedometerData$numberOfSteps(_LOGOS_SELF_TYPE_NORMAL CMPedometerData* _LOGOS_SELF_CONST, SEL); static NSNumber * (*_logos_orig$_ungrouped$CMPedometerData$distance)(_LOGOS_SELF_TYPE_NORMAL CMPedometerData* _LOGOS_SELF_CONST, SEL); static NSNumber * _logos_method$_ungrouped$CMPedometerData$distance(_LOGOS_SELF_TYPE_NORMAL CMPedometerData* _LOGOS_SELF_CONST, SEL); static NSDate * (*_logos_orig$_ungrouped$CMPedometerData$startDate)(_LOGOS_SELF_TYPE_NORMAL CMPedometerData* _LOGOS_SELF_CONST, SEL); static NSDate * _logos_method$_ungrouped$CMPedometerData$startDate(_LOGOS_SELF_TYPE_NORMAL CMPedometerData* _LOGOS_SELF_CONST, SEL); static NSDate * (*_logos_orig$_ungrouped$CMPedometerData$endDate)(_LOGOS_SELF_TYPE_NORMAL CMPedometerData* _LOGOS_SELF_CONST, SEL); static NSDate * _logos_method$_ungrouped$CMPedometerData$endDate(_LOGOS_SELF_TYPE_NORMAL CMPedometerData* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIApplication *); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIApplication *); static void _logos_method$_ungrouped$SpringBoard$alertView$clickedButtonAtIndex$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIAlertView *, NSInteger); static void _logos_method$_ungrouped$SpringBoard$btnAction1$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$btnAction2$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$btnAction3$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$btnAction4$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$btnAction5$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$btnAction6$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$btnAction0$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$SpringBoard$handleTapGestures$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void _logos_method$_ungrouped$SpringBoard$handlePanGestures$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIPanGestureRecognizer *); static void _logos_method$_ungrouped$SpringBoard$savePos(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SpringBoard$processPos(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBHomeHardwareButtonActions$performDoublePressDownActions)(_LOGOS_SELF_TYPE_NORMAL SBHomeHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBHomeHardwareButtonActions$performDoublePressDownActions(_LOGOS_SELF_TYPE_NORMAL SBHomeHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static BOOL (*_logos_orig$_ungrouped$UnityAppController$application$didFinishLaunchingWithOptions$)(_LOGOS_SELF_TYPE_NORMAL UnityAppController* _LOGOS_SELF_CONST, SEL, UIApplication *, NSDictionary *); static BOOL _logos_method$_ungrouped$UnityAppController$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL UnityAppController* _LOGOS_SELF_CONST, SEL, UIApplication *, NSDictionary *); static SBAlertItem* (*_logos_orig$_ungrouped$SBAlertItem$init)(_LOGOS_SELF_TYPE_INIT SBAlertItem*, SEL) _LOGOS_RETURN_RETAINED; static SBAlertItem* _logos_method$_ungrouped$SBAlertItem$init(_LOGOS_SELF_TYPE_INIT SBAlertItem*, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$SBAlertItemsController$activateAlertItem$animated$)(_LOGOS_SELF_TYPE_NORMAL SBAlertItemsController* _LOGOS_SELF_CONST, SEL, id, BOOL); static void _logos_method$_ungrouped$SBAlertItemsController$activateAlertItem$animated$(_LOGOS_SELF_TYPE_NORMAL SBAlertItemsController* _LOGOS_SELF_CONST, SEL, id, BOOL); static id (*_logos_meta_orig$_ungrouped$UIAlertController$alertControllerWithTitle$message$preferredStyle$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSString *, NSString *, UIAlertControllerStyle); static id _logos_meta_method$_ungrouped$UIAlertController$alertControllerWithTitle$message$preferredStyle$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, NSString *, NSString *, UIAlertControllerStyle); static void (*_logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$)(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST, SEL, UIViewController *, BOOL, void (^ )(void)); static void _logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST, SEL, UIViewController *, BOOL, void (^ )(void)); 

#line 36 "/Users/j066/Desktop/code/FTweak/JALTweakDemo/JALTweakDemo/JALTweakDemo.xm"

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
        step = array[2].intValue;
        if ([delegateClassName isEqualToString:@"UnityAppController"]) {
            
            
            
        } else if ([appName isEqualToString:@"MapsApp"]) {
            
            
            
        }
    }
}


static void _logos_method$_ungrouped$UIApplication$setDelegate$(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id delegate) {
    appName = NSStringFromClass([self class]);
    delegateClassName = NSStringFromClass([delegate class]);
    NSLog(@"lqj-UIApplication.setDelegate|UIApplicationName=%@|delegate=%@",appName,delegateClassName);
    _logos_orig$_ungrouped$UIApplication$setDelegate$(self, _cmd, delegate);
}


static void _logos_method$_ungrouped$UIApplication$_run(_LOGOS_SELF_TYPE_NORMAL UIApplication* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSMutableDictionary *posDict = [NSMutableDictionary dictionaryWithContentsOfFile:LOCATION_FILE];
    if(posDict) {
        lat = ((NSString *)posDict[@"lat"]).floatValue;
        lon = ((NSString *)posDict[@"lon"]).floatValue;
        step = ((NSString *)posDict[@"step"]).intValue;
        lastDateString = (NSString *)posDict[@"date"];
        if (lastDateString) {
            
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"yyyy-MM-dd"];
            NSString *todayString = [formatter stringFromDate:[NSDate date]];
            
            if (![todayString isEqualToString:lastDateString]) {
                step = 0;
            }
        } else {
            step = 0;
        }
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



#pragma mark - CMStepCounter已失效



typedef void (^CMStepQueryHandler)(NSInteger numberOfSteps, NSError *error);
CMStepQueryHandler orig_queryHandler = nil;
CMStepQueryHandler my_queryHandler = ^(NSInteger numberOfSteps, NSError *error){
    NSLog(@"lqj-CMStepCounter.CMStepQueryHandler|numberOfSteps=%d|error=%@",numberOfSteps,error.localizedDescription);
    if (numberOfSteps == 0) {
        NSLog(@"lqj-CMStepCounter.CMStepQueryHandler cheat!!!!!!!!!|step=%d",step);
        numberOfSteps = step;
        error = nil;
    }
    orig_queryHandler(numberOfSteps,error);
};



static void _logos_method$_ungrouped$CMStepCounter$queryStepCountStartingFrom$to$toQueue$withHandler$(_LOGOS_SELF_TYPE_NORMAL CMStepCounter* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3, id arg4) {
    NSLog(@"lqj-CMStepCounter.queryStepCountStartingFrom|start=%@|end=%@",arg1,arg2);
    orig_queryHandler = [arg4 copy];
    arg4 = my_queryHandler;
    _logos_orig$_ungrouped$CMStepCounter$queryStepCountStartingFrom$to$toQueue$withHandler$(self, _cmd, arg1, arg2, arg3, arg4);
}


#pragma mark - CMPedometer



NSDate *sDate;
NSDate *eDate;
CMPedometerData *pedometerData;

typedef void (^CMPedometerHandler)(CMPedometerData *o, NSError *error);
CMPedometerHandler orig_meterHandler = nil;
CMPedometerHandler my_meterHandler = ^(CMPedometerData *o, NSError *error){
    NSLog(@"lqj-CMPedometer.CMPedometerHandler=%@",o);
    if(!o) {
        NSLog(@"lqj-CMPedometer.CMPedometerHandler cheat!!!!!!!!!");
        Class CMPedometerData_class = objc_getClass("CMPedometerData");
        pedometerData = [[CMPedometerData_class alloc] init];
        o = pedometerData;
        error = nil;
    }
    orig_meterHandler(o,error);
};




static void _logos_method$_ungrouped$CMPedometer$queryPedometerDataFromDate$toDate$withHandler$(_LOGOS_SELF_TYPE_NORMAL CMPedometer* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3) {
    sDate = arg1;
    eDate = arg2;
    if(![arg1 isEqualToDate:arg2]) {
        NSLog(@"lqj-CMPedometer.queryPedometerDataFromDate=%@,%@",arg1,arg2);
        orig_meterHandler = [arg3 copy];
        arg3 = my_meterHandler;
    }
    _logos_orig$_ungrouped$CMPedometer$queryPedometerDataFromDate$toDate$withHandler$(self, _cmd, arg1, arg2, arg3);
}


static BOOL _logos_meta_method$_ungrouped$CMPedometer$isStepCountingAvailable(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    BOOL ret = _logos_meta_orig$_ungrouped$CMPedometer$isStepCountingAvailable(self, _cmd);
    NSLog(@"lqj-CMPedometer.isStepCountingAvailable=%d",ret);
    return YES;
}


static BOOL _logos_meta_method$_ungrouped$CMPedometer$isDistanceAvailable(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    BOOL ret = _logos_meta_orig$_ungrouped$CMPedometer$isDistanceAvailable(self, _cmd);
    NSLog(@"lqj-CMPedometer.isDistanceAvailable=%d",ret);
    return YES;
}





static NSNumber * _logos_method$_ungrouped$CMPedometerData$numberOfSteps(_LOGOS_SELF_TYPE_NORMAL CMPedometerData* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSNumber *num = _logos_orig$_ungrouped$CMPedometerData$numberOfSteps(self, _cmd);
    NSLog(@"lqj-CMPedometerData.numberOfSteps=%@",num);
    num = @(step);
    NSLog(@"lqj-CMPedometerData.numberOfSteps2=%@",num);
    return num;
}


static NSNumber * _logos_method$_ungrouped$CMPedometerData$distance(_LOGOS_SELF_TYPE_NORMAL CMPedometerData* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSNumber *num = _logos_orig$_ungrouped$CMPedometerData$distance(self, _cmd);
    NSLog(@"lqj-CMPedometerData.distance=%@",num);
    num = @((int)(step/1.5));
    NSLog(@"lqj-CMPedometerData.distance2=%@",num);
    return num;
}


static NSDate * _logos_method$_ungrouped$CMPedometerData$startDate(_LOGOS_SELF_TYPE_NORMAL CMPedometerData* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"lqj-CMPedometerData.startDate,%@",sDate);
    return sDate;
}


static NSDate * _logos_method$_ungrouped$CMPedometerData$endDate(_LOGOS_SELF_TYPE_NORMAL CMPedometerData* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"lqj-CMPedometerData.endDate,%@",eDate);
    return eDate;
}


#pragma mark - SpringBoard



HKHealthStore *hkStore;
UIWindow *window;
UIWindow *statusbarWin;
UIButton *btn1;
UIButton *btn2;
UIButton *btn3;
UIButton *btn4;
UIButton *btn;
UIButton *clearBtn;
UIButton *add2000Btn;
UIAlertView *clearAlertView;
UIAlertView *add2000AlertView;
@interface SpringBoard
- (void)btnAction0:(id)btn;
- (void)btnAction1:(id)btn;
- (void)btnAction2:(id)btn;
- (void)btnAction3:(id)btn;
- (void)btnAction4:(id)btn;
- (void)btnAction5:(id)btn;
- (void)btnAction6:(id)btn;
- (void)handlePanGestures:(UIPanGestureRecognizer *)paramSender;
- (void)handleTapGestures:(UITapGestureRecognizer *)gestureRecognizer;
- (void)savePos;
- (void)processPos;
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
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
    btn1.backgroundColor = [UIColor colorWithRed:25/255 green:25/255 blue:25/255 alpha:0.8];
    [btn1 addTarget:self action:@selector(btnAction1:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:btn1];

    btn2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 50, 50)];
    btn2.backgroundColor = [UIColor colorWithRed:25/255 green:25/255 blue:25/255 alpha:0.8];
    [btn2 addTarget:self action:@selector(btnAction2:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:btn2];

    btn3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 50, 50, 50)];
    btn3.backgroundColor = [UIColor colorWithRed:25/255 green:25/255 blue:25/255 alpha:0.8];
    [btn3 addTarget:self action:@selector(btnAction3:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:btn3];

    btn4 = [[UIButton alloc] initWithFrame:CGRectMake(100, 50, 50, 50)];
    btn4.backgroundColor = [UIColor colorWithRed:25/255 green:25/255 blue:25/255 alpha:0.8];
    [btn4 addTarget:self action:@selector(btnAction4:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:btn4];
    
    clearBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:clearBtn.bounds byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(25,25)];
    Class CAShapeLayer_class = objc_getClass("CAShapeLayer");
    
    CAShapeLayer *maskLayer = [[CAShapeLayer_class alloc] init];
    maskLayer.frame = clearBtn.bounds;
    maskLayer.path = maskPath.CGPath;
    clearBtn.layer.mask = maskLayer;
    clearBtn.backgroundColor = UIColor.grayColor;
    clearBtn.titleLabel.font = [UIFont systemFontOfSize:9];
    [clearBtn setTitle:@"步数清0" forState:UIControlStateNormal];
    [clearBtn addTarget:self action:@selector(btnAction5:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:clearBtn];
    
    add2000Btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 0, 50, 50)];
    UIBezierPath *maskPath2 = [UIBezierPath bezierPathWithRoundedRect:add2000Btn.bounds byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(25,25)];
    CAShapeLayer *maskLayer2 = [[CAShapeLayer_class alloc] init];
    maskLayer2.frame = add2000Btn.bounds;
    maskLayer2.path = maskPath2.CGPath;
    add2000Btn.layer.mask = maskLayer2;
    add2000Btn.backgroundColor = UIColor.grayColor;
    add2000Btn.titleLabel.font = [UIFont systemFontOfSize:9];
    [add2000Btn setTitle:@"步数+1000" forState:UIControlStateNormal];
    [add2000Btn addTarget:self action:@selector(btnAction6:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:add2000Btn];

    btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    btn.titleLabel.font = [UIFont systemFontOfSize:9];
    btn.backgroundColor = UIColor.grayColor;
    NSString *stepStr = [NSString stringWithFormat:@"步数%d",step];
    [btn setTitle:stepStr forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction0:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:btn];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestures:)];
    [window addGestureRecognizer:pan];
    window.hidden = YES;

    
    NSMutableDictionary *posDict = [NSMutableDictionary dictionaryWithContentsOfFile:LOCATION_FILE];
    if(!posDict)
        [self savePos];

    
    [ProcessSpringBoard Fun1];
}



static void _logos_method$_ungrouped$SpringBoard$alertView$clickedButtonAtIndex$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIAlertView * alertView, NSInteger buttonIndex) {
    if (alertView == add2000AlertView) {
        if (buttonIndex != 0) {
            step += 1000;
            [self processPos];
        }
    } else if (alertView == clearAlertView) {
        if (buttonIndex != 0) {
            step = 0;
            [self processPos];
        }
    }
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



static void _logos_method$_ungrouped$SpringBoard$btnAction5$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id btn) {
    clearAlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定清0吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [clearAlertView show];
}



static void _logos_method$_ungrouped$SpringBoard$btnAction6$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id btn) {
    add2000AlertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定增加1000吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [add2000AlertView show];
}



static void _logos_method$_ungrouped$SpringBoard$btnAction0$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id btn) {
    if (clearBtn.hidden) {
        clearBtn.hidden = NO;
        add2000Btn.hidden = NO;
    }
    else {
        clearBtn.hidden = YES;
        add2000Btn.hidden = YES;
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
    NSString *stepStr = [NSString stringWithFormat:@"%d",step];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *todayString = [formatter stringFromDate:[NSDate date]];
    if (![lastDateString isEqualToString:todayString]) {
        step = 0;
        lastDateString = todayString;
        stepStr = [NSString stringWithFormat:@"%d",step];
    }
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:latStr forKey:@"lat"];
    [dic setObject:lonStr forKey:@"lon"];
    [dic setObject:stepStr forKey:@"step"];
    [dic setObject:todayString forKey:@"date"];
    [dic writeToFile:LOCATION_FILE atomically:YES];
}



static void _logos_method$_ungrouped$SpringBoard$processPos(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    step += 10 + arc4random()%20;
    NSString *stepStr = [NSString stringWithFormat:@"步数%d",step];
    [btn setTitle:stepStr forState:UIControlStateNormal];
    [self savePos];
    NSString *posStr = [NSString stringWithFormat:@"%f,%f,%d",lat,lon,step];
    CFStringRef yourFriendlyCFString = (__bridge CFStringRef)posStr;
    CFNotificationCenterPostNotification(CFNotificationCenterGetDistributedCenter(), CFSTR("com.lqj.gps-change"), yourFriendlyCFString, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}



#pragma mark - SBHomeHardwareButtonActions





static void _logos_method$_ungrouped$SBHomeHardwareButtonActions$performDoublePressDownActions(_LOGOS_SELF_TYPE_NORMAL SBHomeHardwareButtonActions* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    _logos_orig$_ungrouped$SBHomeHardwareButtonActions$performDoublePressDownActions(self, _cmd);
}


#pragma mark - AppDelegate





static BOOL _logos_method$_ungrouped$UnityAppController$application$didFinishLaunchingWithOptions$(_LOGOS_SELF_TYPE_NORMAL UnityAppController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIApplication * application, NSDictionary * launchOptions) {
    NSLog(@"lqj-UnityAppController.didFinishLaunching");
    _logos_orig$_ungrouped$UnityAppController$application$didFinishLaunchingWithOptions$(self, _cmd, application, launchOptions);
    return YES;
}


#pragma mark - SBAlertItem





static SBAlertItem* _logos_method$_ungrouped$SBAlertItem$init(_LOGOS_SELF_TYPE_INIT SBAlertItem* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    NSLog(@"lqj-SBAlertItem.init");
    return _logos_orig$_ungrouped$SBAlertItem$init(self, _cmd);
    
}





static void _logos_method$_ungrouped$SBAlertItemsController$activateAlertItem$animated$(_LOGOS_SELF_TYPE_NORMAL SBAlertItemsController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, BOOL arg2) {
    NSLog(@"lqj-SBAlertItemsController.activateAlertItem");
    _logos_orig$_ungrouped$SBAlertItemsController$activateAlertItem$animated$(self, _cmd, arg1, arg2); 
}


#pragma mark - UIAlertController





static id _logos_meta_method$_ungrouped$UIAlertController$alertControllerWithTitle$message$preferredStyle$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSString * title, NSString * message, UIAlertControllerStyle preferredStyle) {
    NSLog(@"lqj-UIAlertController.alertControllerWithTitle:%@",title);
    return _logos_meta_orig$_ungrouped$UIAlertController$alertControllerWithTitle$message$preferredStyle$(self, _cmd, title, message, preferredStyle);
}


#pragma mark - UIViewController





static void _logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIViewController * viewControllerToPresent, BOOL flag, void (^ completion)(void)) {
    NSString *name = NSStringFromClass([viewControllerToPresent class]);
    NSLog(@"lqj-UIViewController.presentViewController:%@",name);
    _logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$(self, _cmd, viewControllerToPresent, flag, completion);
}


#pragma mark - 初始化

static __attribute__((constructor)) void _logosLocalCtor_d41b8809(int __unused argc, char __unused **argv, char __unused **envp) {
    NSLog(@"lqj-ctor.JALTweakDemo.xm");
    
    
    
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIApplication = objc_getClass("UIApplication"); MSHookMessageEx(_logos_class$_ungrouped$UIApplication, @selector(setDelegate:), (IMP)&_logos_method$_ungrouped$UIApplication$setDelegate$, (IMP*)&_logos_orig$_ungrouped$UIApplication$setDelegate$);MSHookMessageEx(_logos_class$_ungrouped$UIApplication, @selector(_run), (IMP)&_logos_method$_ungrouped$UIApplication$_run, (IMP*)&_logos_orig$_ungrouped$UIApplication$_run);Class _logos_class$_ungrouped$CLLocation = objc_getClass("CLLocation"); MSHookMessageEx(_logos_class$_ungrouped$CLLocation, @selector(coordinate), (IMP)&_logos_method$_ungrouped$CLLocation$coordinate, (IMP*)&_logos_orig$_ungrouped$CLLocation$coordinate);Class _logos_class$_ungrouped$CMStepCounter = objc_getClass("CMStepCounter"); MSHookMessageEx(_logos_class$_ungrouped$CMStepCounter, @selector(queryStepCountStartingFrom:to:toQueue:withHandler:), (IMP)&_logos_method$_ungrouped$CMStepCounter$queryStepCountStartingFrom$to$toQueue$withHandler$, (IMP*)&_logos_orig$_ungrouped$CMStepCounter$queryStepCountStartingFrom$to$toQueue$withHandler$);Class _logos_class$_ungrouped$CMPedometer = objc_getClass("CMPedometer"); Class _logos_metaclass$_ungrouped$CMPedometer = object_getClass(_logos_class$_ungrouped$CMPedometer); MSHookMessageEx(_logos_class$_ungrouped$CMPedometer, @selector(queryPedometerDataFromDate:toDate:withHandler:), (IMP)&_logos_method$_ungrouped$CMPedometer$queryPedometerDataFromDate$toDate$withHandler$, (IMP*)&_logos_orig$_ungrouped$CMPedometer$queryPedometerDataFromDate$toDate$withHandler$);MSHookMessageEx(_logos_metaclass$_ungrouped$CMPedometer, @selector(isStepCountingAvailable), (IMP)&_logos_meta_method$_ungrouped$CMPedometer$isStepCountingAvailable, (IMP*)&_logos_meta_orig$_ungrouped$CMPedometer$isStepCountingAvailable);MSHookMessageEx(_logos_metaclass$_ungrouped$CMPedometer, @selector(isDistanceAvailable), (IMP)&_logos_meta_method$_ungrouped$CMPedometer$isDistanceAvailable, (IMP*)&_logos_meta_orig$_ungrouped$CMPedometer$isDistanceAvailable);Class _logos_class$_ungrouped$CMPedometerData = objc_getClass("CMPedometerData"); MSHookMessageEx(_logos_class$_ungrouped$CMPedometerData, @selector(numberOfSteps), (IMP)&_logos_method$_ungrouped$CMPedometerData$numberOfSteps, (IMP*)&_logos_orig$_ungrouped$CMPedometerData$numberOfSteps);MSHookMessageEx(_logos_class$_ungrouped$CMPedometerData, @selector(distance), (IMP)&_logos_method$_ungrouped$CMPedometerData$distance, (IMP*)&_logos_orig$_ungrouped$CMPedometerData$distance);MSHookMessageEx(_logos_class$_ungrouped$CMPedometerData, @selector(startDate), (IMP)&_logos_method$_ungrouped$CMPedometerData$startDate, (IMP*)&_logos_orig$_ungrouped$CMPedometerData$startDate);MSHookMessageEx(_logos_class$_ungrouped$CMPedometerData, @selector(endDate), (IMP)&_logos_method$_ungrouped$CMPedometerData$endDate, (IMP*)&_logos_orig$_ungrouped$CMPedometerData$endDate);Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIAlertView *), strlen(@encode(UIAlertView *))); i += strlen(@encode(UIAlertView *)); memcpy(_typeEncoding + i, @encode(NSInteger), strlen(@encode(NSInteger))); i += strlen(@encode(NSInteger)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(alertView:clickedButtonAtIndex:), (IMP)&_logos_method$_ungrouped$SpringBoard$alertView$clickedButtonAtIndex$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(btnAction1:), (IMP)&_logos_method$_ungrouped$SpringBoard$btnAction1$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(btnAction2:), (IMP)&_logos_method$_ungrouped$SpringBoard$btnAction2$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(btnAction3:), (IMP)&_logos_method$_ungrouped$SpringBoard$btnAction3$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(btnAction4:), (IMP)&_logos_method$_ungrouped$SpringBoard$btnAction4$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(btnAction5:), (IMP)&_logos_method$_ungrouped$SpringBoard$btnAction5$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(btnAction6:), (IMP)&_logos_method$_ungrouped$SpringBoard$btnAction6$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(btnAction0:), (IMP)&_logos_method$_ungrouped$SpringBoard$btnAction0$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITapGestureRecognizer *), strlen(@encode(UITapGestureRecognizer *))); i += strlen(@encode(UITapGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(handleTapGestures:), (IMP)&_logos_method$_ungrouped$SpringBoard$handleTapGestures$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIPanGestureRecognizer *), strlen(@encode(UIPanGestureRecognizer *))); i += strlen(@encode(UIPanGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(handlePanGestures:), (IMP)&_logos_method$_ungrouped$SpringBoard$handlePanGestures$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(savePos), (IMP)&_logos_method$_ungrouped$SpringBoard$savePos, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(processPos), (IMP)&_logos_method$_ungrouped$SpringBoard$processPos, _typeEncoding); }Class _logos_class$_ungrouped$SBHomeHardwareButtonActions = objc_getClass("SBHomeHardwareButtonActions"); MSHookMessageEx(_logos_class$_ungrouped$SBHomeHardwareButtonActions, @selector(performDoublePressDownActions), (IMP)&_logos_method$_ungrouped$SBHomeHardwareButtonActions$performDoublePressDownActions, (IMP*)&_logos_orig$_ungrouped$SBHomeHardwareButtonActions$performDoublePressDownActions);Class _logos_class$_ungrouped$UnityAppController = objc_getClass("UnityAppController"); MSHookMessageEx(_logos_class$_ungrouped$UnityAppController, @selector(application:didFinishLaunchingWithOptions:), (IMP)&_logos_method$_ungrouped$UnityAppController$application$didFinishLaunchingWithOptions$, (IMP*)&_logos_orig$_ungrouped$UnityAppController$application$didFinishLaunchingWithOptions$);Class _logos_class$_ungrouped$SBAlertItem = objc_getClass("SBAlertItem"); MSHookMessageEx(_logos_class$_ungrouped$SBAlertItem, @selector(init), (IMP)&_logos_method$_ungrouped$SBAlertItem$init, (IMP*)&_logos_orig$_ungrouped$SBAlertItem$init);Class _logos_class$_ungrouped$SBAlertItemsController = objc_getClass("SBAlertItemsController"); MSHookMessageEx(_logos_class$_ungrouped$SBAlertItemsController, @selector(activateAlertItem:animated:), (IMP)&_logos_method$_ungrouped$SBAlertItemsController$activateAlertItem$animated$, (IMP*)&_logos_orig$_ungrouped$SBAlertItemsController$activateAlertItem$animated$);Class _logos_class$_ungrouped$UIAlertController = objc_getClass("UIAlertController"); Class _logos_metaclass$_ungrouped$UIAlertController = object_getClass(_logos_class$_ungrouped$UIAlertController); MSHookMessageEx(_logos_metaclass$_ungrouped$UIAlertController, @selector(alertControllerWithTitle:message:preferredStyle:), (IMP)&_logos_meta_method$_ungrouped$UIAlertController$alertControllerWithTitle$message$preferredStyle$, (IMP*)&_logos_meta_orig$_ungrouped$UIAlertController$alertControllerWithTitle$message$preferredStyle$);Class _logos_class$_ungrouped$UIViewController = objc_getClass("UIViewController"); MSHookMessageEx(_logos_class$_ungrouped$UIViewController, @selector(presentViewController:animated:completion:), (IMP)&_logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$, (IMP*)&_logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$);} }
#line 568 "/Users/j066/Desktop/code/FTweak/JALTweakDemo/JALTweakDemo/JALTweakDemo.xm"
