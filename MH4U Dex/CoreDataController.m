//
//  CoreDataController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "CoreDataController.h"

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
static NSString *const MonsterDropFilePrefix = @"monster_drops";

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
    //TODO: Remove these NSLog Calls once everything is verified to work with the final model.
    if ([[NSUserDefaults standardUserDefaults] boolForKey:NeedsReloadKey]) {
        NSLog(@"Resetting Core Data");
        [self resetCoreData];
        NSManagedObjectContext *backgroundContext = [self backgroundManagedObjectContext];
        //TODO: Uncomment this when needed, when changing the model or adding new data
//        NSLog(@"Core Data Reset. Loading Data.");
//        [self loadMonsterDataWithContext:backgroundContext];
//        NSLog(@"Monster data loaded.");
//        [self loadMonsterDamageZoneDataWithContext:backgroundContext];
//        NSLog(@"Monster Damage Zone data loaded.");
//        [self loadMonsterDropDataWithContext:backgroundContext];
//        NSLog(@"Monster Drop data loaded.");
//        [self loadRegionDataWithContext:backgroundContext];
//        NSLog(@"Region data loaded.");
//        [self loadQuestDataWithContext:backgroundContext];
//        NSLog(@"Quest Data loaded.");
//        [self loadQuestDropDataWithContext:backgroundContext];
//        NSLog(@"Quest Drop Data loaded.");
        [self attemptSaveContext:backgroundContext];
        NSLog(@"Core Data Context Saved.");
        [CoreDataController setShouldTriggerReloadUponRestart:NO];
    }
}

+ (void)setShouldTriggerReloadUponRestart:(BOOL)shouldTriggerReloadUponRestart
{
    [[NSUserDefaults standardUserDefaults] setBool:shouldTriggerReloadUponRestart forKey:NeedsReloadKey];
}

+ (BOOL)shouldTriggerReloadUponRestart
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:NeedsReloadKey];
}

- (void)loadMonsterDataWithContext:(NSManagedObjectContext *)context
{
    NSArray *monsterList = [self loadArrayFromJsonFileNamed:MHDMonstersFileName];
    for (NSDictionary *monsterDict in monsterList) {
        Monster *monster = [self monsterWithName:monsterDict[MHDMonsterNameKey] withContext:context];
        if (!monster) {
            monster = [Monster insertInManagedObjectContext:context];
        }
        monster.name = monsterDict[MHDMonsterNameKey];
        monster.monster_description = monsterDict[MHDMonsterDescriptionKey];
        monster.sort_name = monsterDict[MHDMonsterSortNameKey];
        monster.monster_class = monsterDict[MHDMonsterClassKey];
    }
}

- (void)loadMonsterDropDataWithContext:(NSManagedObjectContext *)context
{
    //Repeat this process for each JSON file
    NSArray *urlArray = [[NSBundle mainBundle] URLsForResourcesWithExtension:MHDJSON subdirectory:nil];
    for (NSURL *url in urlArray)  {
        NSString *fileName = [[url URLByDeletingPathExtension] lastPathComponent];
        if ([fileName hasPrefix:MonsterDropFilePrefix]) {
            NSLog(@"Loading in monster drop file: %@", fileName);
            NSArray *dropList = [self loadArrayFromJsonFileNamed:fileName];
            for (NSDictionary *monsterDropDict in dropList) {
                //Check if the monster exists.  Do not bother even creating the drop if it does not
                Monster *monster = [self monsterWithName:monsterDropDict[MHDMonsterDropMonsterNameKey] withContext:context];
                if (!monster) {
                    continue;
                }
                NSPredicate *monsterDropPredicate;
                NSNumber *monsterDropID = monsterDropDict[MHDMonsterDropIDKey];
                monsterDropPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterDropAttributes.id, monsterDropID];
                MonsterDrop *monsterDrop = (MonsterDrop *)[self uniqueEntityWithEntityName:[MonsterDrop entityName]
                                                                             withPredicate:monsterDropPredicate
                                                                               withContext:context];
                if (!monsterDrop) {
                    monsterDrop = [MonsterDrop insertInManagedObjectContext:context];
                }
                monsterDrop.item = [self getOrCreateItemWithName:monsterDropDict[MHDMonsterDropItemNameKey] withContext:context];
                monsterDrop.percent = monsterDropDict[MHDMonsterDropPercentKey];
                monsterDrop.rank = monsterDropDict[MHDMonsterDropRankKey];
                monsterDrop.method = monsterDropDict[MHDMonsterDropMethodKey];
                monsterDrop.quantity = monsterDropDict[MHDMonsterDropQuantityKey];
                monsterDrop.id = monsterDropDict[MHDMonsterDropIDKey];
                monsterDrop.monsterSource = monster;
            }
        }
    }
}

