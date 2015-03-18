//
//  Constants.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/18/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

FOUNDATION_EXPORT NSString *const JSON;
FOUNDATION_EXPORT NSString *const TrueString;

#pragma mark - Item Constants

FOUNDATION_EXPORT NSString *const ItemNameKey;

#pragma mark - Monster Constants

FOUNDATION_EXPORT NSString *const MonsterIDKey;
FOUNDATION_EXPORT NSString *const MonstersFileName;
FOUNDATION_EXPORT NSString *const MonsterDamageZonesFileName;

#pragma mark - Area Constants

FOUNDATION_EXPORT NSString *const AreaCombinedNameKey;

#pragma mark - Region Constants

FOUNDATION_EXPORT NSString *const RegionsFileName;
FOUNDATION_EXPORT NSString *const RegionIDJSONKey;
FOUNDATION_EXPORT NSString *const RegionNameKey;
FOUNDATION_EXPORT NSString *const RegionKeyNameKey;
FOUNDATION_EXPORT NSString *const RegionDropsFileNameSuffix;

#pragma mark - Quest Constants

FOUNDATION_EXPORT NSString *const QuestsFileName;
FOUNDATION_EXPORT NSString *const QuestIDKey;
FOUNDATION_EXPORT NSString *const QuestNameKey;
FOUNDATION_EXPORT NSString *const QuestCaravanHallKey;
FOUNDATION_EXPORT NSString *const QuestDangerKey;
FOUNDATION_EXPORT NSString *const QuestFeeKey;
FOUNDATION_EXPORT NSString *const QuestHRPKey;
FOUNDATION_EXPORT NSString *const QuestMapKeyNameKey;
FOUNDATION_EXPORT NSString *const QuestKeyIndicatorKey;
FOUNDATION_EXPORT NSString *const QuestObjectiveKey
FOUNDATION_EXPORT NSString *const QuestRewardKey;
FOUNDATION_EXPORT NSString *const QuestStarsKey;
FOUNDATION_EXPORT NSString *const QuestSubQuestObjectiveKey;
FOUNDATION_EXPORT NSString *const QuestFirstMonsterKey;
FOUNDATION_EXPORT NSString *const QuestSecondMonsterKey;
FOUNDATION_EXPORT NSString *const QuestThirdMonsterKey;
FOUNDATION_EXPORT NSString *const QuestFourthMonsterKey;
FOUNDATION_EXPORT NSString *const QuestTypeKey;
FOUNDATION_EXPORT NSString *const QuestUrgentKey;
FOUNDATION_EXPORT NSString *const QuestCaravanKey;
FOUNDATION_EXPORT NSString *const QuestNoneString;

#pragma mark - Quest Drop Constants

FOUNDATION_EXPORT NSString *const QuestDropsFileName;
FOUNDATION_EXPORT NSString *const QuestDropIDKey;
FOUNDATION_EXPORT NSString *const QuestDropQuestIDKey;
FOUNDATION_EXPORT NSString *const QuestDropRowKey;
FOUNDATION_EXPORT NSString *const QuestDropItemNameKey;
FOUNDATION_EXPORT NSString *const QuestDropQuantityKey;
FOUNDATION_EXPORT NSString *const QuestDropPercentKey;

#pragma mark - Monster Drop Constants

FOUNDATION_EXPORT NSString *const MonsterDropsFileName;
FOUNDATION_EXPORT NSString *const MonsterDropIDKey;
FOUNDATION_EXPORT NSString *const MonsterDropMethodKey;
FOUNDATION_EXPORT NSString *const MonsterDropQuantityKey;
FOUNDATION_EXPORT NSString *const MonsterDropRankKey;
FOUNDATION_EXPORT NSString *const MonsterDropPercentKey;
FOUNDATION_EXPORT NSString *const MonsterDropMonsterNameKey;
FOUNDATION_EXPORT NSString *const MonsterDropMonsterIDKey;
FOUNDATION_EXPORT NSString *const MonsterDropItemNameKey;

#pragma mark - Area Drop Constants

FOUNDATION_EXPORT NSString *const AreaDropAreaNameKey;
FOUNDATION_EXPORT NSString *const AreaDropRankKey;
FOUNDATION_EXPORT NSString *const AreaDropIDKey;
FOUNDATION_EXPORT NSString *const AreaDropMethodKey;
FOUNDATION_EXPORT NSString *const AreaDropPercentKey;
FOUNDATION_EXPORT NSString *const AreaDropQuantityKey;
FOUNDATION_EXPORT NSString *const AreaDropItemNameKey;

@end
