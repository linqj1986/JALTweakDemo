//
//  Tmp.h
//  JALTweakDemo
//
//  Created by j066 on 2019/5/15.
//

#ifndef Tmp_h
#define Tmp_h

/*
 
 #pragma mark - SBUIController
 //屏蔽桌面启动app
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

 #pragma mark - HKHealthStore
 #pragma mark - HKSampleQuery
 typedef void(^HKSQ)(HKSampleQuery *query, NSArray<__kindof HKSample *> * results, NSError * error);
 HKSQ oldhksqHandle = nil;
 HKSQ hksqHandle = ^(HKSampleQuery *query, NSArray<__kindof HKSample *> * results, NSError * error){
 NSLog(@"lqj-hksqHandle=%d",results.count);
 if(results.count>0) {
 Class HKQuantitySample_class = objc_getClass("HKQuantitySample");
 HKQuantitySample *result = results[0];
 //result.quantity = @"20310";
 NSLog(@"lqj-hksqHandle=%@,%@,%@,%@",result.quantityType,result.quantity,result.startDate,result.endDate);
 error = nil;
 }
 oldhksqHandle(query,results,error);
 };
 
 %hook HKSampleQuery
 - (instancetype)initWithSampleType:(HKSampleType *)sampleType
 predicate:( NSPredicate *)predicate
 limit:(NSUInteger)limit
 sortDescriptors:( NSArray<NSSortDescriptor *> *)sortDescriptors
 resultsHandler:(void(^)(HKSampleQuery *query, NSArray<__kindof HKSample *> * results, NSError * error))resultsHandler
 {
 NSLog(@"lqj-initWithSampleType,limit=%d",limit);
 oldhksqHandle = resultsHandler;
 resultsHandler = hksqHandle;
 id ret = %orig;
 return ret;
 }
 %end
 
 %hook HKSource
 - (NSString *)name
 {
 NSString *ret = %orig;
 NSLog(@"lqj-HKSource,name=%@",ret);
 //if ([ret isEqualToString:@"emptyTest"])
 //    ret = @"Qijiang的 iPhone";
 return ret;
 }
 
 - (NSString *)bundleIdentifier
 {
 NSString *ret = %orig;
 NSLog(@"lqj-HKSource,bundleIdentifier=%@",ret);
 //if ([ret isEqualToString:@"com.qijiang.emptyTest"])
 //    ret = @"com.apple.health.0272E94D-CCED-4CB5-8773-1E570D877505";
 return ret;
 }
 
 %end
 
 %hook HKObject
 - (NSUUID *)UUID
 {
 NSUUID *ret = %orig;
 NSLog(@"lqj-HKObject,UUID=%@",ret);
 //if ([ret isEqualToString:@"com.qijiang.emptyTest"])
 //    ret = @"com.apple.health.0272E94D-CCED-4CB5-8773-1E570D877505";
 //ret = [[NSUUID alloc] initWithUUIDString:@"FEC9AE01-F178-4C84-8FE5-078171DBDE64"];
 return ret;
 }
 
 - (id)metadata
 {
 NSDictionary<NSString *, id> *ret = %orig;
 NSLog(@"lqj-HKObject,metadata=%@",ret);
 //if ([ret isEqualToString:@"com.qijiang.emptyTest"])
 //    ret = @"com.apple.health.0272E94D-CCED-4CB5-8773-1E570D877505";
 return ret;
 }
 
 %end
 
 %hook HKDevice
 - (NSString *)localIdentifier
 {
 NSString *ret = %orig;
 NSLog(@"lqj-HKDevice,localIdentifier=%@",ret);
 return ret;
 }
 
 - (NSString *)UDIDeviceIdentifier
 {
 NSString *ret = %orig;
 NSLog(@"lqj-HKDevice,UDIDeviceIdentifier=%@",ret);
 return ret;
 }
 %end
 
 BOOL bT = FALSE;
 
 %hook TMehod
 + (void)setTMethod
 {
 NSLog(@"lqj-NSBundle,setTMethod");
 bT = TRUE;
 }
 %end
 
 %hook NSBundle
 - (NSString *)bundleIdentifier
 {
 NSString *ret = %orig;
 
 if (bT && [ret isEqualToString:@"com.qijiang.emptyTest"]) {
 NSLog(@"lqj-NSBundle,bundleIdentifier=%@",ret);
 ret = @"com.apple.health.0272E94D-CCED-4CB5-8773-1E570D877505";
 }
 return ret;
 }
 %end
 
 %hook NSDictionary
 - (id)objectForKey:(id)aKey
 {
 NSLog(@"lqj-NSDictionary,objectForKey=%@",aKey);
 if ([aKey containsString:@"CFBundleDisplayName"]) {
 NSLog(@"lqj-NSDictionary,,objectForKey=%@",aKey);
 }
 return %orig;
 }
 %end
 
 
 */

#endif /* Tmp_h */