- (void)loadMonsterDamageZoneDataWithContext:(NSManagedObjectContext *)context
{
    NSArray *damageZoneList = [self loadArrayFromJsonFileNamed:MHDDamageZonesFileName];
    for (NSDictionary *damageZoneDict in damageZoneList) {
        Monster *monster = [self monsterWithName:damageZoneDict[MHDDamageZoneMonsterNameKey] withContext:context];
        if (!monster) {
            continue;
        }
        DamageZone *damageZone = [self getOrCreateDamageZoneWithID:damageZoneDict[MHDDamageZoneIDKey] withContext:context];
        damageZone.monster = monster;
        damageZone.cut = damageZoneDict[MHDDamageZoneCutKey];
        damageZone.impact = damageZoneDict[MHDDamageZoneImpactKey];
        damageZone.shot = damageZoneDict[MHDDamageZoneShotKey];
        damageZone.fire = damageZoneDict[MHDDamageZoneFireKey];
        damageZone.water = damageZoneDict[MHDDamageZoneWaterKey];
        damageZone.ice = damageZoneDict[MHDDamageZoneIceKey];
        damageZone.dragon = damageZoneDict[MHDDamageZoneDragonKey];
        damageZone.bodyPart = damageZoneDict[MHDDamageZonePartKey];
    }
}

- (void)loadQuestDataWithContext:(NSManagedObjectContext *)context
{
    NSArray *questList = [self loadArrayFromJsonFileNamed:MHDQuestsFileName];
    
    for (NSDictionary *questDict in questList) {
        Quest *quest;
        NSNumber *questID = questDict[MHDQuestIDKey];
        NSPredicate *questPredicate = [NSPredicate predicateWithFormat:@"%K == %@", QuestAttributes.id, questID];
        quest = (Quest *)[self uniqueEntityWithEntityName:[Quest entityName]
                                            withPredicate:questPredicate
                                              withContext:context];
        //Only add the quest if it is not already there
        if (!quest) {
            // Quests have a lot of information to populate, so I'm moving this to a helper method to cut down on the size of this method.
            quest = [self questFromDictionary:questDict withContext:context];
        }
    }
    if (![self attemptSaveContext:context]) {
        NSLog(@"WARNING: Failed to save the item context!");
    }
}

- (void)loadQuestDropDataWithContext:(NSManagedObjectContext *)context
{
    NSArray *questDropList = [self loadArrayFromJsonFileNamed:MHDQuestDropsFileName];
    
    for (NSDictionary *dropDict in questDropList) {
        NSNumber *dropID = dropDict[MHDQuestDropIDKey];
        NSPredicate *dropPredicate = [NSPredicate predicateWithFormat:@"%K == %@", QuestDropAttributes.id, dropID];
        QuestDrop *drop = (QuestDrop *)[self uniqueEntityWithEntityName:[QuestDrop entityName]
                                                          withPredicate:dropPredicate
                                                            withContext:context];
        if (!drop) {
            //Returns nil if the quest corresponding to this drop does not exist.
            drop = [self questDropFromDictionary:dropDict WithContext:context];
            if (!drop) {
                //If we reach this point, then the quest that this drop belongs to did not exist, and we should return without saving the context;
                //TODO: Better way to handle this?  Though this never SHOULD happen.
                return;
            }
        }
    }
    
    if (![self attemptSaveContext:context]) {
        NSLog(@"WARNING: Failed to save the item context!");
    }
}

- (void)loadRegionDataWithContext:(NSManagedObjectContext *)context
{
    NSArray *regionList = [self loadArrayFromJsonFileNamed:MHDRegionsFileName];
    
    for (NSDictionary *regionDict in regionList) {
        Region *region;
        NSNumber *regionID = regionDict[MHDRegionIDJSONKey];
        NSPredicate *regionPredicate = [NSPredicate predicateWithFormat:@"%K == %d", RegionAttributes.id, regionID.intValue];
        region = (Region *)[self uniqueEntityWithEntityName:[Region entityName]
                                              withPredicate:regionPredicate
                                                withContext:context];
        // Only add the region if it is not already there
        if (!region) {
            region = [Region insertInManagedObjectContext:context];
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
                [self addAreaDropFromDictionary:areaDrop
                                       toRegion:region
                                    withContext:context];
            }
        }
    }
    
    // We should now try to save the manged object context
    if (![self attemptSaveContext:context]) {
        NSLog(@"WARNING: Failed to save the item context!");
    }
}

