//
//  CoreDataController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "CoreDataController.h"
#import <NSManagedObjectContext+Hydrate.h>
#import "MonsterDrop.h"
#import "AreaDrop.h"
#import "Item.h"
#import "Monster.h"
#import "DamageZone.h"
#import "Region.h"
#import "Area.h"

@implementation CoreDataController

NSString *const JSON = @"json";

#pragma mark - Item Constants

NSString *const ItemNameKey = @"name";

#pragma mark - Monster Constants

NSString *const MonsterIDKey = @"id";

#pragma mark - Area Constants

NSString *const AreaCombinedNameKey = @"combinedName";

#pragma mark - Region Constants

NSString *const RegionsFileName = @"regions";
NSString *const RegionIDJSONKey = @"_id";
NSString *const RegionIDKey = @"id";
NSString *const RegionNameKey = @"region_name";
NSString *const RegionKeyNameKey = @"keyName";
NSString *const RegionDropsFileNameSuffix = @"_drops";

#pragma mark - Monster Drop Constants

NSString *const MonsterDropsFileName = @"monsterDrops";
NSString *const MonsterDropIDKey = @"id";
NSString *const MonsterDropMethodKey = @"method";
NSString *const MonsterDropQuantityKey = @"quantity";
NSString *const MonsterDropRankKey = @"rank";
NSString *const MonsterDropPercentKey = @"percent";
NSString *const MonsterDropMonsterNameKey = @"monster_name";
NSString *const MonsterDropMonsterIDKey = @"monster_id";
NSString *const MonsterDropItemNameKey = @"item_name";

#pragma mark - Area Drop Constants

NSString *const AreaDropAreaNameKey = @"area";
NSString *const AreaDropRankKey = @"rank";
NSString *const AreaDropIDKey = @"_id";
NSString *const AreaDropMethodKey = @"method";
NSString *const AreaDropPercentKey = @"chance";
NSString *const AreaDropQuantityKey = @"number";
NSString *const AreaDropItemNameKey = @"item";
NSString *const AreaDropIDDecimalStringKey = @"idDecimalString";

#pragma mark - Initial Data Loading

- (void)loadMonsterData
{
    // Because monsters are added first, there are no relationships to set up, so we can hydrate them.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"monsters" ofType:JSON];
    NSDictionary *attributes = @{
                                 @"id":@"_id",
                                 @"monster_class":@"class",
                                 @"name":@"name",
                                 @"jpn_name":@"jpn_name",
                                 @"sort_name":@"sort_name",
                                 @"trait":@"trait",
                                 @"icon":@"icon_name",
                                 @"url":@"url"
                                 };
    [self.managedObjectContext hydrateStoreWithJSONAtPath:path attributeMappings:attributes forEntityName:[Monster entityName]];
    path = [[NSBundle mainBundle] pathForResource:@"damageZones" ofType:JSON];
    attributes = @{
                   @"id":@"_id",
                   @"monster_id":@"monster_id",
                   @"monsterName":@"monster_name",
                   @"jpnMonsterName":@"jpn_monster_name",
                   @"bodyPart":@"body_part",
                   @"cut":@"cut",
                   @"impact":@"impact",
                   @"shot":@"shot",
                   @"fire":@"fire",
                   @"water":@"water",
                   @"thunder":@"thunder",
                   @"ice":@"ice",
                   @"dragon":@"dragon",
                   @"ko":@"ko",
                   @"extract":@"extract"
                   };
    [self.managedObjectContext hydrateStoreWithJSONAtPath:path attributeMappings:attributes forEntityName:[DamageZone entityName]];
}

