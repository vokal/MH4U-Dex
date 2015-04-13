//
//  Constants.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/18/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

FOUNDATION_EXPORT NSString *const MHDJSON;
FOUNDATION_EXPORT NSString *const MHDTrueString;
FOUNDATION_EXPORT NSString *const MHDLowConstString;
FOUNDATION_EXPORT NSString *const MHDHighConstString;
FOUNDATION_EXPORT NSString *const MHDGConstString;

#pragma mark - Item Constants

FOUNDATION_EXPORT NSString *const MHDItemNameKey;

#pragma mark - Monster Constants

FOUNDATION_EXPORT NSString *const MHDMonsterDescriptionKey;
FOUNDATION_EXPORT NSString *const MHDMonsterNameKey;
FOUNDATION_EXPORT NSString *const MHDMonsterSortNameKey;
FOUNDATION_EXPORT NSString *const MHDMonstersFileName;
FOUNDATION_EXPORT NSString *const MHDMonsterClassKey;
FOUNDATION_EXPORT NSString *const MHDBoss;
FOUNDATION_EXPORT NSString *const MHDMinion;

#pragma mark - Area Constants

FOUNDATION_EXPORT NSString *const MHDAreaCombinedNameKey;

#pragma mark - Region Constants

FOUNDATION_EXPORT NSString *const MHDRegionsFileName;
FOUNDATION_EXPORT NSString *const MHDRegionIDJSONKey;
FOUNDATION_EXPORT NSString *const MHDRegionNameKey;
FOUNDATION_EXPORT NSString *const MHDRegionKeyNameKey;
FOUNDATION_EXPORT NSString *const MHDRegionDropsFileNameSuffix;

#pragma mark - Quest Constants

FOUNDATION_EXPORT NSString *const MHDQuestsFileName;
FOUNDATION_EXPORT NSString *const MHDQuestIDKey;
FOUNDATION_EXPORT NSString *const MHDQuestNameKey;
FOUNDATION_EXPORT NSString *const MHDQuestCaravanHallKey;
FOUNDATION_EXPORT NSString *const MHDQuestDangerKey;
FOUNDATION_EXPORT NSString *const MHDQuestFeeKey;
FOUNDATION_EXPORT NSString *const MHDQuestHRPKey;
FOUNDATION_EXPORT NSString *const MHDQuestMapKeyNameKey;
FOUNDATION_EXPORT NSString *const MHDQuestKeyIndicatorKey;
FOUNDATION_EXPORT NSString *const MHDQuestObjectiveKey;
FOUNDATION_EXPORT NSString *const MHDQuestRewardKey;
FOUNDATION_EXPORT NSString *const MHDQuestStarsKey;
FOUNDATION_EXPORT NSString *const MHDQuestSubQuestObjectiveKey;
FOUNDATION_EXPORT NSString *const MHDQuestFirstMonsterKey;
FOUNDATION_EXPORT NSString *const MHDQuestSecondMonsterKey;
FOUNDATION_EXPORT NSString *const MHDQuestThirdMonsterKey;
FOUNDATION_EXPORT NSString *const MHDQuestFourthMonsterKey;
FOUNDATION_EXPORT NSString *const MHDQuestTypeKey;
FOUNDATION_EXPORT NSString *const MHDQuestUrgentKey;
FOUNDATION_EXPORT NSString *const MHDQuestCaravanKey;
FOUNDATION_EXPORT NSString *const MHDQuestNoneString;
FOUNDATION_EXPORT NSString *const MHDQuestFirstPrereqKey;
FOUNDATION_EXPORT NSString *const MHDQuestSecondPrereqKey;
FOUNDATION_EXPORT NSString *const MHDQuestThirdPrereqKey;
FOUNDATION_EXPORT NSString *const MHDQuestFourthPrereqKey;

#pragma mark - Quest Drop Constants

FOUNDATION_EXPORT NSString *const MHDQuestDropsFileName;
FOUNDATION_EXPORT NSString *const MHDQuestDropIDKey;
FOUNDATION_EXPORT NSString *const MHDQuestDropQuestIDKey;
FOUNDATION_EXPORT NSString *const MHDQuestDropRowKey;
FOUNDATION_EXPORT NSString *const MHDQuestDropItemNameKey;
FOUNDATION_EXPORT NSString *const MHDQuestDropQuantityKey;
FOUNDATION_EXPORT NSString *const MHDQuestDropPercentKey;

#pragma mark - Monster Drop Constants

FOUNDATION_EXPORT NSString *const MHDMonsterDropIDKey;
FOUNDATION_EXPORT NSString *const MHDMonsterDropMethodKey;
FOUNDATION_EXPORT NSString *const MHDMonsterDropQuantityKey;
FOUNDATION_EXPORT NSString *const MHDMonsterDropRankKey;
FOUNDATION_EXPORT NSString *const MHDMonsterDropPercentKey;
FOUNDATION_EXPORT NSString *const MHDMonsterDropMonsterNameKey;
FOUNDATION_EXPORT NSString *const MHDMonsterDropItemNameKey;

#pragma mark - Area Drop Constants

FOUNDATION_EXPORT NSString *const MHDAreaDropAreaNameKey;
FOUNDATION_EXPORT NSString *const MHDAreaDropRankKey;
FOUNDATION_EXPORT NSString *const MHDAreaDropIDKey;
FOUNDATION_EXPORT NSString *const MHDAreaDropMethodKey;
FOUNDATION_EXPORT NSString *const MHDAreaDropPercentKey;
FOUNDATION_EXPORT NSString *const MHDAreaDropQuantityKey;
FOUNDATION_EXPORT NSString *const MHDAreaDropItemNameKey;

#pragma mark - Damage Zone Constants

FOUNDATION_EXPORT NSString *const MHDDamageZonesFileName;
FOUNDATION_EXPORT NSString *const MHDDamageZoneIDKey;
FOUNDATION_EXPORT NSString *const MHDDamageZonePartKey;
FOUNDATION_EXPORT NSString *const MHDDamageZoneCutKey;
FOUNDATION_EXPORT NSString *const MHDDamageZoneImpactKey;
FOUNDATION_EXPORT NSString *const MHDDamageZoneShotKey;
FOUNDATION_EXPORT NSString *const MHDDamageZoneFireKey;
FOUNDATION_EXPORT NSString *const MHDDamageZoneWaterKey;
FOUNDATION_EXPORT NSString *const MHDDamageZoneIceKey;
FOUNDATION_EXPORT NSString *const MHDDamageZoneThunderKey;
FOUNDATION_EXPORT NSString *const MHDDamageZoneDragonKey;
FOUNDATION_EXPORT NSString *const MHDDamageZoneMonsterNameKey;

#pragma mark - Accessibility Identifiers

FOUNDATION_EXPORT NSString *const MHDItemEncyclopediaTableIdentifier;
FOUNDATION_EXPORT NSString *const MHDMonsterEncyclopediaCollectionIdentifier;
FOUNDATION_EXPORT NSString *const MHDRegionEncyclopediaCollectionIdentifier;
FOUNDATION_EXPORT NSString *const MHDItemAreaSources;
FOUNDATION_EXPORT NSString *const MHDItemMonsterSources;
FOUNDATION_EXPORT NSString *const MHDAreaDropsTable;
FOUNDATION_EXPORT NSString *const MHDMonsterDropsTable;

@end