- (void)addAreaDropFromDictionary:(NSDictionary *)areaDropDict
                         toRegion:(Region *)region
                      withContext:(NSManagedObjectContext *)context
{
    //First, let's check if the area that this areaDrop takes place in actually exists!
    NSString *areaCombinedName = [NSString stringWithFormat:@"%@-%@-%@",
                                  region.name,
                                  areaDropDict[MHDAreaDropAreaNameKey],
                                  areaDropDict[MHDAreaDropRankKey]];
    NSPredicate *areaPredicate = [NSPredicate predicateWithFormat:@"%K == %@", AreaAttributes.combinedName, areaCombinedName];
    Area *area = (Area *)[self uniqueEntityWithEntityName:[Area entityName]
                                            withPredicate:areaPredicate
                                              withContext:context];
    // If the area doesn't already exist...
    if (!area) {
        // ... We need to create it, and add it to this region
        area = [Area insertInManagedObjectContext:context];
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
    AreaDrop *drop = (AreaDrop *)[self uniqueEntityWithEntityName:[AreaDrop entityName]
                                                    withPredicate:areaDropPredicate
                                                      withContext:context];
    //If the drop already exists...
    if (drop) {
        // TODO: do we need to do more here?
        // ... do nothing. (At least for now).
        return;
    } else {
        // This else is not needed, but helps for clarity IMO.
        // Hook up the drop.
        drop = [AreaDrop insertInManagedObjectContext:context];
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
        Item *item = (Item *)[self uniqueEntityWithEntityName:[Item entityName]
                                                withPredicate:itemPredicate
                                                  withContext:context];
        if (!item) {
            item = [Item insertInManagedObjectContext:context];
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

- (BOOL)attemptSaveContext:(NSManagedObjectContext *)context
{
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", error, error.localizedDescription);
        return NO;
    }
    return YES;
}

- (NSManagedObject *)uniqueEntityWithEntityName:(NSString *)entityName withPredicate:(NSPredicate *)predicate withContext:(NSManagedObjectContext *)context
{
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    request.predicate = predicate;
    
    NSArray *results = [context executeFetchRequest:request error:&error];
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

- (NSUInteger)countForEntityWithEntityName:(NSString *)entityName withPredicate:(NSPredicate *)predicate withContext:(NSManagedObjectContext *)context
{
    NSError *error = nil;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:entityName];
    request.predicate = predicate;
    
    NSUInteger count = [context countForFetchRequest:request error:&error];
    if (count != NSNotFound) {
        return count;
    } else {
        return 0;
    }
}

- (QuestDrop *)questDropFromDictionary:(NSDictionary *)dropDict WithContext:(NSManagedObjectContext *)context
{
    NSPredicate *questPredicate = [NSPredicate predicateWithFormat:@"%K == %@", QuestAttributes.id, dropDict[MHDQuestDropQuestIDKey]];
    Quest *quest = (Quest *)[self uniqueEntityWithEntityName:[Quest entityName]
                                               withPredicate:questPredicate
                                                 withContext:context];
    if (!quest) {
        //If the quest was not found, then it makes no sense to store this reward.  Just return nil.
        NSLog(@"The quest for a quest reward was not found!");
        return nil;
    }
    QuestDrop *drop = [QuestDrop insertInManagedObjectContext:context];
    drop.id = dropDict[MHDQuestDropIDKey];
    drop.row = dropDict[MHDQuestDropRowKey];
    drop.quantity = dropDict[MHDQuestDropQuantityKey];
    drop.percent = dropDict[MHDQuestDropPercentKey];
    drop.quest = quest;
    NSPredicate *itemPredicate = [NSPredicate predicateWithFormat:@"%K == %@", ItemAttributes.name, dropDict[MHDQuestDropItemNameKey]];
    Item *item = (Item *)[self uniqueEntityWithEntityName:[Item entityName]
                                            withPredicate:itemPredicate
                                              withContext:context];
    if (!item) {
        item = [Item insertInManagedObjectContext:context];
        item.name = dropDict[MHDQuestDropItemNameKey];
    }
    drop.item = item;
    return drop;
}

- (Quest *)questFromDictionary:(NSDictionary *)questDict withContext:(NSManagedObjectContext *)context
{
    Quest *quest = [Quest insertInManagedObjectContext:context];
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
    quest.region = (Region *)[self uniqueEntityWithEntityName:[Region entityName]
                                                withPredicate:regionPredicate
                                                  withContext:context];
    
    NSPredicate *monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, questDict[MHDQuestFirstMonsterKey]];
    // The same is the case with the following monster-fetching calls
    quest.firstMonster = (Monster *)[self uniqueEntityWithEntityName:[Monster entityName]
                                                       withPredicate:monsterPredicate
                                                         withContext:context];
    if (quest.firstMonster) {
        //Continue on to the second, and so on.  By nesting this way, we can avoid unnecessary fetches
        monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, questDict[MHDQuestSecondMonsterKey]];
        quest.secondMonster = (Monster *)[self uniqueEntityWithEntityName:[Monster entityName]
                                                            withPredicate:monsterPredicate
                                                              withContext:context];
        if (quest.secondMonster) {
            monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, questDict[MHDQuestThirdMonsterKey]];
            quest.thirdMonster = (Monster *)[self uniqueEntityWithEntityName:[Monster entityName]
                                                               withPredicate:monsterPredicate
                                                                 withContext:context];
            if (quest.thirdMonster) {
                monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, questDict[MHDQuestFourthMonsterKey]];
                quest.fourthMonster = (Monster *)[self uniqueEntityWithEntityName:[Monster entityName]
                                                                    withPredicate:monsterPredicate
                                                                      withContext:context];
            }
        }
    }
    return quest;
}