- (void)loadMonsterDropData
{
    NSArray *dropList = [self loadArrayFromJsonFileNamed:MonsterDropsFileName];
    for (NSDictionary *drop in dropList) {
        // Only add the drop if it is not already there
        NSNumber *monsterDropID = drop[MonsterDropIDKey];
        NSPredicate *monsterDropPredicate = [NSPredicate predicateWithFormat:@"%K == %d", MonsterDropIDKey, monsterDropID.intValue];
        if (![self countForEntityWithEntityName:[MonsterDrop entityName] withPredicate:monsterDropPredicate]) {
            MonsterDrop *newDrop = [MonsterDrop insertInManagedObjectContext:self.managedObjectContext];
            newDrop.id = drop[MonsterDropIDKey];
            newDrop.method = drop[MonsterDropMethodKey];
            newDrop.quantity = drop[MonsterDropQuantityKey];
            
            // If the Item for this drop already exists in the persistent store ...
            NSPredicate *itemPredicate = [NSPredicate predicateWithFormat:@"%K == %@", ItemNameKey, drop[MonsterDropItemNameKey]];
            Item *item = (Item *)[self getUniqueEntityWithEntityName:[Item entityName] withPredicate:itemPredicate];
            if (item) {
                // We need to hook up relationships appropriately.
                newDrop.item = item;
            } else {
                // Otherwise, we should create the item.
                Item *newItem = [Item insertInManagedObjectContext:self.managedObjectContext];
                newItem.name = drop[MonsterDropItemNameKey];
                newDrop.item = newItem;
            }
            
            // If this is a monster drop ...
            NSString *monsterName = drop[MonsterDropMonsterNameKey];
            if (monsterName.length) {
                // We need to add this drop to the monster's list, if it is not there already.
                
                // First we should ensure that the monster already exists in the persistent store
                NSNumber *monsterID = drop[MonsterDropMonsterIDKey];
                NSPredicate *monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %d", MonsterIDKey, monsterID.intValue];
                Monster *monster = (Monster *)[self getUniqueEntityWithEntityName:[Monster entityName] withPredicate:monsterPredicate];
                if (!monster) {
                    // TODO: Handle better, later.
                    NSLog(@"The Monster, %@, was not found!", monsterName);
                } else {
                    newDrop.monsterSource = monster;
                    newDrop.rank = drop[MonsterDropRankKey];
                    newDrop.percent = drop[MonsterDropPercentKey];
                }
            }
        }
    }
    
    // We should now try to save the manged object context
    if (![self attemptSaveContext]) {
        NSLog(@"WARNING: Failed to save the item context!");
    }
}

- (void)loadRegionData
{
    NSArray *regionList = [self loadArrayFromJsonFileNamed:RegionsFileName];
    
    for (NSDictionary *regionDict in regionList) {
        Region *region;
        NSNumber *regionID = regionDict[RegionIDJSONKey];
        NSPredicate *regionPredicate = [NSPredicate predicateWithFormat:@"%K == %d", RegionIDKey, regionID.intValue];
        region = (Region *)[self getUniqueEntityWithEntityName:[Region entityName] withPredicate:regionPredicate];
        // Only add the region if it is not already there
        if (!region) {
            region = [Region insertInManagedObjectContext:self.managedObjectContext];
            region.name = regionDict[RegionNameKey];
            region.id = regionDict[RegionIDJSONKey];
            region.keyName = regionDict[RegionKeyNameKey];
        }
        // regardless if the region is new or not, we should populate it with area data
        // But first, we need to check that the region file exists
        NSArray *areaDrops = [self loadArrayFromJsonFileNamed:[NSString stringWithFormat:@"%@%@", region.keyName, RegionDropsFileNameSuffix]];
        // If the file actually exists...
        if (areaDrops) {
            // ... go through the file, and construct areas/drops as appropriate
            for (NSDictionary *areaDrop in areaDrops) {
                //This is getting complicated, so I'm going to move this out to a separate method.
                [self addAreaDropFromDictionary:areaDrop toRegion:region];
            }
        }
    }
    
    // We should now try to save the manged object context
    if (![self attemptSaveContext]) {
        NSLog(@"WARNING: Failed to save the item context!");
    }
}

