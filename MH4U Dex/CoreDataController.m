//
//  CoreDataController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "CoreDataController.h"

#import <NSManagedObjectContext+Hydrate.h>

#import "Constants.h"

#import "Area.h"
#import "AreaDrop.h"
#import "DamageZone.h"
#import "Item.h"
#import "Monster.h"
#import "MonsterDrop.h"
#import "Quest.h"
#import "QuestDrop.h"
#import "Region.h"

static NSString *const NeedsReloadKey = @"NEED_RELOAD";

@interface CoreDataController ()

@property (readwrite, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readwrite, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readwrite, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation CoreDataController

#pragma mark - Singleton Method

+ (CoreDataController *)sharedCDController
{
    static CoreDataController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CoreDataController alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Initial Data Loading

- (void)tryLoadSequence
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:NeedsReloadKey]) {
        NSLog(@"Resetting Core Data");
        [self resetCoreData];
        NSLog(@"Core Data Reset. Loading Data.");
        [self loadMonsterData];
        NSLog(@"Monster data loaded.");
        [self loadMonsterDropData];
        NSLog(@"Monster Drop data loaded.");
        [self loadRegionData];
        NSLog(@"Region data loaded.");
        [self loadQuestData];
        NSLog(@"Quest Data loaded.");
        [self loadQuestDropData];
        NSLog(@"Quest Drop Data loaded.");
        [self saveContext];
        NSLog(@"Core Data Context Saved.");
        [CoreDataController setShouldTriggerReloadUponRestart:NO];
    }
}

+ (void)setShouldTriggerReloadUponRestart:(BOOL)shouldTriggerReloadUponRestart
{
    [[NSUserDefaults standardUserDefaults] setBool:shouldTriggerReloadUponRestart forKey:NeedsReloadKey];
}

+ (BOOL)willReloadUponRestart
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:NeedsReloadKey];
}

- (void)loadMonsterData
{
    NSArray *monsterList = [self loadArrayFromJsonFileNamed:MHDMonstersFileName];
    for (NSDictionary *monsterDict in monsterList) {
        Monster *monster = [self monsterWithName:monsterDict[MHDMonsterNameKey]];
        if (!monster) {
            monster = [Monster insertInManagedObjectContext:self.managedObjectContext];
        }
        monster.name = monsterDict[MHDMonsterNameKey];
        monster.monster_description = monsterDict[MHDMonsterDescriptionKey];
        monster.sort_name = monsterDict[MHDMonsterSortNameKey];
        monster.monster_class = monsterDict[MHDMonsterClassKey];
    }
}

- (void)loadMonsterDropData
{
    //Repeat this process for ten different JSON files
    for (NSUInteger fileNumber = 1; fileNumber <= 10; fileNumber++) {
        NSLog(@"Loading in monster drop file # %@", @(fileNumber));
        NSArray *dropList = [self loadArrayFromJsonFileNamed:[MHDMonsterDropsFileName stringByAppendingFormat:@"%@", @(fileNumber)]];
        for (NSDictionary *monsterDropDict in dropList) {
            //Check if the monster exists.  Do not bother even creating the drop if it does not
            Monster *monster = [self monsterWithName:monsterDropDict[MHDMonsterDropMonsterNameKey]];
            if (!monster) {
                continue;
            }
            NSPredicate *monsterDropPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterDropAttributes.id, monsterDropDict[MHDMonsterDropIDKey]];
            MonsterDrop *monsterDrop = (MonsterDrop *)[self uniqueEntityWithEntityName:[MonsterDrop entityName] withPredicate:monsterDropPredicate];
            if (!monsterDrop) {
                monsterDrop = [MonsterDrop insertInManagedObjectContext:self.managedObjectContext];
            }
            monsterDrop.item = [self getOrCreateItemWithName:monsterDropDict[MHDMonsterDropItemNameKey]];
            monsterDrop.percent = monsterDropDict[MHDMonsterDropPercentKey];
            monsterDrop.rank = monsterDropDict[MHDMonsterDropRankKey];
            monsterDrop.method = monsterDropDict[MHDMonsterDropMethodKey];
            monsterDrop.quantity = monsterDropDict[MHDMonsterDropQuantityKey];
            monsterDrop.id = monsterDropDict[MHDMonsterDropIDKey];
            monsterDrop.monsterSource = monster;
        }
    }
}

