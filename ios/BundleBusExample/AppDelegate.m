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

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  NSString *appName = @"YOUR_REACTNATIVE_APP_NAME";  // name value in ../../package.json
  NSString *appKey = @"YOUR_BUNDLEBUS_APP_KEY";      // returned after bundlebus register
  BundleBus *bundlebus = [[BundleBus alloc] init];
  [bundlebus silentUpdate:appKey];
    
  NSURL *jsCodeLocation;

  jsCodeLocation = [bundlebus bundleUrl:appKey];  // nil or latest version of bundle location 
  RCTRootView *rootView;
  if(jsCodeLocation != nil) {
    rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                           moduleName:appName
                                    initialProperties:nil
                                        launchOptions:launchOptions];
  }
  else {
    // Original sample code from React Native
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];

    rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                           moduleName:appName
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
