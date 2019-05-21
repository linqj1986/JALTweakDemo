#line 1 "/Users/j066/Desktop/code/FTweak/JALTweakDemo/JALTweakDemo/UIDeviceTweak.xm"


#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>
#import <sys/utsname.h>
#import <sys/sysctl.h>

#pragma mark - 设备型号


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

@class UIDevice; 
static UIUserInterfaceIdiom (*_logos_orig$_ungrouped$UIDevice$userInterfaceIdiom)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static UIUserInterfaceIdiom _logos_method$_ungrouped$UIDevice$userInterfaceIdiom(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static NSString * (*_logos_orig$_ungrouped$UIDevice$model)(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); static NSString * _logos_method$_ungrouped$UIDevice$model(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST, SEL); 

#line 13 "/Users/j066/Desktop/code/FTweak/JALTweakDemo/JALTweakDemo/UIDeviceTweak.xm"


static UIUserInterfaceIdiom _logos_method$_ungrouped$UIDevice$userInterfaceIdiom(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"lqj-UIDevice.userInterfaceIdiom=%d",_logos_orig$_ungrouped$UIDevice$userInterfaceIdiom(self, _cmd));
    return UIUserInterfaceIdiomPad;
}


static NSString * _logos_method$_ungrouped$UIDevice$model(_LOGOS_SELF_TYPE_NORMAL UIDevice* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    NSLog(@"lqj-UIDevice.model=%@",_logos_orig$_ungrouped$UIDevice$model(self, _cmd));
    return @"iPad";
}


int (*orig_sysctlbyname)(const char *name, void *oldp, size_t *oldlenp, void *newp, size_t newlen);
static int my_sysctlbyname(const char *name, void *oldp, size_t *oldlenp, void *newp, size_t newlen)
{
    if (strcmp(name,"hw.machine") == 0) {
        if (oldp != NULL) {
            int ret = orig_sysctlbyname(name,oldp,oldlenp,newp,newlen);
            const char* mechine = "iPad5,3";
            strncpy((char *)oldp,mechine,strlen(mechine));
            NSLog(@"lqj-mysysctlbyname|oldp=%s",oldp);
            return ret;
        }else{
            int ret = orig_sysctlbyname(name,oldp,oldlenp,newp,newlen);
            return ret;
        }
    }else{
        return orig_sysctlbyname(name,oldp,oldlenp,newp,newlen);
    }
}

int (*orig_uname)(struct utsname *uts);
static int my_uname(struct utsname *uts)
{
    int result = 0;
    NSString *nickname = @"ipad";
    NSString *productType = @"iPad5,3";
    if (nickname.length == 0)
        result = orig_uname(uts);
    else
    {
        strncpy(uts->nodename, [nickname UTF8String], nickname.length+1);
        strncpy(uts->machine, [productType UTF8String], productType.length+1);
    }
    return result;
}

#pragma mark - 初始化

static __attribute__((constructor)) void _logosLocalCtor_4bc127fe(int __unused argc, char __unused **argv, char __unused **envp) {
    NSLog(@"lqj-ctor.UIDeviceTweak.xm");
    
    MSHookFunction((void *)sysctlbyname, (void *)my_sysctlbyname, (void **)&orig_sysctlbyname);
    MSHookFunction((void *)uname, (void *)my_uname, (void **)&orig_uname);
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIDevice = objc_getClass("UIDevice"); MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(userInterfaceIdiom), (IMP)&_logos_method$_ungrouped$UIDevice$userInterfaceIdiom, (IMP*)&_logos_orig$_ungrouped$UIDevice$userInterfaceIdiom);MSHookMessageEx(_logos_class$_ungrouped$UIDevice, @selector(model), (IMP)&_logos_method$_ungrouped$UIDevice$model, (IMP*)&_logos_orig$_ungrouped$UIDevice$model);} }
#line 70 "/Users/j066/Desktop/code/FTweak/JALTweakDemo/JALTweakDemo/UIDeviceTweak.xm"
