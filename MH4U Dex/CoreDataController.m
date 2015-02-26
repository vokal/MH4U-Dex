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
#import "Region.h"
#import "Area.h"

@implementation CoreDataController

#pragma mark - Initial Data Loading

- (void)loadMonsterData
{
    // Because monsters are added first, there are no relationships to set up, so we can hydrate them.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"monsters" ofType:@"json"];
    NSDictionary *attributes = @{@"id":@"_id", @"monster_class":@"class", @"name":@"name", @"jpn_name":@"jpn_name", @"sort_name":@"sort_name", @"trait":@"trait", @"icon":@"icon_name", @"url":@"url"};
    [self.managedObjectContext hydrateStoreWithJSONAtPath:path attributeMappings:attributes forEntityName:@"Monster"];
    path = [[NSBundle mainBundle] pathForResource:@"damageZones" ofType:@"json"];
    attributes = @{@"id":@"_id", @"monster_id":@"monster_id", @"monsterName":@"monster_name", @"jpnMonsterName":@"jpn_monster_name", @"bodyPart":@"body_part", @"cut":@"cut", @"impact":@"impact", @"shot":@"shot", @"fire":@"fire", @"water":@"water", @"thunder":@"thunder", @"ice":@"ice", @"dragon":@"dragon", @"ko":@"ko", @"extract":@"extract"};
    [self.managedObjectContext hydrateStoreWithJSONAtPath:path attributeMappings:attributes forEntityName:@"DamageZone"];
}

- (void)loadMonsterDropData
{
    NSArray *dropList = [self loadArrayFromJsonFileNamed:@"monsterDrops"];
    for (NSDictionary *drop in dropList) {
        // Only add the drop if it is not already there
        if (![self checkCountForEntityWithEntityName:@"MonsterDrop" withIDNumber:drop[@"_dropID"]]) {
            NSEntityDescription *newDropDescription = [NSEntityDescription entityForName:@"MonsterDrop" inManagedObjectContext:self.managedObjectContext];
            MonsterDrop *newDrop = [[MonsterDrop alloc] initWithEntity:newDropDescription insertIntoManagedObjectContext:self.managedObjectContext];
            [newDrop setDropBasicValuesWithID:drop[@"_dropID"] method:drop[@"method"] quantity:drop[@"quantity"]];
            
            // If the Item for this drop already exists in the persistent store ...
            Item *item = (Item *)[self getUniqueEntityWithEntityName:@"Item" withNameAttribute:drop[@"item_name"]];
            if (item) {
                // We need to hook up relationships appropriately.
                newDrop.item = item;
                [item.monsterSourceSet addObject:newDrop];
            } else {
                // Otherwise, we should create the item.
                NSEntityDescription *newItemDescription = [NSEntityDescription entityForName:@"Item" inManagedObjectContext:self.managedObjectContext];
                Item *newItem = [[Item alloc] initWithEntity:newItemDescription insertIntoManagedObjectContext:self.managedObjectContext];
                [newItem.monsterSourceSet addObject:newDrop];
                newItem.name = drop[@"item_name"];
                newDrop.item = newItem;
            }
            
            // If this is a monster drop ...
            if (![drop[@"monster_name"] isEqualToString:@""]) {
                // We need to add this drop to the monster's list, if it is not there already.
                
                // First we should ensure that the monster already exists in the persistent store
                Monster *monster = (Monster *)[self getUniqueEntityWithEntityName:@"Monster" withIDNumber:drop[@"monster_id"]];
                if (!monster) {
                    NSLog(@"Monster not found! Returning early.");
                    @throw @"Monster nto found!";
                    return;
                } else {
                    [monster.dropSet addObject:newDrop];
                    newDrop.monsterSource = monster;
                    newDrop.rank = drop[@"rank"];
                    newDrop.percent = drop[@"percent"];
                }
            }
        }
    }
    
    // We should now try to save the manged object context
    if (![self didSuccessfullySaveContext]) {
        NSLog(@"WARNING: Failed to save the item context!");
    }
}

