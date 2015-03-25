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

#import "Strings.h"

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
    [tester waitForViewWithAccessibilityLabel:@"Adamant Orb"];
    NSIndexPath *thirteenthRow = [NSIndexPath indexPathForRow:12 inSection:0];
    [tester tapRowAtIndexPath:thirteenthRow inTableViewWithAccessibilityIdentifier:@"ItemEncyclopediaTable"];
    [tester tapViewWithAccessibilityLabel:@"Gathering Sources"];
    [tester waitForViewWithAccessibilityLabel:@"Secret Area"];
    [tester tapRowAtIndexPath:thirteenthRow inTableViewWithAccessibilityIdentifier:@"ItemAreaSources"];
    [tester waitForViewWithAccessibilityLabel:@"Sunken Hollow"];
    [tester tapViewWithAccessibilityLabel:@"High-Rank Items"];
    [tester waitForViewWithAccessibilityLabel:@"Honey"];
}

- (void)testItemMonsterSource
{
    [self navigateToItemEncyclopedia];
    NSIndexPath *sixteenthRow = [NSIndexPath indexPathForRow:15 inSection:0];
    [tester tapRowAtIndexPath:sixteenthRow inTableViewWithAccessibilityIdentifier:@"ItemEncyclopediaTable"];
    [tester waitForViewWithAccessibilityLabel:@"Shiny Drops"];
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    [tester tapRowAtIndexPath:firstRow inTableViewWithAccessibilityIdentifier:@"ItemMonsterSources"];
    [tester waitForViewWithAccessibilityLabel:@"Body Part"];
    [tester tapViewWithAccessibilityLabel:@"High-Rank"];
    [tester waitForViewWithAccessibilityLabel:@"Large Wyvern Tear"];
    [tester tapViewWithAccessibilityLabel:@"Low-Rank"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"Large Wyvern Tear"];
}

- (void)testSmallItemFromMonsterToArea
{
    [self navigateToMonsterEncyclopedia];
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    [tester tapItemAtIndexPath:firstRow inCollectionViewWithAccessibilityIdentifier:@"MonsterEncyclopediaCollection"];
    [tester waitForViewWithAccessibilityLabel:@"Body Part"];
    [tester tapViewWithAccessibilityLabel:@"Low-Rank"];
    NSIndexPath *sixthRow = [NSIndexPath indexPathForRow:5 inSection:0];
    [tester tapRowAtIndexPath:sixthRow inTableViewWithAccessibilityIdentifier:@"MonsterDropsTable"];
    [tester tapViewWithAccessibilityLabel:@"Gathering Sources"];
    [tester tapRowAtIndexPath:firstRow inTableViewWithAccessibilityIdentifier:@"ItemAreaSources"];
    [tester waitForViewWithAccessibilityLabel:@"Ancestral Steppe Low-Rank Items"];
}

- (void)testSmallItemFromAreaToMonster
{
    [self navigateToRegionEncyclopedia];
    NSIndexPath *firstRow = [NSIndexPath indexPathForRow:0 inSection:0];
    [tester tapItemAtIndexPath:firstRow inCollectionViewWithAccessibilityIdentifier:@"RegionEncyclopediaCollection"];
    [tester tapViewWithAccessibilityLabel:@"High-Rank Items"];
    [tester tapRowAtIndexPath:firstRow inTableViewWithAccessibilityIdentifier:@"AreaDropsTable"];
    [tester waitForViewWithAccessibilityLabel:@"Blue Mushroom Drop Sources"];
    [tester tapRowAtIndexPath:firstRow inTableViewWithAccessibilityIdentifier:@"ItemMonsterSources"];
    [tester waitForViewWithAccessibilityLabel:@"Congalala Overview"];
    [tester tapViewWithAccessibilityLabel:@"G-Rank"];
    [tester waitForViewWithAccessibilityLabel:@"Congalala Fur"];
}

- (void)testDistraction
{
    // This test exists to ensure that the afterEach is working as intended.
    [tester tapViewWithAccessibilityLabel:@"Items"];
    [tester waitForViewWithAccessibilityLabel:@"ItemTableViewCell"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:[Strings MHDHomeString]];
}

- (void)navigateToItemEncyclopedia
{
    [tester tapViewWithAccessibilityLabel:@"Items"];
    [tester waitForViewWithAccessibilityLabel:@"ItemTableViewCell"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"Items"];
    
}

- (void)navigateToMonsterEncyclopedia
{
    [tester tapViewWithAccessibilityLabel:@"Monsters"];
    [tester waitForViewWithAccessibilityLabel:@"MonsterName"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"Monsters"];
}

- (void)navigateToRegionEncyclopedia
{
    [tester tapViewWithAccessibilityLabel:@"Regions"];
    [tester waitForViewWithAccessibilityLabel:@"RegionName"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"Regions"];
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
