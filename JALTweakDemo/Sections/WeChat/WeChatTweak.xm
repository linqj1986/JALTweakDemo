//
//  WeChatTweak.m
//  JALTweakDemo
//
//  Created by j066 on 2019/5/17.
//

#import <UIKit/UIKit.h>
#import <CaptainHook/CaptainHook.h>
#import <WBSettingViewController.h>
#import "WeChatRedEnvelop.h"
#import "WeChatRedEnvelopParam.h"
#import "WBSettingViewController.h"
#import "WBReceiveRedEnvelopOperation.h"
#import "WBRedEnvelopTaskManager.h"
#import "WBRedEnvelopConfig.h"
#import "WBRedEnvelopParamQueue.h"

#pragma mark - CMessageMgr

%hook CMessageMgr
- (void)AsyncOnAddMsg:(NSString*)msg MsgWrap:(CMessageWrap*)wrap
{
    NSLog(@"lqj-WeChatTweak.AsyncOnAddMsg=%@",wrap.m_nsContent);
    %orig;
    switch(wrap.m_uiMessageType) {
        case 49: { // AppNode
            /** 是否为红包消息 */
            BOOL (^isRedEnvelopMessage)() = ^BOOL() {
                return [wrap.m_nsContent rangeOfString:@"https://wxapp.tenpay.com/mmpayhb/wxhb"].location != NSNotFound;
            };
            
            if (isRedEnvelopMessage()) { // 红包
                CContactMgr *contactManager = [[objc_getClass("MMServiceCenter") defaultCenter] getService:objc_getClass("CContactMgr")];
                CContact *selfContact = [contactManager getSelfContact];
                
                BOOL (^isSender)() = ^BOOL() {
                    return [wrap.m_nsFromUsr isEqualToString:selfContact.m_nsUsrName];
                };
                
                /** 是否别人在群聊中發消息 */
                BOOL (^isGroupReceiver)() = ^BOOL() {
                    return [wrap.m_nsFromUsr rangeOfString:@"@chatroom"].location != NSNotFound;
                };
                
                /** 是否自己在群聊中發消息 */
                BOOL (^isGroupSender)() = ^BOOL() {
                    return isSender() && [wrap.m_nsToUsr rangeOfString:@"chatroom"].location != NSNotFound;
                };
                
                /** 是否搶自己發的红包 */
                BOOL (^isReceiveSelfRedEnvelop)() = ^BOOL() {
                    return [WBRedEnvelopConfig sharedConfig].receiveSelfRedEnvelop;
                };
                
                /** 是否在黑名单中 */
                BOOL (^isGroupInBlackList)() = ^BOOL() {
                    return [[WBRedEnvelopConfig sharedConfig].blackList containsObject:wrap.m_nsFromUsr];
                };
                
                /** 是否自動搶红包 */
                BOOL (^shouldReceiveRedEnvelop)() = ^BOOL() {
                    /*if (![WBRedEnvelopConfig sharedConfig].autoReceiveEnable) { return NO; }
                     if (isGroupInBlackList()) { return NO; }
                     
                     return isGroupReceiver() || (isGroupSender() && isReceiveSelfRedEnvelop());*/
                    return [WBRedEnvelopConfig sharedConfig].autoReceiveEnable;
                };
                
                NSDictionary *(^parseNativeUrl)(NSString *nativeUrl) = ^(NSString *nativeUrl) {
                    nativeUrl = [nativeUrl substringFromIndex:[@"wxpay://c2cbizmessagehandler/hongbao/receivehongbao?" length]];
                    return [objc_getClass("WCBizUtil") dictionaryWithDecodedComponets:nativeUrl separator:@"&"];
                };
                
                /** 获取服务端验证参数 */
                void (^queryRedEnvelopesReqeust)(NSDictionary *nativeUrlDict) = ^(NSDictionary *nativeUrlDict) {
                    NSMutableDictionary *params = [@{} mutableCopy];
                    params[@"agreeDuty"] = @"0";
                    params[@"channelId"] = [nativeUrlDict stringForKey:@"channelid"];
                    params[@"inWay"] = @"0";
                    params[@"msgType"] = [nativeUrlDict stringForKey:@"msgtype"];
                    params[@"nativeUrl"] = [[wrap m_oWCPayInfoItem] m_c2cNativeUrl];
                    params[@"sendId"] = [nativeUrlDict stringForKey:@"sendid"];
                    
                    WCRedEnvelopesLogicMgr *logicMgr = [[objc_getClass("MMServiceCenter") defaultCenter] getService:[objc_getClass("WCRedEnvelopesLogicMgr") class]];
                    [logicMgr ReceiverQueryRedEnvelopesRequest:params];
                };
                
                /** 储存参数 */
                void (^enqueueParam)(NSDictionary *nativeUrlDict) = ^(NSDictionary *nativeUrlDict) {
                    WeChatRedEnvelopParam *mgrParams = [[WeChatRedEnvelopParam alloc] init];
                    mgrParams.msgType = [nativeUrlDict stringForKey:@"msgtype"];
                    mgrParams.sendId = [nativeUrlDict stringForKey:@"sendid"];
                    mgrParams.channelId = [nativeUrlDict stringForKey:@"channelid"];
                    mgrParams.nickName = [selfContact getContactDisplayName];
                    mgrParams.headImg = [selfContact m_nsHeadImgUrl];
                    mgrParams.nativeUrl = [[wrap m_oWCPayInfoItem] m_c2cNativeUrl];
                    mgrParams.sessionUserName = isGroupSender() ? wrap.m_nsToUsr : wrap.m_nsFromUsr;
                    mgrParams.sign = [nativeUrlDict stringForKey:@"sign"];
                    
                    mgrParams.isGroupSender = isGroupSender();
                    
                    [[WBRedEnvelopParamQueue sharedQueue] enqueue:mgrParams];
                };
                
                if (shouldReceiveRedEnvelop()) {
                    NSLog(@"lqj-WeChatTweak.shouldReceiveRedEnvelop");
                    NSString *nativeUrl = [[wrap m_oWCPayInfoItem] m_c2cNativeUrl];
                    NSDictionary *nativeUrlDict = parseNativeUrl(nativeUrl);
                    
                    queryRedEnvelopesReqeust(nativeUrlDict);
                    enqueueParam(nativeUrlDict);
                }
            }
            break;
        }
        default:
            break;
    }
}