- (void)loadQuestData
{
    NSArray *questList = [self loadArrayFromJsonFileNamed:MHDQuestsFileName];
    
    for (NSDictionary *questDict in questList) {
        Quest *quest;
        NSNumber *questID = questDict[MHDQuestIDKey];
        NSPredicate *questPredicate = [NSPredicate predicateWithFormat:@"%K == %@", QuestAttributes.id, questID];
        quest = (Quest *)[self uniqueEntityWithEntityName:[Quest entityName] withPredicate:questPredicate];
        //Only add the quest if it is not already there
        if (!quest) {
            // Quests have a lot of information to populate, so I'm moving this to a helper method to cut down on the size of this method.
            quest = [self questFromDictionary:questDict];
        }
    }
    if (![self attemptSaveContext]) {
        NSLog(@"WARNING: Failed to save the item context!");
    }
}

- (void)loadQuestDropData
{
    NSArray *questDropList = [self loadArrayFromJsonFileNamed:MHDQuestDropsFileName];
    
    for (NSDictionary *dropDict in questDropList) {
        NSNumber *dropID = dropDict[MHDQuestDropIDKey];
        NSPredicate *dropPredicate = [NSPredicate predicateWithFormat:@"%K == %@", QuestDropAttributes.id, dropID];
        QuestDrop *drop = (QuestDrop *)[self uniqueEntityWithEntityName:[QuestDrop entityName] withPredicate:dropPredicate];
        if (!drop) {
            //Returns nil if the quest corresponding to this drop does not exist.
            drop = [self questDropFromDictionary:dropDict];
            if (!drop) {
                //If we reach this point, then the quest that this drop belongs to did not exist, and we should return without saving the context;
                //TODO: Better way to handle this?  Though this never SHOULD happen.
                return;
            }
        }
    }
    
    if (![self attemptSaveContext]) {
        NSLog(@"WARNING: Failed to save the item context!");
    }
}

- (void)loadRegionData
{
    NSArray *regionList = [self loadArrayFromJsonFileNamed:MHDRegionsFileName];
    
    for (NSDictionary *regionDict in regionList) {
        Region *region;
        NSNumber *regionID = regionDict[MHDRegionIDJSONKey];
        NSPredicate *regionPredicate = [NSPredicate predicateWithFormat:@"%K == %d", RegionAttributes.id, regionID.intValue];
        region = (Region *)[self uniqueEntityWithEntityName:[Region entityName] withPredicate:regionPredicate];
        // Only add the region if it is not already there
        if (!region) {
            region = [Region insertInManagedObjectContext:self.managedObjectContext];
            region.name = regionDict[MHDRegionNameKey];
            region.id = regionDict[MHDRegionIDJSONKey];
            region.keyName = regionDict[MHDRegionKeyNameKey];
        }
        // regardless if the region is new or not, we should populate it with area data
        // But first, we need to check that the region file exists
        NSArray *areaDrops = [self loadArrayFromJsonFileNamed:[region.keyName stringByAppendingString:MHDRegionDropsFileNameSuffix]];
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
                                  areaDropDict[MHDAreaDropAreaNameKey],
                                  areaDropDict[MHDAreaDropRankKey]];
    NSPredicate *areaPredicate = [NSPredicate predicateWithFormat:@"%K == %@", AreaAttributes.combinedName, areaCombinedName];
    Area *area = (Area *)[self uniqueEntityWithEntityName:[Area entityName] withPredicate:areaPredicate];
    // If the area doesn't already exist...
    if (!area) {
        // ... We need to create it, and add it to this region
        area = [Area insertInManagedObjectContext:self.managedObjectContext];
        area.name = areaDropDict[MHDAreaDropAreaNameKey];
        area.combinedName = areaCombinedName;
        area.region = region;
        area.rank = areaDropDict[MHDAreaDropRankKey];
        [region.areaSet addObject:area];
    }
    // If it wasn't already, the area is now attached to the region
    
    // We should now consider adding this drop to the area.
    // First, check if the area drop already exists, by way of checking the idDecimalString
    NSString *idDecimalString = areaDropDict[MHDAreaDropIDKey];
    NSPredicate *areaDropPredicate = [NSPredicate predicateWithFormat:@"%K == %@", AreaDropAttributes.idDecimalString, idDecimalString];
    AreaDrop *drop = (AreaDrop *)[self uniqueEntityWithEntityName:[AreaDrop entityName] withPredicate:areaDropPredicate];
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
        drop.method = areaDropDict[MHDAreaDropMethodKey];
        NSString *percent = areaDropDict[MHDAreaDropPercentKey];
        drop.percentValue = percent.integerValue;
        drop.quantity = areaDropDict[MHDAreaDropQuantityKey];
        drop.rank = areaDropDict[MHDAreaDropRankKey];
        
        // Hook up the area relationship.  We already ensured the area exists.
        drop.area = area;
        
        // Time to hook up the item relationship.  The item may or may not already exist.
        NSString *itemName = areaDropDict[MHDAreaDropItemNameKey];
        NSPredicate *itemPredicate = [NSPredicate predicateWithFormat:@"%K == %@", ItemAttributes.name, itemName];
        Item *item = (Item *)[self uniqueEntityWithEntityName:[Item entityName] withPredicate:itemPredicate];
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
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:MHDJSON];
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
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:MHDJSON];
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

