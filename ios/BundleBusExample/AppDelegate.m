/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import "AppDelegate.h"

#import "RCTBundleURLProvider.h"
#import "RCTRootView.h"

#import "Bundlebus.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSString *appKey = @"YOUR_APP_KEY";
  NSString *appModuleName = @"YOUR_MODULE_NAME";
  
  BundleBus *bundlebus = [[BundleBus alloc] init];
  [bundlebus silentUpdate:appKey];
  
  NSURL *jsCodeLocation;
  jsCodeLocation = [bundlebus bundleUrl:appKey];
  RCTRootView *rootView;
  if(jsCodeLocation != nil) {
    rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:appModuleName
                                                 initialProperties:nil
                                                     launchOptions:launchOptions];
  }
  else {
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil]; 
    rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:appModuleName
                                                 initialProperties:nil
                                                     launchOptions:launchOptions];
  }
  
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
  
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  
  return YES;
}

@end
