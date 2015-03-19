//
//  CoreDataController.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 2/6/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "CoreDataController.h"

#import <NSManagedObjectContext+Hydrate.h>

#import "Area.h"
#import "AreaDrop.h"
#import "DamageZone.h"
#import "Item.h"
#import "Monster.h"
#import "MonsterDrop.h"
#import "Quest.h"
#import "QuestDrop.h"
#import "Region.h"

@interface CoreDataController ()

@property (readwrite, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readwrite, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readwrite, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation CoreDataController

static NSString *const JSON = @"json";
static NSString *const TrueString = @"TRUE";

#pragma mark - Item Constants

static NSString *const ItemNameKey = @"name";

#pragma mark - Monster Constants

static NSString *const MonsterIDKey = @"id";
static NSString *const MonstersFileName = @"monsters";
static NSString *const MonsterDamageZonesFileName = @"damageZones";

#pragma mark - Area Constants

static NSString *const AreaCombinedNameKey = @"combinedName";

#pragma mark - Region Constants

static NSString *const RegionsFileName = @"regions";
static NSString *const RegionIDJSONKey = @"_id";
static NSString *const RegionNameKey = @"region_name";
static NSString *const RegionKeyNameKey = @"keyName";
static NSString *const RegionDropsFileNameSuffix = @"_drops";

#pragma mark - Quest Constants

static NSString *const QuestsFileName = @"quests";
static NSString *const QuestIDKey = @"unique_id";
static NSString *const QuestNameKey = @"name";
static NSString *const QuestCaravanHallKey = @"caravan/hall";
static NSString *const QuestDangerKey = @"danger";
static NSString *const QuestFeeKey = @"fee";
static NSString *const QuestHRPKey = @"hrp";
static NSString *const QuestMapKeyNameKey = @"map";
static NSString *const QuestKeyIndicatorKey = @"key";
static NSString *const QuestObjectiveKey = @"objective";
static NSString *const QuestRewardKey = @"reward";
static NSString *const QuestStarsKey = @"stars";
static NSString *const QuestSubQuestObjectiveKey = @"subquest";
static NSString *const QuestFirstMonsterKey = @"target";
static NSString *const QuestSecondMonsterKey = @"second_target";
static NSString *const QuestThirdMonsterKey = @"third_target";
static NSString *const QuestFourthMonsterKey = @"fourth_target";
static NSString *const QuestTypeKey = @"type";
static NSString *const QuestUrgentKey = @"urgent";
static NSString *const QuestCaravanKey = @"caravan";
static NSString *const QuestNoneString = @"None";

#pragma mark - Quest Drop Constants

static NSString *const QuestDropsFileName = @"quest_drops";
static NSString *const QuestDropIDKey = @"dropID";
static NSString *const QuestDropQuestIDKey = @"questID";
static NSString *const QuestDropRowKey = @"row";
static NSString *const QuestDropItemNameKey = @"item";
static NSString *const QuestDropQuantityKey = @"quantity";
static NSString *const QuestDropPercentKey = @"percent";

#pragma mark - Monster Drop Constants

static NSString *const MonsterDropsFileName = @"monsterDrops";
static NSString *const MonsterDropIDKey = @"id";
static NSString *const MonsterDropMethodKey = @"method";
static NSString *const MonsterDropQuantityKey = @"quantity";
static NSString *const MonsterDropRankKey = @"rank";
static NSString *const MonsterDropPercentKey = @"percent";
static NSString *const MonsterDropMonsterNameKey = @"monster_name";
static NSString *const MonsterDropMonsterIDKey = @"monster_id";
static NSString *const MonsterDropItemNameKey = @"item_name";

#pragma mark - Area Drop Constants

static NSString *const AreaDropAreaNameKey = @"area";
static NSString *const AreaDropRankKey = @"rank";
static NSString *const AreaDropIDKey = @"_id";
static NSString *const AreaDropMethodKey = @"method";
static NSString *const AreaDropPercentKey = @"chance";
static NSString *const AreaDropQuantityKey = @"number";
static NSString *const AreaDropItemNameKey = @"item";

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

- (void)loadMonsterData
{
    // Because monsters are added first, there are no relationships to set up, so we can hydrate them.
    NSString *path = [[NSBundle mainBundle] pathForResource:MonstersFileName ofType:JSON];
    NSDictionary *attributes = @{
                                 MonsterAttributes.id: @"_id",
                                 MonsterAttributes.monster_class: @"class",
                                 MonsterAttributes.name: @"name",
                                 MonsterAttributes.jpn_name: @"jpn_name",
                                 MonsterAttributes.sort_name: @"sort_name",
                                 MonsterAttributes.trait: @"trait",
                                 MonsterAttributes.icon: @"icon_name",
                                 MonsterAttributes.url: @"url",
                                 };
    [self.managedObjectContext hydrateStoreWithJSONAtPath:path attributeMappings:attributes forEntityName:[Monster entityName]];
    path = [[NSBundle mainBundle] pathForResource:MonsterDamageZonesFileName ofType:JSON];
    attributes = @{
                   DamageZoneAttributes.id: @"_id",
                   DamageZoneAttributes.monsterID: @"monster_id",
                   DamageZoneAttributes.monsterName: @"monster_name",
                   DamageZoneAttributes.jpnMonsterName: @"jpn_monster_name",
                   DamageZoneAttributes.bodyPart: @"body_part",
                   DamageZoneAttributes.cut: @"cut",
                   DamageZoneAttributes.impact: @"impact",
                   DamageZoneAttributes.shot: @"shot",
                   DamageZoneAttributes.fire: @"fire",
                   DamageZoneAttributes.water: @"water",
                   DamageZoneAttributes.thunder: @"thunder",
                   DamageZoneAttributes.ice: @"ice",
                   DamageZoneAttributes.dragon: @"dragon",
                   DamageZoneAttributes.ko: @"ko",
                   DamageZoneAttributes.extract: @"extract",
                   };
    [self.managedObjectContext hydrateStoreWithJSONAtPath:path attributeMappings:attributes forEntityName:[DamageZone entityName]];
}

- (void)loadMonsterDropData
{
    NSArray *dropList = [self loadArrayFromJsonFileNamed:MonsterDropsFileName];
    for (NSDictionary *drop in dropList) {
        // Only add the drop if it is not already there
        NSNumber *monsterDropID = drop[MonsterDropIDKey];
        NSPredicate *monsterDropPredicate = [NSPredicate predicateWithFormat:@"%K == %d", MonsterAttributes.id, monsterDropID.intValue];
        if (![self countForEntityWithEntityName:[MonsterDrop entityName] withPredicate:monsterDropPredicate]) {
            MonsterDrop *newDrop = [MonsterDrop insertInManagedObjectContext:self.managedObjectContext];
            newDrop.id = drop[MonsterDropIDKey];
            newDrop.method = drop[MonsterDropMethodKey];
            newDrop.quantity = drop[MonsterDropQuantityKey];
            
            // If the Item for this drop already exists in the persistent store ...
            NSPredicate *itemPredicate = [NSPredicate predicateWithFormat:@"%K == %@", ItemAttributes.name, drop[MonsterDropItemNameKey]];
            Item *item = (Item *)[self uniqueEntityWithEntityName:[Item entityName] withPredicate:itemPredicate];
            if (!item) {
                item = [Item insertInManagedObjectContext:self.managedObjectContext];
                item.name = drop[MonsterDropItemNameKey];
            }
            newDrop.item = item;
            // If this is a monster drop ...
            NSString *monsterName = drop[MonsterDropMonsterNameKey];
            if (monsterName.length) {
                // We need to add this drop to the monster's list, if it is not there already.
                
                // First we should ensure that the monster already exists in the persistent store
                NSNumber *monsterID = drop[MonsterDropMonsterIDKey];
                NSPredicate *monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %d", MonsterAttributes.id, monsterID.intValue];
                Monster *monster = (Monster *)[self uniqueEntityWithEntityName:[Monster entityName] withPredicate:monsterPredicate];
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

- (void)loadQuestData
{
    NSArray *questList = [self loadArrayFromJsonFileNamed:QuestsFileName];
    
    for (NSDictionary *questDict in questList) {
        Quest *quest;
        NSNumber *questID = questDict[QuestIDKey];
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
    NSArray *questDropList = [self loadArrayFromJsonFileNamed:QuestDropsFileName];
    
    for (NSDictionary *dropDict in questDropList) {
        NSNumber *dropID = dropDict[QuestDropIDKey];
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
    NSArray *regionList = [self loadArrayFromJsonFileNamed:RegionsFileName];
    
    for (NSDictionary *regionDict in regionList) {
        Region *region;
        NSNumber *regionID = regionDict[RegionIDJSONKey];
        NSPredicate *regionPredicate = [NSPredicate predicateWithFormat:@"%K == %d", RegionAttributes.id, regionID.intValue];
        region = (Region *)[self uniqueEntityWithEntityName:[Region entityName] withPredicate:regionPredicate];
        // Only add the region if it is not already there
        if (!region) {
            region = [Region insertInManagedObjectContext:self.managedObjectContext];
            region.name = regionDict[RegionNameKey];
            region.id = regionDict[RegionIDJSONKey];
            region.keyName = regionDict[RegionKeyNameKey];
        }
        // regardless if the region is new or not, we should populate it with area data
        // But first, we need to check that the region file exists
        NSArray *areaDrops = [self loadArrayFromJsonFileNamed:[region.keyName stringByAppendingString:RegionDropsFileNameSuffix]];
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
    NSPredicate *areaPredicate = [NSPredicate predicateWithFormat:@"%K == %@", AreaAttributes.combinedName, areaCombinedName];
    Area *area = (Area *)[self uniqueEntityWithEntityName:[Area entityName] withPredicate:areaPredicate];
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
        drop.method = areaDropDict[AreaDropMethodKey];
        NSString *percent = areaDropDict[AreaDropPercentKey];
        drop.percentValue = percent.integerValue;
        drop.quantity = areaDropDict[AreaDropQuantityKey];
        drop.rank = areaDropDict[AreaDropRankKey];
        
        // Hook up the area relationship.  We already ensured the area exists.
        drop.area = area;
        
        // Time to hook up the item relationship.  The item may or may not already exist.
        NSString *itemName = areaDropDict[AreaDropItemNameKey];
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
    NSPredicate *questPredicate = [NSPredicate predicateWithFormat:@"%K == %@", QuestAttributes.id, dropDict[QuestDropQuestIDKey]];
    Quest *quest = (Quest *)[self uniqueEntityWithEntityName:[Quest entityName] withPredicate:questPredicate];
    if (!quest) {
        //If the quest was not found, then it makes no sense to store this reward.  Just return nil.
        NSLog(@"The quest for a quest reward was not found!");
        return nil;
    }
    QuestDrop *drop = [QuestDrop insertInManagedObjectContext:self.managedObjectContext];
    drop.id = dropDict[QuestDropIDKey];
    drop.row = dropDict[QuestDropRowKey];
    drop.quantity = dropDict[QuestDropQuantityKey];
    drop.percent = dropDict[QuestDropPercentKey];
    drop.quest = quest;
    NSPredicate *itemPredicate = [NSPredicate predicateWithFormat:@"%K == %@", ItemAttributes.name, dropDict[QuestDropItemNameKey]];
    Item *item = (Item *)[self uniqueEntityWithEntityName:[Item entityName] withPredicate:itemPredicate];
    if (!item) {
        item = [Item insertInManagedObjectContext:self.managedObjectContext];
        item.name = dropDict[QuestDropItemNameKey];
    }
    drop.item = item;
    return drop;
}

- (Quest *)questFromDictionary:(NSDictionary *)questDict
{
    Quest *quest = [Quest insertInManagedObjectContext:self.managedObjectContext];
    quest.id = questDict[QuestIDKey];
    quest.name = questDict[QuestNameKey];
    if ([questDict[QuestCaravanHallKey] isEqualToString:QuestCaravanKey]) {
        quest.caravanValue = YES;
    } else {
        quest.caravanValue = NO;
    }
    if ([questDict[QuestDangerKey] isEqualToString:TrueString]) {
        quest.dangerValue = YES;
    } else {
        quest.dangerValue = NO;
    }
    quest.fee = questDict[QuestFeeKey];
    quest.hrp = questDict[QuestHRPKey];
    if ([questDict[QuestKeyIndicatorKey] isEqualToString:TrueString]) {
        quest.keyValue = YES;
    } else {
        quest.keyValue = NO;
    }
    quest.objective = questDict[QuestObjectiveKey];
    quest.subObjective = questDict[QuestSubQuestObjectiveKey];
    quest.reward = questDict[QuestRewardKey];
    quest.stars = questDict[QuestStarsKey];
    quest.type = questDict[QuestTypeKey];
    if ([questDict[QuestUrgentKey] isEqualToString:TrueString]) {
        quest.urgentValue = YES;
    } else {
        quest.urgentValue = NO;
    }
    //TODO: add in outbreak bool handling once that data can be verified.
    
    NSPredicate *regionPredicate = [NSPredicate predicateWithFormat:@"%K == %@", RegionAttributes.keyName, questDict[QuestMapKeyNameKey]];
    // If this method call returns nil, then quest.region will be nil.  That is okay!
    quest.region = (Region *)[self uniqueEntityWithEntityName:[Region entityName] withPredicate:regionPredicate];
    
    NSPredicate *monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, questDict[QuestFirstMonsterKey]];
    // The same is the case with the following monster-fetching calls
    quest.firstMonster = (Monster *)[self uniqueEntityWithEntityName:[Monster entityName] withPredicate:monsterPredicate];
    if (quest.firstMonster) {
        //Continue on to the second, and so on.  By nesting this way, we can avoid unnecessary fetches
        monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, questDict[QuestSecondMonsterKey]];
        quest.secondMonster = (Monster *)[self uniqueEntityWithEntityName:[Monster entityName] withPredicate:monsterPredicate];
        if (quest.secondMonster) {
            monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, questDict[QuestThirdMonsterKey]];
            quest.thirdMonster = (Monster *)[self uniqueEntityWithEntityName:[Monster entityName] withPredicate:monsterPredicate];
            if (quest.thirdMonster) {
                monsterPredicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, questDict[QuestFourthMonsterKey]];
                quest.fourthMonster = (Monster *)[self uniqueEntityWithEntityName:[Monster entityName] withPredicate:monsterPredicate];
            }
        }
    }
    return quest;
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
