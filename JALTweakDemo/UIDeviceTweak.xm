// See http://iphonedevwiki.net/index.php/Logos

#if TARGET_OS_SIMULATOR
#error Do not support the simulator, please use the real iPhone Device.
#endif

#import <UIKit/UIKit.h>
#import <sys/utsname.h>
#import <sys/sysctl.h>

#pragma mark - 设备型号

%hook UIDevice
- (UIUserInterfaceIdiom)userInterfaceIdiom
{
    NSLog(@"lqj-UIDevice.userInterfaceIdiom=%d",%orig);
    return UIUserInterfaceIdiomPad;
}

- (NSString *)model
{
    NSLog(@"lqj-UIDevice.model=%@",%orig);
    return @"iPad";
}
%end

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

%ctor {
    NSLog(@"lqj-ctor.UIDeviceTweak.xm");
    
    MSHookFunction((void *)sysctlbyname, (void *)my_sysctlbyname, (void **)&orig_sysctlbyname);
    MSHookFunction((void *)uname, (void *)my_uname, (void **)&orig_uname);
}