- (void)loadRegionData
{
    NSArray *regionList = [self loadArrayFromJsonFileNamed:@"regions"];
    
    for (NSDictionary *regionDict in regionList) {
        Region *region;
        region = (Region *)[self getUniqueEntityWithEntityName:@"Region" withIDNumber:regionDict[@"_id"]];
        // Only add the region if it is not already there
        if (!region) {
            NSEntityDescription *newRegionDescription = [NSEntityDescription entityForName:@"Region" inManagedObjectContext:self.managedObjectContext];
            region = [[Region alloc] initWithEntity:newRegionDescription insertIntoManagedObjectContext:self.managedObjectContext];
            region.name = regionDict[@"region_name"];
            region.id = regionDict[@"_id"];
            region.keyName = regionDict[@"keyName"];
        }
        // regardless if the region is new or not, we should populate it with area data
        // But first, we need to check that the region file exists
        NSArray *areaDrops = [self loadArrayFromJsonFileNamed:[NSString stringWithFormat:@"%@_drops", region.keyName]];
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
    if (![self didSuccessfullySaveContext]) {
        NSLog(@"WARNING: Failed to save the item context!");
    }
}

- (void)addAreaDropFromDictionary:(NSDictionary *)areaDropDict toRegion:(Region *)region
{
    //First, let's check if the area that this areaDrop takes place in actually exists!
    NSString *areaCombinedName = [NSString stringWithFormat:@"%@-%@-%@",
                                  region.name,
                                  areaDropDict[@"area"],
                                  areaDropDict[@"rank"]];
    Area *area = [self getUniqueAreaWithCombinedName:areaCombinedName];
    // If the area doesn't already exist...
    if (!area) {
        // ... We need to create it, and add it to this region
        NSEntityDescription *newAreaDescription = [NSEntityDescription entityForName:@"Area" inManagedObjectContext:self.managedObjectContext];
        area = [[Area alloc] initWithEntity:newAreaDescription insertIntoManagedObjectContext:self.managedObjectContext];
        area.name = areaDropDict[@"area"];
        area.combinedName = areaCombinedName;
        area.region = region;
        area.rank = areaDropDict[@"rank"];
        [region.areaSet addObject:area];
    }
    // If it wasn't already, the area is now attached to the region
    
    // We should now consider adding this drop to the area.
    // First, check if the area drop already exists, by way of checking the idDecimalString
    NSString *idDecimalString = areaDropDict[@"_id"];
    AreaDrop *drop = [self getUniqueAreaDropWithDecimalID:idDecimalString];
    //If the drop already exists...
    if (drop) {
        // ... do nothing. (At least for now).
        return;
    } else {
        // This else is not needed, but helps for clarity IMO.
        // Hook up the drop.
        NSEntityDescription *newDropDescription = [NSEntityDescription entityForName:@"AreaDrop" inManagedObjectContext:self.managedObjectContext];
        drop = [[AreaDrop alloc] initWithEntity:newDropDescription insertIntoManagedObjectContext:self.managedObjectContext];
        drop.idDecimalString = idDecimalString;
        drop.method = areaDropDict[@"method"];
        NSString *percent = areaDropDict[@"chance"];
        drop.percentValue = percent.integerValue;
        drop.quantity = areaDropDict[@"number"];
        drop.rank = areaDropDict[@"rank"];
        
        // Hook up the area relationship.  We already ensured the area exists.
        drop.area = area;
        [area.dropSet addObject:drop];
        
        // Time to hook up the item relationship.  The item may or may not already exist.
        NSString *itemName = areaDropDict[@"item"];
        Item *item = (Item *)[self getUniqueEntityWithEntityName:@"Item" withNameAttribute:itemName];
        if (!item) {
            NSEntityDescription *newItemDescription = [NSEntityDescription entityForName:@"Item" inManagedObjectContext:self.managedObjectContext];
            item = [[Item alloc] initWithEntity:newItemDescription insertIntoManagedObjectContext:self.managedObjectContext];
            item.name = itemName;
        }
        [item.areaSourceSet addObject:drop];
        drop.item = item;
        
        // The Drop should now exist, and be properly hooked up to the area, which exists and is hooked up to the region.
    }
}

# pragma mark - Helper Methods

- (NSDictionary *)loadDictionaryFromJsonFileNamed:(NSString *)fileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"Error reading file: %@", error.localizedDescription);
        return nil;
    }
    return (NSDictionary *)[NSJSONSerialization JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding]
                                                           options:0
                                                             error:nil];
}

- (NSArray *)loadArrayFromJsonFileNamed:(NSString *)fileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    NSError *error;
    NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"Error reading file: %@", error.localizedDescription);
        return nil;
    }
    return (NSArray *)[NSJSONSerialization JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding]
                                                      options:0
                                                        error:nil];
}

- (BOOL)didSuccessfullySaveContext
{
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        return NO;
    }
    return YES;
}

- (AreaDrop *)getUniqueAreaDropWithDecimalID:(NSString *)decimalID
{
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"AreaDrop"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"idDecimalString", decimalID];
    [request setPredicate:predicate];
    
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (!error) {
        if (results.count == 0) {
            // Object not found.
            return nil;
        } else if (results.count == 1) {
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

- (Area *)getUniqueAreaWithCombinedName:(NSString *)combinedName
{
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Area"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"combinedName", combinedName];
    [request setPredicate:predicate];
    
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (!error) {
        if (results.count == 0) {
            // Object not found.
            return nil;
        } else if (results.count == 1) {
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

- (NSManagedObject *)getUniqueEntityWithEntityName:(NSString *)entityName withNameAttribute:(NSString *)name
{
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"name", name];
    [request setPredicate:predicate];
    
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (!error) {
        if (results.count == 0) {
            // Object not found.
            return nil;
        } else if (results.count == 1) {
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

- (NSManagedObject *)getUniqueEntityWithEntityName:(NSString *)entityName withIDNumber:(NSNumber *)entity_id
{
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %d", @"id", entity_id.intValue];
    [request setPredicate:predicate];
    
    NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
    if (!error) {
        if (results.count == 0) {
            return nil;
        } else if (results.count == 1) {
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

- (NSUInteger)checkCountForEntityWithEntityName:(NSString *)entityName withNameAttribute:(NSString *)name
{
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", @"name", name];
    [request setPredicate:predicate];
    
    NSUInteger count = [self.managedObjectContext countForFetchRequest:request error:&error];
    if (!error) {
        return count;
    } else {
        return 0;
    }
}

- (NSUInteger)checkCountForEntityWithEntityName:(NSString *)entityName withIDNumber:(NSNumber *)entity_id
{
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %d", @"id", entity_id.intValue];
    [request setPredicate:predicate];
    NSUInteger count = [self.managedObjectContext countForFetchRequest:request error:&error];
    if (!error) {
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
