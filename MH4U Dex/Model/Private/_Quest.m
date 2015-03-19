// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Quest.m instead.

#import "_Quest.h"

const struct QuestAttributes QuestAttributes = {
	.caravan = @"caravan",
	.danger = @"danger",
	.fee = @"fee",
	.hrp = @"hrp",
	.id = @"id",
	.key = @"key",
	.name = @"name",
	.objective = @"objective",
	.reward = @"reward",
	.stars = @"stars",
	.subObjective = @"subObjective",
	.type = @"type",
	.urgent = @"urgent",
};

const struct QuestRelationships QuestRelationships = {
	.drop = @"drop",
	.firstMonster = @"firstMonster",
	.fourthMonster = @"fourthMonster",
	.region = @"region",
	.secondMonster = @"secondMonster",
	.thirdMonster = @"thirdMonster",
};

@implementation QuestID
@end

@implementation _Quest

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Quest" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Quest";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Quest" inManagedObjectContext:moc_];
}

- (QuestID*)objectID {
	return (QuestID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"caravanValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"caravan"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"dangerValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"danger"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"feeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"fee"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"hrpValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"hrp"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"keyValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"key"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"rewardValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"reward"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"starsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"stars"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"urgentValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"urgent"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic caravan;

- (BOOL)caravanValue {
	NSNumber *result = [self caravan];
	return [result boolValue];
}

- (void)setCaravanValue:(BOOL)value_ {
	[self setCaravan:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveCaravanValue {
	NSNumber *result = [self primitiveCaravan];
	return [result boolValue];
}

- (void)setPrimitiveCaravanValue:(BOOL)value_ {
	[self setPrimitiveCaravan:[NSNumber numberWithBool:value_]];
}

@dynamic danger;

- (BOOL)dangerValue {
	NSNumber *result = [self danger];
	return [result boolValue];
}

- (void)setDangerValue:(BOOL)value_ {
	[self setDanger:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveDangerValue {
	NSNumber *result = [self primitiveDanger];
	return [result boolValue];
}

- (void)setPrimitiveDangerValue:(BOOL)value_ {
	[self setPrimitiveDanger:[NSNumber numberWithBool:value_]];
}

@dynamic fee;

- (int16_t)feeValue {
	NSNumber *result = [self fee];
	return [result shortValue];
}

- (void)setFeeValue:(int16_t)value_ {
	[self setFee:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveFeeValue {
	NSNumber *result = [self primitiveFee];
	return [result shortValue];
}

- (void)setPrimitiveFeeValue:(int16_t)value_ {
	[self setPrimitiveFee:[NSNumber numberWithShort:value_]];
}

@dynamic hrp;

- (int16_t)hrpValue {
	NSNumber *result = [self hrp];
	return [result shortValue];
}

- (void)setHrpValue:(int16_t)value_ {
	[self setHrp:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveHrpValue {
	NSNumber *result = [self primitiveHrp];
	return [result shortValue];
}

- (void)setPrimitiveHrpValue:(int16_t)value_ {
	[self setPrimitiveHrp:[NSNumber numberWithShort:value_]];
}

@dynamic id;

- (int16_t)idValue {
	NSNumber *result = [self id];
	return [result shortValue];
}

- (void)setIdValue:(int16_t)value_ {
	[self setId:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveIdValue {
	NSNumber *result = [self primitiveId];
	return [result shortValue];
}

- (void)setPrimitiveIdValue:(int16_t)value_ {
	[self setPrimitiveId:[NSNumber numberWithShort:value_]];
}

@dynamic key;

- (BOOL)keyValue {
	NSNumber *result = [self key];
	return [result boolValue];
}

- (void)setKeyValue:(BOOL)value_ {
	[self setKey:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveKeyValue {
	NSNumber *result = [self primitiveKey];
	return [result boolValue];
}

- (void)setPrimitiveKeyValue:(BOOL)value_ {
	[self setPrimitiveKey:[NSNumber numberWithBool:value_]];
}

@dynamic name;

@dynamic objective;

@dynamic reward;

- (int16_t)rewardValue {
	NSNumber *result = [self reward];
	return [result shortValue];
}

- (void)setRewardValue:(int16_t)value_ {
	[self setReward:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveRewardValue {
	NSNumber *result = [self primitiveReward];
	return [result shortValue];
}

- (void)setPrimitiveRewardValue:(int16_t)value_ {
	[self setPrimitiveReward:[NSNumber numberWithShort:value_]];
}

@dynamic stars;

- (int16_t)starsValue {
	NSNumber *result = [self stars];
	return [result shortValue];
}

- (void)setStarsValue:(int16_t)value_ {
	[self setStars:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveStarsValue {
	NSNumber *result = [self primitiveStars];
	return [result shortValue];
}

- (void)setPrimitiveStarsValue:(int16_t)value_ {
	[self setPrimitiveStars:[NSNumber numberWithShort:value_]];
}

@dynamic subObjective;

@dynamic type;

@dynamic urgent;

- (BOOL)urgentValue {
	NSNumber *result = [self urgent];
	return [result boolValue];
}

- (void)setUrgentValue:(BOOL)value_ {
	[self setUrgent:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveUrgentValue {
	NSNumber *result = [self primitiveUrgent];
	return [result boolValue];
}

- (void)setPrimitiveUrgentValue:(BOOL)value_ {
	[self setPrimitiveUrgent:[NSNumber numberWithBool:value_]];
}

@dynamic drop;

- (NSMutableSet*)dropSet {
	[self willAccessValueForKey:@"drop"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"drop"];

	[self didAccessValueForKey:@"drop"];
	return result;
}

@dynamic firstMonster;

@dynamic fourthMonster;

@dynamic region;

@dynamic secondMonster;

@dynamic thirdMonster;

@end

