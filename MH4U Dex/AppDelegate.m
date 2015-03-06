//
//  AppDelegate.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/5/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeViewController.h"
#import "CoreDataController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"Loading Data");
    CoreDataController *coreDataController = [CoreDataController sharedCDController];
    [coreDataController loadMonsterData];
    [coreDataController loadMonsterDropData];
    [coreDataController loadRegionData];
    NSLog(@"Data loaded.");
    UINavigationController *rootViewController = (UINavigationController *)self.window.rootViewController;
    HomeViewController *homeViewController = (HomeViewController *)[rootViewController viewControllers][0];
    homeViewController.managedObjectContext = coreDataController.managedObjectContext;
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [[CoreDataController sharedCDController] saveContext];
}

@end
