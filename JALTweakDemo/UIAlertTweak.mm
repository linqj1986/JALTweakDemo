#line 1 "/Users/j066/Desktop/code/FTweak/JALTweakDemo/JALTweakDemo/UIAlertTweak.xm"







#import <UIKit/UIKit.h>

#pragma mark - SBAlertItem




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

@class SBAlertItemsController; @class SBAlertItem; @class UIAlertView; @class UIViewController; 
static SBAlertItem* (*_logos_orig$_ungrouped$SBAlertItem$init)(_LOGOS_SELF_TYPE_INIT SBAlertItem*, SEL) _LOGOS_RETURN_RETAINED; static SBAlertItem* _logos_method$_ungrouped$SBAlertItem$init(_LOGOS_SELF_TYPE_INIT SBAlertItem*, SEL) _LOGOS_RETURN_RETAINED; static void (*_logos_orig$_ungrouped$SBAlertItemsController$activateAlertItem$animated$)(_LOGOS_SELF_TYPE_NORMAL SBAlertItemsController* _LOGOS_SELF_CONST, SEL, id, BOOL); static void _logos_method$_ungrouped$SBAlertItemsController$activateAlertItem$animated$(_LOGOS_SELF_TYPE_NORMAL SBAlertItemsController* _LOGOS_SELF_CONST, SEL, id, BOOL); static void (*_logos_orig$_ungrouped$UIAlertView$show)(_LOGOS_SELF_TYPE_NORMAL UIAlertView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$UIAlertView$show(_LOGOS_SELF_TYPE_NORMAL UIAlertView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$)(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST, SEL, UIViewController *, BOOL, void (^ )(void)); static void _logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST, SEL, UIViewController *, BOOL, void (^ )(void)); 

#line 14 "/Users/j066/Desktop/code/FTweak/JALTweakDemo/JALTweakDemo/UIAlertTweak.xm"


static SBAlertItem* _logos_method$_ungrouped$SBAlertItem$init(_LOGOS_SELF_TYPE_INIT SBAlertItem* __unused self, SEL __unused _cmd) _LOGOS_RETURN_RETAINED {
    NSLog(@"lqj-SBAlertItem.init");
    return _logos_orig$_ungrouped$SBAlertItem$init(self, _cmd);
    
}





static void _logos_method$_ungrouped$SBAlertItemsController$activateAlertItem$animated$(_LOGOS_SELF_TYPE_NORMAL SBAlertItemsController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, BOOL arg2) {
    NSLog(@"lqj-SBAlertItemsController.activateAlertItem");
    _logos_orig$_ungrouped$SBAlertItemsController$activateAlertItem$animated$(self, _cmd, arg1, arg2); 
}


#pragma mark - UIAlertView


static void _logos_method$_ungrouped$UIAlertView$show(_LOGOS_SELF_TYPE_NORMAL UIAlertView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    
    NSLog(@"lqj-UIAlertView.show");
    _logos_orig$_ungrouped$UIAlertView$show(self, _cmd);
}













#pragma mark - UIViewController





static void _logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$(_LOGOS_SELF_TYPE_NORMAL UIViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIViewController * viewControllerToPresent, BOOL flag, void (^ completion)(void)) {
    
    NSString *name = NSStringFromClass([viewControllerToPresent class]);
    NSLog(@"lqj-UIViewController.presentViewController:%@",name);
    if ([name isEqualToString:@"UIAlertController"] || [name isEqualToString:@"_SBAlertController"]) {
        
    }
    _logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$(self, _cmd, viewControllerToPresent, flag, completion);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBAlertItem = objc_getClass("SBAlertItem"); MSHookMessageEx(_logos_class$_ungrouped$SBAlertItem, @selector(init), (IMP)&_logos_method$_ungrouped$SBAlertItem$init, (IMP*)&_logos_orig$_ungrouped$SBAlertItem$init);Class _logos_class$_ungrouped$SBAlertItemsController = objc_getClass("SBAlertItemsController"); MSHookMessageEx(_logos_class$_ungrouped$SBAlertItemsController, @selector(activateAlertItem:animated:), (IMP)&_logos_method$_ungrouped$SBAlertItemsController$activateAlertItem$animated$, (IMP*)&_logos_orig$_ungrouped$SBAlertItemsController$activateAlertItem$animated$);Class _logos_class$_ungrouped$UIAlertView = objc_getClass("UIAlertView"); MSHookMessageEx(_logos_class$_ungrouped$UIAlertView, @selector(show), (IMP)&_logos_method$_ungrouped$UIAlertView$show, (IMP*)&_logos_orig$_ungrouped$UIAlertView$show);Class _logos_class$_ungrouped$UIViewController = objc_getClass("UIViewController"); MSHookMessageEx(_logos_class$_ungrouped$UIViewController, @selector(presentViewController:animated:completion:), (IMP)&_logos_method$_ungrouped$UIViewController$presentViewController$animated$completion$, (IMP*)&_logos_orig$_ungrouped$UIViewController$presentViewController$animated$completion$);} }
#line 69 "/Users/j066/Desktop/code/FTweak/JALTweakDemo/JALTweakDemo/UIAlertTweak.xm"
