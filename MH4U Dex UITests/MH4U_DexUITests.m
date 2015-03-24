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

- (void)testDistraction
{
    // This test exists to ensure that the afterEach is working as intended.
    [tester tapViewWithAccessibilityLabel:@"Items"];
    [tester waitForViewWithAccessibilityLabel:@"ItemTableViewCell"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:[Strings MHDHomeString]];
}

- (void)testNavigateToItemEncyclopedia
{
    [tester tapViewWithAccessibilityLabel:@"Items"];
    [tester waitForViewWithAccessibilityLabel:@"ItemTableViewCell"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"Items"];
}

- (void)testNavigateToMonsterEncyclopedia
{
    [tester tapViewWithAccessibilityLabel:@"Monsters"];
    [tester waitForViewWithAccessibilityLabel:@"MonsterName"];
    [tester waitForAbsenceOfViewWithAccessibilityLabel:@"Monsters"];
}

- (void)testNavigateToRegionEncyclopedia
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
