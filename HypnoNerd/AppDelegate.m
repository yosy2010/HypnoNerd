//
//  AppDelegate.m
//  HypnoNerd
//
//  Created by YASSER ALTAMIMI on 20/09/2018.
//  Copyright © 2018 YASSER ALTAMIMI. All rights reserved.
//

#import "AppDelegate.h"
#import "BNRHypnosisViewController.h"
#import "BNRReminderViewController.h"
#import "QuizViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // here we initilize the main window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // and give it a background color
    self.window.backgroundColor = [UIColor blackColor];
    
    // create the reminder view controller using init only as the nib file has the same name as the view controller
    BNRReminderViewController *rvc = [[BNRReminderViewController alloc] init];
    
    // create the hypnosis view controller
    BNRHypnosisViewController *hvc = [[BNRHypnosisViewController alloc] init];
    
    // create the quiz view controller
    QuizViewController *qvc = [[QuizViewController alloc] init];
  
    //create tab Bar view Controller
    UITabBarController *tabController = [[UITabBarController alloc] init];
    
    // add the two controllers to the tabBarController
    tabController.viewControllers = @[hvc, rvc, qvc];
    
    // and set the tab bar controller as the root view of the window
    self.window.rootViewController = tabController;
    
    // we draw the window with all what's benith it to the screen
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
