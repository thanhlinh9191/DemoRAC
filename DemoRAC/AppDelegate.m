//
//  AppDelegate.m
//  DemoRAC
//
//  Created by THANHLINH on 9/11/15.
//  Copyright (c) 2015 THANHLINH. All rights reserved.
//

#import "AppDelegate.h"
#import "ReactiveCocoa.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    RACSignal *letters = [@"A B C D E F G H I" componentsSeparatedByString:@" "].rac_sequence.signal;
    
    // The new signal only contains: 1 2 3 4 5 6 7 8 9
    //
    // But when subscribed to, it also outputs: A B C D E F G H I
    RACSignal *sequenced = [[letters
                             doNext:^(NSString *letter) {
                                 NSLog(@"%@", letter);
                             }]
                            then:^{
                                return [@"1 2 3 4 5 6 7 8 9" componentsSeparatedByString:@" "].rac_sequence.signal;
                            }];
       [sequenced subscribeNext:^(id x) {
        NSLog(@" number : %@", x);
    }];
    

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