- (Monster *)monsterWithName:(NSString *)name withContext:(NSManagedObjectContext *)context
{
    NSPredicate *monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, name];
    return (Monster *)[self uniqueEntityWithEntityName:[Monster entityName]
                                         withPredicate:monsterPredicate
                                           withContext:context];
}

- (Item *)getOrCreateItemWithName:(NSString *)name withContext:(NSManagedObjectContext *)context
{
    NSPredicate *itemPredicate = [NSPredicate predicateWithFormat:@"%K == %@", ItemAttributes.name, name];
    Item *item = (Item *)[self uniqueEntityWithEntityName:[Item entityName]
                                            withPredicate:itemPredicate
                                              withContext:context];
    if (!item) {
        item = [Item insertInManagedObjectContext:context];
        item.name = name;
    }
    return item;
}

- (DamageZone *)getOrCreateDamageZoneWithID:(NSNumber *)damageZoneID withContext:(NSManagedObjectContext *)context
{
    NSPredicate *damageZonePredicate = [NSPredicate predicateWithFormat:@"%K == %@", DamageZoneAttributes.id, damageZoneID];
    DamageZone *damageZone = (DamageZone *)[self uniqueEntityWithEntityName:[DamageZone entityName]
                                                              withPredicate:damageZonePredicate
                                                                withContext:context];
    if (!damageZone) {
        damageZone = [DamageZone insertInManagedObjectContext:context];
        damageZone.id = damageZoneID;
    }
    return damageZone;
}

#pragma mark - Core Data Helper Methods

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

- (void)resetManagedObjectContext
{
    _managedObjectContext = nil;
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
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [self.applicationDocumentsDirectory URLByAppendingPathComponent:@"MH4U_DEX.sqlite"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    // If the expected store doesn't exist, copy the default store.
    if (![fileManager fileExistsAtPath:storeURL.path]) {
        NSURL *defaultStoreURL = [[NSBundle mainBundle] URLForResource:@"PREBUILT_STORE" withExtension:@"sqlite"];
        if (defaultStoreURL) {
            NSError *fileCopyError;
            if (![fileManager copyItemAtURL:defaultStoreURL
                                      toURL:storeURL
                                      error:&fileCopyError]) {
                //TODO: Consider debugging the error.
                NSLog(@"Unresolved error %@", fileCopyError);
            }
        }
        
    }
    NSDictionary *options = @{
                              NSMigratePersistentStoresAutomaticallyOption: @YES,
                              NSInferMappingModelAutomaticallyOption: @YES,
                              };
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
    NSError *persistentStoreError = nil;
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                   configuration:nil
                                                             URL:storeURL
                                                         options:options
                                                           error:&persistentStoreError]) {
        //TODO: Handle error better.
        NSLog(@"Unresolved error %@, %@", persistentStoreError, [persistentStoreError userInfo]);
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

- (NSManagedObjectContext *)backgroundManagedObjectContext
{
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    NSManagedObjectContext *context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSConfinementConcurrencyType];
    [context setPersistentStoreCoordinator:coordinator];
    return context;
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