- (void)onRevokeMsg:(id)arg1
{
    NSLog(@"lqj-WeChatTweak.CMessageMgr.onRevokeMsg");
    if ([WBRedEnvelopConfig sharedConfig].revokeEnable)
        return;
    else
        %orig;
}

- (void)DelMsg:(id)arg1 MsgList:(id)arg2 DelAll:(_Bool)arg3
{
    NSLog(@"lqj-WeChatTweak.CMessageMgr.DelMsg=%@",arg1);
    %orig;
}

%end

#pragma mark - MicroMessengerAppDelegate
/**************************************
 optimized methods
 CHOptimizedMethod0、1、2 (need calls CHHook in CHConstructor)
 **************************************/
CHDeclareClass(MicroMessengerAppDelegate)
CHOptimizedMethod2(self, BOOL, MicroMessengerAppDelegate, application, UIApplication*, application, didFinishLaunchingWithOptions, NSDictionary*, launchOptions)
{
    NSLog(@"lqj-WeChatTweak.MicroMessengerAppDelegate");
    return CHSuper2(MicroMessengerAppDelegate, application, application, didFinishLaunchingWithOptions, launchOptions);
}

#pragma mark - WCRedEnvelopesLogicMgr
/**************************************
 Declarative style methods
 CHDeclareMethod0、1、2 (automatically calls CHHook)
 CHDeclareMethod2(self,return_val,fun_name, arg1_type, arg1, arg2_name, arg2_type, arg2)
 **************************************/
CHDeclareClass(WCRedEnvelopesLogicMgr)
CHDeclareMethod2(void, WCRedEnvelopesLogicMgr, OnWCToHongbaoCommonResponse, HongBaoRes*, arg1, Request, HongBaoReq*, arg2)
{
    NSLog(@"lqj-WeChatTweak.OnWCToHongbaoCommonResponse=%@,%@",arg1,arg2);
    CHSuper2(WCRedEnvelopesLogicMgr, OnWCToHongbaoCommonResponse, arg1, Request, arg2);
    
    // 非参数查询请求
    if (arg1.cgiCmdid != 3) { return; }
    
    NSString *(^parseRequestSign)() = ^NSString *() {
        NSString *requestString = [[NSString alloc] initWithData:arg2.reqText.buffer encoding:NSUTF8StringEncoding];
        NSDictionary *requestDictionary = [objc_getClass("WCBizUtil") dictionaryWithDecodedComponets:requestString separator:@"&"];
        NSString *nativeUrl = [[requestDictionary stringForKey:@"nativeUrl"] stringByRemovingPercentEncoding];
        NSDictionary *nativeUrlDict = [objc_getClass("WCBizUtil") dictionaryWithDecodedComponets:nativeUrl separator:@"&"];
        
        return [nativeUrlDict stringForKey:@"sign"];
    };
    
    NSDictionary *responseDict = [[[NSString alloc] initWithData:arg1.retText.buffer encoding:NSUTF8StringEncoding] JSONDictionary];
    
    WeChatRedEnvelopParam *mgrParams = [[WBRedEnvelopParamQueue sharedQueue] dequeue];
    
    BOOL (^shouldReceiveRedEnvelop)() = ^BOOL() {
        
        // 手动搶红包
        if (!mgrParams) { return NO; }
        
        // 自己已经搶过
        if ([responseDict[@"receiveStatus"] integerValue] == 2) { return NO; }
        
        // 红包被搶完
        if ([responseDict[@"hbStatus"] integerValue] == 4) { return NO; }
        
        // 没有这個字段会被判定为使用外挂
        if (!responseDict[@"timingIdentifier"]) { return NO; }
        
        if (mgrParams.isGroupSender) { // 自己發红包的時候没有 sign 字段
            return [WBRedEnvelopConfig sharedConfig].autoReceiveEnable;
        } else {
            return [parseRequestSign() isEqualToString:mgrParams.sign] && [WBRedEnvelopConfig sharedConfig].autoReceiveEnable;
        }
    };
    
    if (shouldReceiveRedEnvelop()) {
        mgrParams.timingIdentifier = responseDict[@"timingIdentifier"];
        
        unsigned int delaySeconds = [self calculateDelaySeconds];
        WBReceiveRedEnvelopOperation *operation = [[WBReceiveRedEnvelopOperation alloc] initWithRedEnvelopParam:mgrParams delay:delaySeconds];
        
        if ([WBRedEnvelopConfig sharedConfig].serialReceive) {
            [[WBRedEnvelopTaskManager sharedManager] addSerialTask:operation];
        } else {
            [[WBRedEnvelopTaskManager sharedManager] addNormalTask:operation];
        }
    }
}

