//
//  CoreDataController.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <Foundation/Foundation.h>

@interface CoreDataController : NSObject

+ (CoreDataController *)sharedCDController;

/**
 Tells the controller to rebuild the persistent store if the appropriate flags are set.
 */
- (void)tryLoadSequence;

/**
 Schedule or cancel a database reload upon the next app start
 */
+ (void)setShouldTriggerReloadUponRestart:(BOOL)shouldTriggerReloadUponRestart;

/**
 Determine whether or not a database reload has been schedued
 */
+ (BOOL)shouldTriggerReloadUponRestart;

/**
 Returns the Unique entity that matches the entityName and predicate, or nil if the entity does not exist, or is not unique.
 */
- (NSManagedObject *)uniqueEntityWithEntityName:(NSString *)entityName withPredicate:(NSPredicate *)predicate;

#pragma mark - Boilerplate Core Data Code

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