- (NSManagedObject *)uniqueEntityWithEntityName:(NSString *)entityName withPredicate:(NSPredicate *)predicate
{
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    request.predicate = predicate;
    
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
    request.predicate = predicate;
    
    NSUInteger count = [self.managedObjectContext countForFetchRequest:request error:&error];
    if (count != NSNotFound) {
        return count;
    } else {
        return 0;
    }
}

- (QuestDrop *)questDropFromDictionary:(NSDictionary *)dropDict
{
    NSPredicate *questPredicate = [NSPredicate predicateWithFormat:@"%K == %@", QuestAttributes.id, dropDict[MHDQuestDropQuestIDKey]];
    Quest *quest = (Quest *)[self uniqueEntityWithEntityName:[Quest entityName] withPredicate:questPredicate];
    if (!quest) {
        //If the quest was not found, then it makes no sense to store this reward.  Just return nil.
        NSLog(@"The quest for a quest reward was not found!");
        return nil;
    }
    QuestDrop *drop = [QuestDrop insertInManagedObjectContext:self.managedObjectContext];
    drop.id = dropDict[MHDQuestDropIDKey];
    drop.row = dropDict[MHDQuestDropRowKey];
    drop.quantity = dropDict[MHDQuestDropQuantityKey];
    drop.percent = dropDict[MHDQuestDropPercentKey];
    drop.quest = quest;
    NSPredicate *itemPredicate = [NSPredicate predicateWithFormat:@"%K == %@", ItemAttributes.name, dropDict[MHDQuestDropItemNameKey]];
    Item *item = (Item *)[self uniqueEntityWithEntityName:[Item entityName] withPredicate:itemPredicate];
    if (!item) {
        item = [Item insertInManagedObjectContext:self.managedObjectContext];
        item.name = dropDict[MHDQuestDropItemNameKey];
    }
    drop.item = item;
    return drop;
}

