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
#import "ProcessSpringBoard.h"

double lat = 26.0646090000;
double lon = 119.2042990000;
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
    NSLog(@"lqj-setDelegate|appName=%@|delegate=%@",appName,delegateClassName);
    %orig;
}

- (void)_run
{
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

#pragma mark - SpringBoard
/****************************************************
    SpringBoard
****************************************************/
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

    // 位置文件不存在则创建
    NSMutableDictionary *posDict = [NSMutableDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/lqj.plist"];
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
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:latStr forKey:@"lat"];
    [dic setObject:lonStr forKey:@"lon"];
    [dic writeToFile:@"/var/mobile/Library/Preferences/lqj.plist" atomically:YES];
}

%new
- (void)processPos
{
    [self savePos];
    NSString *posStr = [NSString stringWithFormat:@"%f,%f",lat,lon];
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
    NSLog(@"lqj-AppDelegate=UnityAppController");
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
    NSLog(@"lqj-SBAlertItem filter");
    return %orig;
    //return nil; //可以屏蔽弹窗
}

%end

%hook SBAlertItemsController
- (void)activateAlertItem:(id)arg1 animated:(BOOL)arg2
{
    NSLog(@"lqj-SBAlertItemsController");
    %orig; //可以屏蔽弹窗
}
%end

#pragma mark - SBUIController
/****************************************************
    屏蔽桌面启动app
 ****************************************************/
%hook SBUIController
-(void)activateApplication:(id)arg1 fromIcon:(id)arg2 location:(long long)arg3 activationSettings:(id)arg4 actions:(id)arg5
{
    NSLog(@"lqj-activateApplication=%@",arg1);
    if ([[arg1 bundleIdentifier] isEqualToString:@"com.tencent.yuling"])
    {
        return;
    }
    %orig;
}

- (void)activateApplicationAnimated:(SBApplication *)arg1
{
    if ([[arg1 bundleIdentifier] isEqualToString:@"com.tencent.yuling"])
    {
        return;
    }
    %orig;
}
%end

#pragma mark - UIAlertController
/****************************************************
    UIAlertController
 ****************************************************/
%hook UIAlertController
+ (id)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle
{
    NSLog(@"lqj-alertControllerWithTitle:%@",title);
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
    NSLog(@"lqj-presentViewController:%@",name);
    %orig;
}
%end

