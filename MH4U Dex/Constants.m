//
//  Constants.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/18/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "Constants.h"

@implementation Constants

NSString *const JSON = @"json";
NSString *const TrueString = @"TRUE";

#pragma mark - Item Constants

NSString *const ItemNameKey = @"name";

#pragma mark - Monster Constants

NSString *const MonsterIDKey = @"id";
NSString *const MonstersFileName = @"monsters";
NSString *const MonsterDamageZonesFileName = @"damageZones";

#pragma mark - Area Constants

NSString *const AreaCombinedNameKey = @"combinedName";

#pragma mark - Region Constants

NSString *const RegionsFileName = @"regions";
NSString *const RegionIDJSONKey = @"_id";
NSString *const RegionNameKey = @"region_name";
NSString *const RegionKeyNameKey = @"keyName";
NSString *const RegionDropsFileNameSuffix = @"_drops";

#pragma mark - Quest Constants

NSString *const QuestsFileName = @"quests";
NSString *const QuestIDKey = @"unique_id";
NSString *const QuestNameKey = @"name";
NSString *const QuestCaravanHallKey = @"caravan/hall";
NSString *const QuestDangerKey = @"danger";
NSString *const QuestFeeKey = @"fee";
NSString *const QuestHRPKey = @"hrp";
NSString *const QuestMapKeyNameKey = @"map";
NSString *const QuestKeyIndicatorKey = @"key";
NSString *const QuestObjectiveKey = @"objective";
NSString *const QuestRewardKey = @"reward";
NSString *const QuestStarsKey = @"stars";
NSString *const QuestSubQuestObjectiveKey = @"subquest";
NSString *const QuestFirstMonsterKey = @"target";
NSString *const QuestSecondMonsterKey = @"second_target";
NSString *const QuestThirdMonsterKey = @"third_target";
NSString *const QuestFourthMonsterKey = @"fourth_target";
NSString *const QuestTypeKey = @"type";
NSString *const QuestUrgentKey = @"urgent";
NSString *const QuestCaravanKey = @"caravan";
NSString *const QuestNoneString = @"None";

#pragma mark - Quest Drop Constants

NSString *const QuestDropsFileName = @"quest_drops";
NSString *const QuestDropIDKey = @"dropID";
NSString *const QuestDropQuestIDKey = @"questID";
NSString *const QuestDropRowKey = @"row";
NSString *const QuestDropItemNameKey = @"item";
NSString *const QuestDropQuantityKey = @"quantity";
NSString *const QuestDropPercentKey = @"percent";

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

@end
