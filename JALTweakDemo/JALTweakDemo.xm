// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif


/****************************************************
    1.hook所有进程 com.apple.UIKit
****************************************************/


#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreLocation/CLLocationManager.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreMotion/CMStepCounter.h>
#import <UIKit/UIAlertController.h>
#import <CoreMotion/CMPedometer.h>
#import <HealthKit/HealthKit.h>
#import <HealthKit/HKSource.h>
#import "ProcessSpringBoard.h"

NSString *LOCATION_FILE = @"/var/mobile/Library/Preferences/lqj.plist";
double lat = 26.0646090000;
double lon = 119.2042990000;
int step = 6133;
extern "C" CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void);

#pragma mark - UIApplication
/****************************************************
    UIApplication
****************************************************/
%hook UIApplication
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
            //Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
            //NSObject* workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
            //[workspace performSelector:@selector(openApplicationWithBundleID:) withObject:@"com.tencent.yuling"];
        } else if ([appName isEqualToString:@"MapsApp"]) {
            //Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
            //NSObject* workspace = [LSApplicationWorkspace_class performSelector:@selector(defaultWorkspace)];
            //[workspace performSelector:@selector(openApplicationWithBundleID:) withObject:@"com.apple.Maps"];
        }
    }
}

- (void)setDelegate:(id)delegate
{
    appName = NSStringFromClass([self class]);
    delegateClassName = NSStringFromClass([delegate class]);
    NSLog(@"lqj-UIApplication.setDelegate|UIApplicationName=%@|delegate=%@",appName,delegateClassName);
    %orig;
}

- (void)_run
{
    NSMutableDictionary *posDict = [NSMutableDictionary dictionaryWithContentsOfFile:LOCATION_FILE];
    if(posDict) {
        lat = ((NSString *)posDict[@"lat"]).floatValue;
        lon = ((NSString *)posDict[@"lon"]).floatValue;
        step = ((NSString *)posDict[@"step"]).intValue;
        NSString *lastDateString = (NSString *)posDict[@"date"];
        if (lastDateString) {
            //NSString * todayString = [[[NSDate date] description] substringToIndex:10];
            //NSString * lastDateString =  [lastDateString substringToIndex:10];
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

    %orig;
}
%end


#pragma mark - CLLocationManager
/****************************************************
 CLLocationManager
 ****************************************************/
%hook CLLocationManager


%end

#pragma mark - CLLocation
/****************************************************
    CLLocation
****************************************************/
%hook CLLocation

- (CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D oldCoordinate = %orig;
    oldCoordinate.latitude = lat;//新的latitude
    oldCoordinate.longitude = lon;//新的longitude
    return oldCoordinate;
}

%end

#pragma mark - CMStepCounter已失效
/****************************************************
    CMStepCounter
 ****************************************************/
typedef void (^CMStepQueryHandler)(NSInteger numberOfSteps, NSError *error);
CMStepQueryHandler origHandler = nil;

CMStepQueryHandler newHandler = ^(NSInteger numberOfSteps, NSError *error){
    //numberOfSteps = 20301;
    origHandler(numberOfSteps,error);
};

%hook CMStepCounter
- (void)queryStepCountStartingFrom:(id)arg1 to:(id)arg2 toQueue:(id)arg3 withHandler:(id)arg4
{
    NSLog(@"lqj-queryStepCountStartingFrom");
    origHandler = [arg4 copy];
    arg4 = newHandler;
}
%end

#pragma mark - CMPedometer
/****************************************************
    CMPedometer
 ****************************************************/
typedef void (^CMPedometerHandler)(CMPedometerData *o, NSError *error);
CMPedometerHandler origHandler2 = nil;
NSDate *sDate;
NSDate *eDate;
CMPedometerData *pedometerData;
CMPedometerHandler newHandler2 = ^(CMPedometerData *o, NSError *error){
    NSLog(@"lqj-CMPedometer.CMPedometerHandler=%@",o);
    if(!o) {
        NSLog(@"lqj-CMPedometer.CMPedometerHandler cheat!!!!!!!!!");
        Class CMPedometerData_class = objc_getClass("CMPedometerData");
        pedometerData = [[CMPedometerData_class alloc] init];
        o = pedometerData;
        error = nil;
    }
    origHandler2(o,error);
};

%hook CMPedometer

+ (BOOL)isStepCountingAvailable
{
    BOOL ret = %orig;
    NSLog(@"lqj-CMPedometer.isStepCountingAvailable=%d",ret);
    return YES;
}

+ (BOOL)isDistanceAvailable
{
    BOOL ret = %orig;
    NSLog(@"lqj-CMPedometer.isDistanceAvailable=%d",ret);
    return YES;
}

- (void)queryPedometerDataFromDate:(id)arg1 toDate:(id)arg2 withHandler:(id)arg3
{
    sDate = arg1;
    eDate = arg2;
    if(![arg1 isEqualToDate:arg2]) {
        NSLog(@"lqj-CMPedometer.queryPedometerDataFromDate=%@,%@",arg1,arg2);
        origHandler2 = [arg3 copy];
        arg3 = newHandler2;
    }
    %orig;
}

%end

%hook CMPedometerData
- (NSNumber *)numberOfSteps
{
    NSNumber *num = %orig;
    NSLog(@"lqj-CMPedometerData.numberOfSteps=%@",num);
    num = @(step);
    NSLog(@"lqj-CMPedometerData.numberOfSteps2=%@",num);
    return num;
}

- (NSNumber *)distance
{
    NSNumber *num = %orig;
    NSLog(@"lqj-CMPedometerData.distance=%@",num);
    num = @(step/2);
    NSLog(@"lqj-CMPedometerData.distance2=%@",num);
    return num;
}

- (NSDate *)startDate
{
    NSLog(@"lqj-CMPedometerData.startDate,%@",sDate);
    return sDate;
}

- (NSDate *)endDate
{
    NSLog(@"lqj-CMPedometerData.endDate,%@",eDate);
    return eDate;
}
%end

#pragma mark - SpringBoard
/****************************************************
    SpringBoard
****************************************************/
HKHealthStore *hkStore;
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

%hook SpringBoard

//SBModalAlertPresenter
//SBScreenshotManager
- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    %orig;

    // 顶部系统状态栏响应window
    statusbarWin = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    UIColor *color = [UIColor colorWithRed:0/255 green:0/255 blue:0/255 alpha:0.05];
    statusbarWin.backgroundColor = color;
    statusbarWin.windowLevel = UIWindowLevelAlert;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestures:)];
    [statusbarWin addGestureRecognizer:tap];
    statusbarWin.hidden = NO;

    // 悬浮窗window
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

    btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    btn.titleLabel.font = [UIFont systemFontOfSize:9];
    btn.backgroundColor = UIColor.grayColor;
    NSString *stepStr = [NSString stringWithFormat:@"步数%d",step];
    [btn setTitle:stepStr forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction0:) forControlEvents:UIControlEventTouchUpInside];
    [window addSubview:btn];

    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGestures:)];
    [window addGestureRecognizer:pan];
    window.hidden = NO;

    // 位置文件不存在则创建
    NSMutableDictionary *posDict = [NSMutableDictionary dictionaryWithContentsOfFile:LOCATION_FILE];
    if(!posDict)
        [self savePos];

    //test
    [ProcessSpringBoard Fun1];
}

