//
//  MH4U_DexUITests.m
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/24/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "KIF.h"

#import "Constants.h"
#import "Strings.h"

static NSString *const AKechaAuricle = @"A.Kecha Auricle";
static NSString *const AncSteppe = @"Ancestral Steppe";
static NSString *const AncSteppeLRItems = @"Ancestral Steppe Low-Rank Items";
static NSString *const BlueMushroomDropSources = @"Blue Mushroom Drop Sources";
static NSString *const BodyPart = @"Body Part";
static NSString *const CongalalaFur = @"Congalala Fur";
static NSString *const CongalalaOverview = @"Congalala Overview";
static NSString *const GatheringSources = @"Gathering Sources";
static NSString *const GRank = @"G-Rank";
static NSString *const HighRank = @"High-Rank";
static NSString *const HighRankItems = @"High-Rank Items";
static NSString *const Honey = @"Honey";
static NSString *const Items = @"Items";
static NSString *const ItemTableViewCell = @"ItemTableViewCell";
static NSString *const LargeWyvernTear = @"Large Wyvern Tear";
static NSString *const LowRank = @"Low-Rank";
static NSString *const MonsterName = @"MonsterName";
static NSString *const Monsters = @"Monsters";
static NSString *const RegionName = @"RegionName";
static NSString *const Regions = @"Regions";
static NSString *const ShinyDrops = @"Shiny Drops";
static NSString *const SunkenHollow = @"Sunken Hollow";

@interface MH4U_DexUITests : KIFTestCase

@end

@implementation MH4U_DexUITests

- (void)afterEach
{
    while (![self viewIsVisibleWithAccessibilityLabel:[Strings MHDHomeString]]) {
        [tester tapViewWithAccessibilityLabel:[Strings MHDBack]];
    }
    
    [super afterEach];
}

- (void)testItemAreaSource
{
    [self navigateToItemEncyclopedia];
    [tester waitForViewWithAccessibilityLabel:AKechaAuricle];
    NSIndexPath *thirteenthRow = [NSIndexPath indexPathForRow:12 inSection:0];
    [tester tapRowAtIndexPath:thirteenthRow inTableViewWithAccessibilityIdentifier:MHDItemEncyclopediaTableIdentifier];
    [tester tapViewWithAccessibilityLabel:GatheringSources];
    [tester waitForViewWithAccessibilityLabel:AncSteppe];
    [tester tapRowAtIndexPath:thirteenthRow inTableViewWithAccessibilityIdentifier:MHDItemAreaSources];
    [tester waitForViewWithAccessibilityLabel:SunkenHollow];
    [tester tapViewWithAccessibilityLabel:HighRankItems];
    [tester waitForViewWithAccessibilityLabel:Honey];
}

- (void)testItemMonsterSource
{
    [self navigateToItemEncyclopedia];
    NSIndexPath *sixteenthRow = [NSIndexPath indexPathForRow:15 inSection:0];
    [tester tapRowAtIndexPath:sixteenthRow inTableViewWithAccessibilityIdentifier:MHDItemEncyclopediaTableIdentifier];
    [tester waitForViewWithAccessibilityLabel:ShinyDrops];
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    [tester tapRowAtIndexPath:firstRow inTableViewWithAccessibilityIdentifier:MHDItemMonsterSources];
    [tester waitForViewWithAccessibilityLabel:BodyPart];
    [tester tapViewWithAccessibilityLabel:HighRank];
    [tester waitForViewWithAccessibilityLabel:LargeWyvernTear];
    [tester tapViewWithAccessibilityLabel:LowRank];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:LargeWyvernTear];
}

- (void)testSmallItemFromMonsterToArea
{
    [self navigateToMonsterEncyclopedia];
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    [tester tapItemAtIndexPath:firstRow inCollectionViewWithAccessibilityIdentifier:MHDMonsterEncyclopediaCollectionIdentifier];
    [tester waitForViewWithAccessibilityLabel:BodyPart];
    [tester tapViewWithAccessibilityLabel:LowRank];
    NSIndexPath *sixthRow = [NSIndexPath indexPathForRow:5 inSection:0];
    [tester tapRowAtIndexPath:sixthRow inTableViewWithAccessibilityIdentifier:MHDMonsterDropsTable];
    [tester tapViewWithAccessibilityLabel:GatheringSources];
    [tester tapRowAtIndexPath:firstRow inTableViewWithAccessibilityIdentifier:MHDItemAreaSources];
    [tester waitForViewWithAccessibilityLabel:AncSteppeLRItems];
}

- (void)testSmallItemFromAreaToMonster
{
    [self navigateToRegionEncyclopedia];
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    [tester tapItemAtIndexPath:firstRow inCollectionViewWithAccessibilityIdentifier:MHDRegionEncyclopediaCollectionIdentifier];
    [tester tapViewWithAccessibilityLabel:HighRankItems];
    [tester tapRowAtIndexPath:firstRow inTableViewWithAccessibilityIdentifier:MHDAreaDropsTable];
    [tester waitForViewWithAccessibilityLabel:BlueMushroomDropSources];
    [tester tapRowAtIndexPath:firstRow inTableViewWithAccessibilityIdentifier:MHDItemMonsterSources];
    [tester waitForViewWithAccessibilityLabel:CongalalaOverview];
    [tester tapViewWithAccessibilityLabel:GRank];
    [tester waitForViewWithAccessibilityLabel:CongalalaFur];
}

- (void)navigateToItemEncyclopedia
{
    [tester tapViewWithAccessibilityLabel:Items];
    [tester waitForViewWithAccessibilityLabel:ItemTableViewCell];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:Items];
    
}

- (void)navigateToMonsterEncyclopedia
{
    [tester tapViewWithAccessibilityLabel:Monsters];
    [tester waitForViewWithAccessibilityLabel:MonsterName];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:Monsters];
}

- (void)navigateToRegionEncyclopedia
{
    [tester tapViewWithAccessibilityLabel:Regions];
    [tester waitForViewWithAccessibilityLabel:RegionName];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:Regions];
}

#pragma mark - helper methods

- (BOOL)viewIsVisibleWithAccessibilityLabel:(NSString *)accessibilityLabel
{
    //From: http://stackoverflow.com/a/21670776/681493
    //But this is REALLY from ThousandTrails!
    
    if ([[[UIApplication sharedApplication] keyWindow] accessibilityElementWithLabel:accessibilityLabel]) {
        //Found = visible.
        return YES;
    } else {
        //Not found = not visibile.
        return NO;
    }
}

@end
