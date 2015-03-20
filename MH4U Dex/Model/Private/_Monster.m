// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Monster.m instead.

#import "_Monster.h"

const struct MonsterAttributes MonsterAttributes = {
	.monster_class = @"monster_class",
	.monster_description = @"monster_description",
	.name = @"name",
	.sort_name = @"sort_name",
};

const struct MonsterRelationships MonsterRelationships = {
	.damageZone = @"damageZone",
	.monsterDrop = @"monsterDrop",
	.questFirstTarget = @"questFirstTarget",
	.questFourthTarget = @"questFourthTarget",
	.questSecondTarget = @"questSecondTarget",
	.questThirdTarget = @"questThirdTarget",
};

@implementation MonsterID
@end

@implementation _Monster

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Monster" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Monster";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Monster" inManagedObjectContext:moc_];
}

- (MonsterID*)objectID {
	return (MonsterID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic monster_class;

@dynamic monster_description;

@dynamic name;

@dynamic sort_name;

@dynamic damageZone;

- (NSMutableSet*)damageZoneSet {
	[self willAccessValueForKey:@"damageZone"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"damageZone"];

	[self didAccessValueForKey:@"damageZone"];
	return result;
}

@dynamic monsterDrop;

- (NSMutableSet*)monsterDropSet {
	[self willAccessValueForKey:@"monsterDrop"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"monsterDrop"];

	[self didAccessValueForKey:@"monsterDrop"];
	return result;
}

@dynamic questFirstTarget;

- (NSMutableSet*)questFirstTargetSet {
	[self willAccessValueForKey:@"questFirstTarget"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"questFirstTarget"];

	[self didAccessValueForKey:@"questFirstTarget"];
	return result;
}

@dynamic questFourthTarget;

- (NSMutableSet*)questFourthTargetSet {
	[self willAccessValueForKey:@"questFourthTarget"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"questFourthTarget"];

	[self didAccessValueForKey:@"questFourthTarget"];
	return result;
}

@dynamic questSecondTarget;

- (NSMutableSet*)questSecondTargetSet {
	[self willAccessValueForKey:@"questSecondTarget"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"questSecondTarget"];

	[self didAccessValueForKey:@"questSecondTarget"];
	return result;
}

@dynamic questThirdTarget;

- (NSMutableSet*)questThirdTargetSet {
	[self willAccessValueForKey:@"questThirdTarget"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"questThirdTarget"];

	[self didAccessValueForKey:@"questThirdTarget"];
	return result;
}

@end

