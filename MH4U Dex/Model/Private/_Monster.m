// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Monster.m instead.

#import "_Monster.h"

const struct MonsterAttributes MonsterAttributes = {
	.icon = @"icon",
	.id = @"id",
	.jpn_name = @"jpn_name",
	.monster_class = @"monster_class",
	.name = @"name",
	.sort_name = @"sort_name",
	.trait = @"trait",
	.url = @"url",
};

const struct MonsterRelationships MonsterRelationships = {
	.damageZone = @"damageZone",
	.drop = @"drop",
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

	if ([key isEqualToString:@"idValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"id"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic icon;

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

@dynamic jpn_name;

@dynamic monster_class;

@dynamic name;

@dynamic sort_name;

@dynamic trait;

@dynamic url;

@dynamic damageZone;

- (NSMutableSet*)damageZoneSet {
	[self willAccessValueForKey:@"damageZone"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"damageZone"];

	[self didAccessValueForKey:@"damageZone"];
	return result;
}

@dynamic drop;

- (NSMutableSet*)dropSet {
	[self willAccessValueForKey:@"drop"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"drop"];

	[self didAccessValueForKey:@"drop"];
	return result;
}

@end

