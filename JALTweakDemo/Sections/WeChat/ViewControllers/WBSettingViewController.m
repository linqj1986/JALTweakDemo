//
//  WBSettingViewController.m
//  WeChatRedEnvelop
//
//  Created by 杨志超 on 2017/2/22.
//  Copyright © 2017年 swiftyper. All rights reserved.
//

#import "WBSettingViewController.h"
#import "WeChatRedEnvelop.h"
#import "WBRedEnvelopConfig.h"
#import <objc/runtime.h>
#import "WBMultiSelectGroupsViewController.h"

@interface WBSettingViewController ()

@property (nonatomic, strong) MMTableViewInfo *tableViewInfo;

@end

@implementation WBSettingViewController

- (void)dealloc
{
    NSLog(@"lqj-dealloc");
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        _tableViewInfo = [[objc_getClass("WCTableViewManager") alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.title = @"微信小助手";
    //[self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:18.0]}];
    
    [self reloadTableData];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;

    MMTableView *tableView = [self.tableViewInfo getTableView];
    [self.view addSubview:tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    MMTableView *tableView = [self.tableViewInfo getTableView];
    
    UIColor *color = tableView.backgroundColor;//UIColor.whiteColor;
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
    self.navigationController.navigationBar.backgroundColor = color;
    //[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.backgroundColor = UIColor.clearColor;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self stopLoading];
}

- (void)reloadTableData {
    [self.tableViewInfo clearAllSection];
    
    [self addBasicSettingSection];
    [self addSupportSection];

    CContactMgr *contactMgr = [[objc_getClass("MMServiceCenter") defaultCenter] getService:objc_getClass("CContactMgr")];
    if ([contactMgr isInContactList:@"gh_6e8bddcdfca3"]) {
    }
    [self addAdvanceSettingSection];

    [self addAboutSection];

    MMTableView *tableView = [self.tableViewInfo getTableView];
    [tableView reloadData];
}

#pragma mark - BasicSetting

- (void)addBasicSettingSection {
    MMTableViewSectionInfo *sectionInfo = [objc_getClass("WCTableViewSectionManager") sectionInfoDefaut];
    
    [sectionInfo addCell:[self createAutoReceiveRedEnvelopCell]];
    [sectionInfo addCell:[self createDelaySettingCell]];
    
    [self.tableViewInfo addSection:sectionInfo];
}


- (MMTableViewCellInfo *)createAutoReceiveRedEnvelopCell {
    return [objc_getClass("WCTableViewNormalCellManager") switchCellForSel:@selector(switchRedEnvelop:) target:self title:@"自动抢红包" on:[WBRedEnvelopConfig sharedConfig].autoReceiveEnable];
}

- (MMTableViewCellInfo *)createDelaySettingCell {
    NSInteger delaySeconds = [WBRedEnvelopConfig sharedConfig].delaySeconds;
    NSString *delayString = delaySeconds == 0 ? @"不延迟" : [NSString stringWithFormat:@"%ld 秒", (long)delaySeconds];
    
    MMTableViewCellInfo *cellInfo;
    if ([WBRedEnvelopConfig sharedConfig].autoReceiveEnable) {
        cellInfo = [objc_getClass("WCTableViewNormalCellManager") normalCellForSel:@selector(settingDelay) target:self title:@"延迟抢红包" rightValue: delayString accessoryType:1];
    } else {
        cellInfo = [objc_getClass("WCTableViewNormalCellManager") normalCellForTitle:@"延迟抢红包" rightValue: @"抢红包已关闭"];
    }
    return cellInfo;
}

- (void)switchRedEnvelop:(UISwitch *)envelopSwitch {
    [WBRedEnvelopConfig sharedConfig].autoReceiveEnable = envelopSwitch.on;
    
    [self reloadTableData];
}

- (void)settingDelay {
    UIAlertView *alert = [UIAlertView new];
    alert.title = @"延迟抢红包(秒)";
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.delegate = self;
    [alert addButtonWithTitle:@"取消"];
    [alert addButtonWithTitle:@"确定"];
    
    [alert textFieldAtIndex:0].placeholder = @"延迟时长";
    [alert textFieldAtIndex:0].keyboardType = UIKeyboardTypeNumberPad;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        NSString *delaySecondsString = [alertView textFieldAtIndex:0].text;
        NSInteger delaySeconds = [delaySecondsString integerValue];
        
        [WBRedEnvelopConfig sharedConfig].delaySeconds = delaySeconds;
        
        [self reloadTableData];
    }
}

#pragma mark - ProSetting
- (void)addAdvanceSettingSection {
    MMTableViewSectionInfo *sectionInfo = [objc_getClass("WCTableViewSectionManager") sectionInfoHeader:@"高级功能"];
    
    [sectionInfo addCell:[self createReceiveSelfRedEnvelopCell]];
    [sectionInfo addCell:[self createQueueCell]];
    [sectionInfo addCell:[self createAbortRemokeMessageCell]];
    
    [self.tableViewInfo addSection:sectionInfo];
}

- (MMTableViewCellInfo *)createReceiveSelfRedEnvelopCell {
    return [objc_getClass("WCTableViewNormalCellManager") switchCellForSel:@selector(settingReceiveSelfRedEnvelop:) target:self title:@"抢自己发的红包" on:[WBRedEnvelopConfig sharedConfig].receiveSelfRedEnvelop];
}

- (MMTableViewCellInfo *)createQueueCell {
    return [objc_getClass("WCTableViewNormalCellManager") switchCellForSel:@selector(settingReceiveByQueue:) target:self title:@"防止同时抢多个红包" on:[WBRedEnvelopConfig sharedConfig].serialReceive];
}

- (MMTableViewSectionInfo *)createAbortRemokeMessageCell {
    return [objc_getClass("WCTableViewNormalCellManager") switchCellForSel:@selector(settingMessageRevoke:) target:self title:@"消息防撤回" on:[WBRedEnvelopConfig sharedConfig].revokeEnable];
}

- (void)settingReceiveSelfRedEnvelop:(UISwitch *)receiveSwitch {
    [WBRedEnvelopConfig sharedConfig].receiveSelfRedEnvelop = receiveSwitch.on;
}

- (void)settingReceiveByQueue:(UISwitch *)queueSwitch {
    [WBRedEnvelopConfig sharedConfig].serialReceive = queueSwitch.on;
}

- (void)settingMessageRevoke:(UISwitch *)revokeSwitch {
    [WBRedEnvelopConfig sharedConfig].revokeEnable = revokeSwitch.on;
    
    [self reloadTableData];
}

#pragma mark - About
- (void)addAboutSection {
    MMTableViewSectionInfo *sectionInfo = [objc_getClass("WCTableViewSectionManager") sectionInfoDefaut];
    
    [sectionInfo addCell:[self createVersionCell]];
    
    [self.tableViewInfo addSection:sectionInfo];
}

- (MMTableViewCellInfo *)createVersionCell {
    return [objc_getClass("WCTableViewNormalCellManager") normalCellForSel:nil target:self title:@"小助手版本号" rightValue: @"V1.97" accessoryType:0];
}

#pragma mark - Support
- (void)addSupportSection {
    MMTableViewSectionInfo *sectionInfo = [objc_getClass("WCTableViewSectionManager") sectionInfoDefaut];
    
    [sectionInfo addCell:[self createWeChatPayingCell]];
    
    [self.tableViewInfo addSection:sectionInfo];
}

- (MMTableViewCellInfo *)createWeChatPayingCell {
    return [objc_getClass("WCTableViewNormalCellManager") normalCellForSel:@selector(payingToAuthor) target:self title:@"微信打赏" rightValue:@"支持作者" accessoryType:1];
}

- (void)payingToAuthor {
    [self startLoadingNonBlock];
    ScanQRCodeLogicController *scanQRCodeLogic = [[objc_getClass("ScanQRCodeLogicController") alloc] initWithViewController:self CodeType:3];
    scanQRCodeLogic.fromScene = 2;
    NewQRCodeScanner *qrCodeScanner = [[objc_getClass("NewQRCodeScanner") alloc] initWithDelegate:scanQRCodeLogic CodeType:3];
    [qrCodeScanner notifyResult:@"wxp://f2f0_Tt2W5LvTttX62jgoe1shEKd7Mm9TcAb" type:@"QR_CODE" version:6 rawData:nil];
}

@end