- (Quest *)questFromDictionary:(NSDictionary *)questDict
{
    Quest *quest = [Quest insertInManagedObjectContext:self.managedObjectContext];
    quest.id = questDict[MHDQuestIDKey];
    quest.name = questDict[MHDQuestNameKey];
    if ([questDict[MHDQuestCaravanHallKey] isEqualToString:MHDQuestCaravanKey]) {
        quest.caravanValue = YES;
    } else {
        quest.caravanValue = NO;
    }
    if ([questDict[MHDQuestDangerKey] isEqualToString:MHDTrueString]) {
        quest.dangerValue = YES;
    } else {
        quest.dangerValue = NO;
    }
    quest.fee = questDict[MHDQuestFeeKey];
    quest.hrp = questDict[MHDQuestHRPKey];
    if ([questDict[MHDQuestKeyIndicatorKey] isEqualToString:MHDTrueString]) {
        quest.keyValue = YES;
    } else {
        quest.keyValue = NO;
    }
    quest.objective = questDict[MHDQuestObjectiveKey];
    quest.subObjective = questDict[MHDQuestSubQuestObjectiveKey];
    quest.reward = questDict[MHDQuestRewardKey];
    quest.stars = questDict[MHDQuestStarsKey];
    quest.type = questDict[MHDQuestTypeKey];
    if ([questDict[MHDQuestUrgentKey] isEqualToString:MHDTrueString]) {
        quest.urgentValue = YES;
    } else {
        quest.urgentValue = NO;
    }
    //TODO: add in outbreak bool handling once that data can be verified.
    
    NSPredicate *regionPredicate = [NSPredicate predicateWithFormat:@"%K == %@", RegionAttributes.keyName, questDict[MHDQuestMapKeyNameKey]];
    // If this method call returns nil, then quest.region will be nil.  That is okay!
    quest.region = (Region *)[self uniqueEntityWithEntityName:[Region entityName] withPredicate:regionPredicate];
    
    NSPredicate *monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, questDict[MHDQuestFirstMonsterKey]];
    // The same is the case with the following monster-fetching calls
    quest.firstMonster = (Monster *)[self uniqueEntityWithEntityName:[Monster entityName] withPredicate:monsterPredicate];
    if (quest.firstMonster) {
        //Continue on to the second, and so on.  By nesting this way, we can avoid unnecessary fetches
        monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, questDict[MHDQuestSecondMonsterKey]];
        quest.secondMonster = (Monster *)[self uniqueEntityWithEntityName:[Monster entityName] withPredicate:monsterPredicate];
        if (quest.secondMonster) {
            monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, questDict[MHDQuestThirdMonsterKey]];
            quest.thirdMonster = (Monster *)[self uniqueEntityWithEntityName:[Monster entityName] withPredicate:monsterPredicate];
            if (quest.thirdMonster) {
                monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, questDict[MHDQuestFourthMonsterKey]];
                quest.fourthMonster = (Monster *)[self uniqueEntityWithEntityName:[Monster entityName] withPredicate:monsterPredicate];
            }
        }
    }
    return quest;
}

- (Monster *)monsterWithName:(NSString *)name
{
    NSPredicate *monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, name];
    return (Monster *)[self uniqueEntityWithEntityName:[Monster entityName] withPredicate:monsterPredicate];
}

- (Item *)getOrCreateItemWithName:(NSString *)name
{
    NSPredicate *itemPredicate = [NSPredicate predicateWithFormat:@"%K == %@", ItemAttributes.name, name];
    Item *item = (Item *)[self uniqueEntityWithEntityName:[Item entityName] withPredicate:itemPredicate];
    if (!item) {
        item = [Item insertInManagedObjectContext:self.managedObjectContext];
        item.name = name;
    }
    return item;
}

#pragma makr - Core Data Helper Methods

- (void)resetCoreData
{
    NSArray *stores = self.persistentStoreCoordinator.persistentStores;
    for (NSPersistentStore *store in stores) {
        [self.persistentStoreCoordinator removePersistentStore:store error:nil];
        [[NSFileManager defaultManager] removeItemAtPath:store.URL.path error:nil];
    }
    
    self.persistentStoreCoordinator = nil;
    self.managedObjectContext = nil;
    self.managedObjectModel = nil;
}

#pragma mark - Boilerplate Core Data Code

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
        NSDictionary *dict = @{
                               NSLocalizedDescriptionKey: @"Failed to initialize the application's saved data",
                               NSLocalizedFailureReasonErrorKey: failureReason,
                               NSUnderlyingErrorKey: error,
                               };
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
