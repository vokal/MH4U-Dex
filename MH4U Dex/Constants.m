//
//  Constants.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/18/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import "Constants.h"

@implementation Constants

NSString *const MHDJSON = @"json";
NSString *const MHDTrueString = @"TRUE";
NSString *const MHDLowConstString = @"Low";
NSString *const MHDHighConstString = @"High";
NSString *const MHDGConstString = @"G";

#pragma mark - Item Constants

NSString *const MHDItemNameKey = @"name";


#pragma mark - Monster Constants

NSString *const MHDMonsterDescriptionKey = @"description";
NSString *const MHDMonsterNameKey = @"name";
NSString *const MHDMonsterSortNameKey = @"sort_name";
NSString *const MHDMonstersFileName = @"monster_list";
NSString *const MHDMonsterClassKey = @"class";
NSString *const MHDBoss = @"Boss";
NSString *const MHDMinion = @"Minion";

#pragma mark - Area Constants

NSString *const MHDAreaCombinedNameKey = @"combinedName";

#pragma mark - Region Constants

NSString *const MHDRegionsFileName = @"regions";
NSString *const MHDRegionIDJSONKey = @"_id";
NSString *const MHDRegionNameKey = @"region_name";
NSString *const MHDRegionKeyNameKey = @"keyName";
NSString *const MHDRegionDropsFileNameSuffix = @"_drops";

#pragma mark - Quest Constants

NSString *const MHDQuestsFileName = @"quests";
NSString *const MHDQuestIDKey = @"unique_id";
NSString *const MHDQuestNameKey = @"name";
NSString *const MHDQuestCaravanHallKey = @"caravan/hall";
NSString *const MHDQuestDangerKey = @"danger";
NSString *const MHDQuestFeeKey = @"fee";
NSString *const MHDQuestHRPKey = @"hrp";
NSString *const MHDQuestMapKeyNameKey = @"map";
NSString *const MHDQuestKeyIndicatorKey = @"key";
NSString *const MHDQuestObjectiveKey = @"objective";
NSString *const MHDQuestRewardKey = @"reward";
NSString *const MHDQuestStarsKey = @"stars";
NSString *const MHDQuestSubQuestObjectiveKey = @"subquest";
NSString *const MHDQuestFirstMonsterKey = @"target";
NSString *const MHDQuestSecondMonsterKey = @"second_target";
NSString *const MHDQuestThirdMonsterKey = @"third_target";
NSString *const MHDQuestFourthMonsterKey = @"fourth_target";
NSString *const MHDQuestTypeKey = @"type";
NSString *const MHDQuestUrgentKey = @"urgent";
NSString *const MHDQuestCaravanKey = @"caravan";
NSString *const MHDQuestNoneString = @"None";
NSString *const MHDQuestFirstPrereqKey = @"prereq";
NSString *const MHDQuestSecondPrereqKey = @"second_prereq";
NSString *const MHDQuestThirdPrereqKey = @"third_prereq";
NSString *const MHDQuestFourthPrereqKey = @"fourth_prereq";


#pragma mark - Quest Drop Constants

NSString *const MHDQuestDropsFileName = @"quest_drops";
NSString *const MHDQuestDropIDKey = @"dropID";
NSString *const MHDQuestDropQuestIDKey = @"questID";
NSString *const MHDQuestDropRowKey = @"row";
NSString *const MHDQuestDropItemNameKey = @"item";
NSString *const MHDQuestDropQuantityKey = @"quantity";
NSString *const MHDQuestDropPercentKey = @"percent";

#pragma mark - Monster Drop Constants

NSString *const MHDMonsterDropIDKey = @"dropID";
NSString *const MHDMonsterDropMethodKey = @"method";
NSString *const MHDMonsterDropQuantityKey = @"quantity";
NSString *const MHDMonsterDropRankKey = @"rank";
NSString *const MHDMonsterDropPercentKey = @"percent";
NSString *const MHDMonsterDropMonsterNameKey = @"monster_name";
NSString *const MHDMonsterDropItemNameKey = @"item_name";

#pragma mark - Area Drop Constants

NSString *const MHDAreaDropAreaNameKey = @"area";
NSString *const MHDAreaDropRankKey = @"rank";
NSString *const MHDAreaDropIDKey = @"_id";
NSString *const MHDAreaDropMethodKey = @"method";
NSString *const MHDAreaDropPercentKey = @"chance";
NSString *const MHDAreaDropQuantityKey = @"number";
NSString *const MHDAreaDropItemNameKey = @"item";

#pragma mark - Damage Zone Constants

NSString *const MHDDamageZonesFileName = @"monsterDamage";
NSString *const MHDDamageZoneIDKey = @"_id";
NSString *const MHDDamageZonePartKey = @"part";
NSString *const MHDDamageZoneCutKey = @"cut";
NSString *const MHDDamageZoneImpactKey = @"impact";
NSString *const MHDDamageZoneShotKey = @"shot";
NSString *const MHDDamageZoneFireKey = @"fire";
NSString *const MHDDamageZoneWaterKey = @"water";
NSString *const MHDDamageZoneIceKey = @"ice";
NSString *const MHDDamageZoneThunderKey = @"thunder";
NSString *const MHDDamageZoneDragonKey = @"dragon";
NSString *const MHDDamageZoneMonsterNameKey = @"monster_name";

#pragma mark - Accessibility Identifiers

NSString *const MHDItemEncyclopediaTableIdentifier = @"ItemEncyclopediaTable";
NSString *const MHDMonsterEncyclopediaCollectionIdentifier = @"MonsterEncyclopediaCollection";
NSString *const MHDRegionEncyclopediaCollectionIdentifier = @"RegionEncyclopediaCollection";
NSString *const MHDItemAreaSources = @"ItemAreaSources";
NSString *const MHDItemMonsterSources = @"ItemMonsterSources";
NSString *const MHDItemQuestSources = @"ItemQuestSources";
NSString *const MHDAreaDropsTable = @"AreaDropsTable";
NSString *const MHDMonsterDropsTable = @"MonsterDropsTable";

const struct MHDStoryBoardIdentifiers MHDStoryBoardIdentifier = {
    .main = @"Main",
};

const struct MHDSegueIdentifiers MHDSegueIdentifier = {
    .embedQuestDetails = @"embedQuestDetails",
    .embedQuestRewards = @"embedQuestRewards",
    .showQuestContainer = @"showQuestContainerView",
    .showQuestDropItem = @"showQuestDropItem",
};

@end