CHDeclareMethod0(unsigned int, WCRedEnvelopesLogicMgr, calculateDelaySeconds)
{
    NSInteger configDelaySeconds = [WBRedEnvelopConfig sharedConfig].delaySeconds;
    
    if ([WBRedEnvelopConfig sharedConfig].serialReceive) {
        unsigned int serialDelaySeconds;
        if ([WBRedEnvelopTaskManager sharedManager].serialQueueIsEmpty) {
            serialDelaySeconds = configDelaySeconds;
        } else {
            serialDelaySeconds = 15;
        }
        
        return serialDelaySeconds;
    } else {
        return (unsigned int)configDelaySeconds;
    }
}

#pragma mark - NewSettingViewController
/**************************************
 Declarative style methods
 CHDeclareMethod0、1、2 (automatically calls CHHook)
**************************************/
CHDeclareClass(NewSettingViewController)
CHDeclareMethod0(void, NewSettingViewController, setting)
{
    WBSettingViewController *settingViewController = [WBSettingViewController new];
    [self.navigationController PushViewController:settingViewController animated:YES];
}

CHDeclareMethod0(void, NewSettingViewController, followMyOfficalAccount)
{
    CContactMgr *contactMgr = [[objc_getClass("MMServiceCenter") defaultCenter] getService:objc_getClass("CContactMgr")];
    
    CContact *contact = [contactMgr getContactByName:@"ilovethisgame_wow"];
    
    ContactInfoViewController *contactViewController = [[objc_getClass("ContactInfoViewController") alloc] init];
    [contactViewController setM_contact:contact];
    
    [self.navigationController PushViewController:contactViewController animated:YES];
}

CHDeclareMethod0(void, NewSettingViewController, reloadTableData)
{
    CHSuper0(NewSettingViewController, reloadTableData);
    WCTableViewManager *tableViewInfo = [self valueForKeyPath:@"m_tableViewMgr"];//m_tableViewInfo
    NSLog(@"lqj-WeChatTweak.NewSettingViewController|tableViewInfo=%@",tableViewInfo);
    WCTableViewSectionManager *sectionInfo = [objc_getClass("WCTableViewSectionManager") sectionInfoDefaut];
    
    WCTableViewNormalCellManager *settingCell = [objc_getClass("WCTableViewNormalCellManager") normalCellForSel:@selector(setting) target:self title:@"微信小助手" accessoryType:1];
    [sectionInfo addCell:settingCell];
    
    CContactMgr *contactMgr = [[objc_getClass("MMServiceCenter") defaultCenter] getService:objc_getClass("CContactMgr")];
    NSString *rightValue = @"未关注";
    if ([contactMgr isInContactList:@"ilovethisgame_wow"]) {
        rightValue = @"已关注";
    } else {
        rightValue = @"未关注";
        CContact *contact = [contactMgr getContactForSearchByName:@"ilovethisgame_wow"];
        [contactMgr addLocalContact:contact listType:2];
        [contactMgr getContactsFromServer:@[contact]];
    }
    
    MMTableViewCellInfo *followOfficalAccountCell = [objc_getClass("WCTableViewNormalCellManager") normalCellForSel:@selector(followMyOfficalAccount) target:self title:@"关注我的微信" rightValue:rightValue accessoryType:1];
    [sectionInfo addCell:followOfficalAccountCell];
    
    [tableViewInfo insertSection:sectionInfo At:0];
    
    MMTableView *tableView = [tableViewInfo getTableView];
    [tableView reloadData];
}

#pragma mark - NewSettingViewController

CHConstructor
{
    NSLog(@"lqj-WeChatTweak.CHConstructor");
    CHLoadLateClass(MicroMessengerAppDelegate);
    CHHook2(MicroMessengerAppDelegate, application, didFinishLaunchingWithOptions);
    
    /*
    CHLoadLateClass(CMessageMgr);
    CHHook2(CMessageMgr, AsyncOnAddMsg, MsgWrap);
    */
}