%new
- (void)btnAction1:(id)btn
{
    lat += 0.0002;
    [self processPos];
}

%new
- (void)btnAction2:(id)btn
{
    lat -= 0.0002;
    [self processPos];
}

%new
- (void)btnAction3:(id)btn
{
    lon -= 0.0002;
    [self processPos];
}

%new
- (void)btnAction4:(id)btn
{
    lon += 0.0002;
    [self processPos];
}

%new
- (void)btnAction0:(id)btn
{
    if (!window.hidden) {
        window.hidden = YES;
    }
}

%new
- (void)handleTapGestures:(UITapGestureRecognizer *)gestureRecognizer
{
    window.hidden = NO;
}

%new
- (void)handlePanGestures:(UIPanGestureRecognizer *)paramSender
{
    if (paramSender.state != UIGestureRecognizerStateEnded && paramSender.state != UIGestureRecognizerStateFailed){

        CGPoint location = [paramSender locationInView:[UIApplication sharedApplication].keyWindow];
        int x = location.x - window.bounds.size.width/2;
        int y = location.y - window.bounds.size.height/2;
        [window setFrame:CGRectMake(x, y, 150, 150)];
    }
}

%new
- (void)savePos
{
    NSString *latStr = [NSString stringWithFormat:@"%f",lat];
    NSString *lonStr = [NSString stringWithFormat:@"%f",lon];
    NSString *stepStr = [NSString stringWithFormat:@"%d",step];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *todayString = [formatter stringFromDate:[NSDate date]];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:latStr forKey:@"lat"];
    [dic setObject:lonStr forKey:@"lon"];
    [dic setObject:stepStr forKey:@"step"];
    [dic setObject:todayString forKey:@"date"];
    [dic writeToFile:LOCATION_FILE atomically:YES];
}

%new
- (void)processPos
{
    step += 10 + arc4random()%20;
    NSString *stepStr = [NSString stringWithFormat:@"步数%d",step];
    [btn setTitle:stepStr forState:UIControlStateNormal];
    [self savePos];
    NSString *posStr = [NSString stringWithFormat:@"%f,%f,%d",lat,lon,step];
    CFStringRef yourFriendlyCFString = (__bridge CFStringRef)posStr;
    CFNotificationCenterPostNotification(CFNotificationCenterGetDistributedCenter(), CFSTR("com.lqj.gps-change"), yourFriendlyCFString, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}

%end

#pragma mark - SBHomeHardwareButtonActions
/****************************************************
   双击home键
****************************************************/
%hook SBHomeHardwareButtonActions
- (void)performDoublePressDownActions
{
    %orig;
}
%end

#pragma mark - AppDelegate
/****************************************************
    新的appdelegate - MapsAppDelegate、AppDelegate、UnityAppController
****************************************************/
%hook UnityAppController
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"lqj-UnityAppController.didFinishLaunching");
    %orig;
    return YES;
}
%end

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

#pragma mark - UIAlertController
/****************************************************
    UIAlertController
 ****************************************************/
%hook UIAlertController
+ (id)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    NSLog(@"lqj-UIAlertController.alertControllerWithTitle:%@",title);
    return %orig;
}
%end

#pragma mark - UIViewController
/****************************************************
    UIViewController
 ****************************************************/
%hook UIViewController
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ )(void))completion
{
    NSString *name = NSStringFromClass([viewControllerToPresent class]);
    NSLog(@"lqj-UIViewController.presentViewController:%@",name);
    %orig;
}
%end