- (void)addAreaDropFromDictionary:(NSDictionary *)areaDropDict toRegion:(Region *)region
{
    //First, let's check if the area that this areaDrop takes place in actually exists!
    NSString *areaCombinedName = [NSString stringWithFormat:@"%@-%@-%@",
                                  region.name,
                                  areaDropDict[AreaDropAreaNameKey],
                                  areaDropDict[AreaDropRankKey]];
    NSPredicate *areaPredicate = [NSPredicate predicateWithFormat:@"%K == %@", AreaCombinedNameKey, areaCombinedName];
    Area *area = (Area *)[self getUniqueEntityWithEntityName:[Area entityName] withPredicate:areaPredicate];
    // If the area doesn't already exist...
    if (!area) {
        // ... We need to create it, and add it to this region
        area = [Area insertInManagedObjectContext:self.managedObjectContext];
        area.name = areaDropDict[AreaDropAreaNameKey];
        area.combinedName = areaCombinedName;
        area.region = region;
        area.rank = areaDropDict[AreaDropRankKey];
        [region.areaSet addObject:area];
    }
    // If it wasn't already, the area is now attached to the region
    
    // We should now consider adding this drop to the area.
    // First, check if the area drop already exists, by way of checking the idDecimalString
    NSString *idDecimalString = areaDropDict[AreaDropIDKey];
    NSPredicate *areaDropPredicate = [NSPredicate predicateWithFormat:@"%K == %@", AreaDropIDDecimalStringKey, idDecimalString];
    AreaDrop *drop = (AreaDrop *)[self getUniqueEntityWithEntityName:[AreaDrop entityName] withPredicate:areaDropPredicate];
    //If the drop already exists...
    if (drop) {
        // TODO: do we need to do more here?
        // ... do nothing. (At least for now).
        return;
    } else {
        // This else is not needed, but helps for clarity IMO.
        // Hook up the drop.
        drop = [AreaDrop insertInManagedObjectContext:self.managedObjectContext];
        drop.idDecimalString = idDecimalString;
        drop.method = areaDropDict[AreaDropMethodKey];
        NSString *percent = areaDropDict[AreaDropPercentKey];
        drop.percentValue = percent.integerValue;
        drop.quantity = areaDropDict[AreaDropQuantityKey];
        drop.rank = areaDropDict[AreaDropRankKey];
        
        // Hook up the area relationship.  We already ensured the area exists.
        drop.area = area;
        
        // Time to hook up the item relationship.  The item may or may not already exist.
        NSString *itemName = areaDropDict[AreaDropItemNameKey];
        NSPredicate *itemPredicate = [NSPredicate predicateWithFormat:@"%K == %@", ItemNameKey, itemName];
        Item *item = (Item *)[self getUniqueEntityWithEntityName:[Item entityName] withPredicate:itemPredicate];
        if (!item) {
            item = [Item insertInManagedObjectContext:self.managedObjectContext];
            item.name = itemName;
        }
        drop.item = item;
        
        // The Drop should now exist, and be properly hooked up to the area, which exists and is hooked up to the region.
    }
}

# pragma mark - Helper Methods

- (NSDictionary *)loadDictionaryFromJsonFileNamed:(NSString *)fileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:JSON];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (!fileContents) {
        NSLog(@"Error reading file: %@", error.localizedDescription);
        return nil;
    }
    NSDictionary *results = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding]
                                                                            options:0
                                                                              error:&error];
    if (!results) {
        NSLog(@"Error serializing data: %@", error.localizedDescription);
        return nil;
    } else {
        return results;
    }
}

- (NSArray *)loadArrayFromJsonFileNamed:(NSString *)fileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:JSON];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (!fileContents) {
        NSLog(@"Error reading file: %@", error.localizedDescription);
        return nil;
    }
    NSArray *results = (NSArray *)[NSJSONSerialization JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding]
                                                      options:0
                                                        error:&error];
    if (!results) {
        NSLog(@"Error serializing data: %@", error.localizedDescription);
        return nil;
    } else {
        return results;
    }
}

- (BOOL)attemptSaveContext
{
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        return NO;
    }
    return YES;
}

- (NSManagedObject *)getUniqueEntityWithEntityName:(NSString *)entityName withPredicate:(NSPredicate *)predicate
{
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    [request setPredicate:predicate];
    
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (results) {
        if (results.count == 0) {
            // Object not found.
            return nil;
        }
        if (results.count == 1) {
            return results.firstObject;
        } else {
            NSLog(@"Too many entities found!");
            return nil;
        }
    } else {
        NSLog(@"Error fetching object!");
        NSLog(@"%@, %@", error, error.localizedDescription);
        return nil;
    }
}

- (NSUInteger)countForEntityWithEntityName:(NSString *)entityName withPredicate:(NSPredicate *)predicate
{
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    [request setPredicate:predicate];
    
    NSUInteger count = [self.managedObjectContext countForFetchRequest:request error:&error];
    if (count != NSNotFound) {
        return count;
    } else {
        return 0;
    }
}

#pragma mark - Boilerplate Core Data Code

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSManagedObjectModel *)managedObjectModel
{
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"MH4U_Dex" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"MH4U_Dex.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // TODO: fix all of this later.
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext
{
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

- (NSURL *)applicationDocumentsDirectory
{
    // The directory the application uses to store the Core Data store file. This code uses a directory named "JMG.MH4U_Dex" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void)saveContext
{
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
