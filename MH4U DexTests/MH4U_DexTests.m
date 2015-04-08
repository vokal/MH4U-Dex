//
//  MH4U_DexTests.m
//  MH4U DexTests
//
//  Created by Joseph Goldberg on 2/5/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "Constants.h"
#import "CoreDataController.h"

#import "Area.h"
#import "AreaDrop.h"
#import "Item.h"
#import "Monster.h"
#import "MonsterDrop.h"

static NSUInteger MonsterCount = 90;

static const NSString *InvalidMonsterName = @"Volvidon";

@interface MH4U_DexTests : XCTestCase

@end

@implementation MH4U_DexTests

- (void)testMonsterDrops
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:[Monster entityName]];
    NSError *error = nil;
    NSArray *monsterList = [[CoreDataController sharedCDController].managedObjectContext
                            executeFetchRequest:fetchRequest error:&error];
    XCTAssertGreaterThanOrEqual(monsterList.count, MonsterCount);
    for (Monster *monster in monsterList) {
        XCTAssertTrue([monster isMemberOfClass:[Monster class]]);
        XCTAssertGreaterThan(monster.monsterDrop.count, 0);
        for (MonsterDrop *drop in monster.monsterDrop) {
            XCTAssertNotNil(drop.item);
            XCTAssertEqualObjects(drop.monsterSource, monster);
            XCTAssertTrue([self item:drop.item hasMonsterDropSource:drop]);
        }
    }
}

- (void)testAreaDrops
{
    NSFetchRequest *areaRequest = [[NSFetchRequest alloc] initWithEntityName:[Area entityName]];
    NSError *error = nil;
    NSArray *areaList = [[CoreDataController sharedCDController].managedObjectContext
                         executeFetchRequest:areaRequest error:&error];
    //TODO: Change to the proper area count.
    XCTAssertGreaterThan(areaList.count, 0);
    for (Area *area in areaList) {
        XCTAssertTrue([area isMemberOfClass:[Area class]]);
        XCTAssertNotNil(area.region);
        XCTAssertTrue([self validRankForArea:area]);
        for (AreaDrop *drop in area.drop) {
            XCTAssertNotNil(drop.item);
            XCTAssertEqualObjects(drop.area, area);
            XCTAssertTrue([self item:drop.item hasAreaDropSource:drop]);
        }
    }
}

- (void)testMonsterDoesNotExist
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K == %@", MonsterAttributes.name, InvalidMonsterName];
    Monster *monster = (Monster *)[[CoreDataController sharedCDController]
                                   uniqueEntityWithEntityName:[Monster entityName] withPredicate:predicate withContext:[CoreDataController sharedCDController].managedObjectContext];
    XCTAssertNil(monster);
}

- (BOOL)item:(Item *)item hasMonsterDropSource:(MonsterDrop *)source
{
    for (MonsterDrop *drop in item.monsterSourceSet) {
        if ([drop isEqual:source]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)item:(Item *)item hasAreaDropSource:(AreaDrop *)source
{
    for (AreaDrop *drop in item.areaSource) {
        if ([drop isEqual:source]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)validRankForArea:(Area *)area
{
    if ([area.rank isEqualToString:MHDLowConstString]
        || [area.rank isEqualToString:MHDHighConstString]
        || [area.rank isEqualToString:MHDGConstString]) {
        return YES;
    }
    return NO;
}

@end
