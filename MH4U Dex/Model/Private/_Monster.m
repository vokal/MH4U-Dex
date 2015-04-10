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
	.quest = @"quest",
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

@dynamic quest;

- (NSMutableSet*)questSet {
	[self willAccessValueForKey:@"quest"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"quest"];

	[self didAccessValueForKey:@"quest"];
	return result;
}

@end

