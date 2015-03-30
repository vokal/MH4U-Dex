//
//  Strings.h
//  MH4U Dex
//
//  Created by Joseph Goldberg on 3/20/15.
//  Copyright (c) 2015 Joseph Goldberg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Strings : NSObject

+ (NSString *)MHDItemEncyclopedia;
+ (NSString *)MHDMonsterEncyclopedia;
+ (NSString *)MHDRegionEncyclopedia;

#pragma mark - Damage Zone Cell Constants

+ (NSString *)MHDBodyPartLabelText;
+ (NSString *)MHDCutLabelText;
+ (NSString *)MHDImpactLabelText;
+ (NSString *)MHDShotLabelText;
+ (NSString *)MHDKOLabelText;
+ (NSString *)MHDFireLabelText;
+ (NSString *)MHDIceLabelText;
+ (NSString *)MHDDragonLabelText;
+ (NSString *)MHDWaterLabelText;
+ (NSString *)MHDThunderLabelText;

#pragma mark - UITest Constants

+ (NSString *)MHDBack;
+ (NSString *)MHDHomeString;

#pragma mark - Monster Encyclopedia Constants

+ (NSString *)MHDSmallMonsters;
+ (NSString *)MHDLargeMonsters;

@end
