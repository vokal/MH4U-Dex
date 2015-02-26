// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Armor.m instead.

#import "_Armor.h"

const struct ArmorAttributes ArmorAttributes = {
	.maxDefense = @"maxDefense",
	.minDefense = @"minDefense",
	.name = @"name",
};

const struct ArmorRelationships ArmorRelationships = {
	.material = @"material",
	.set = @"set",
	.skilltree = @"skilltree",
};

@implementation ArmorID
@end

@implementation _Armor

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Armor" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Armor";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Armor" inManagedObjectContext:moc_];
}

- (ArmorID*)objectID {
	return (ArmorID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"maxDefenseValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"maxDefense"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"minDefenseValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"minDefense"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic maxDefense;

- (int16_t)maxDefenseValue {
	NSNumber *result = [self maxDefense];
	return [result shortValue];
}

- (void)setMaxDefenseValue:(int16_t)value_ {
	[self setMaxDefense:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveMaxDefenseValue {
	NSNumber *result = [self primitiveMaxDefense];
	return [result shortValue];
}

- (void)setPrimitiveMaxDefenseValue:(int16_t)value_ {
	[self setPrimitiveMaxDefense:[NSNumber numberWithShort:value_]];
}

@dynamic minDefense;

- (int16_t)minDefenseValue {
	NSNumber *result = [self minDefense];
	return [result shortValue];
}

- (void)setMinDefenseValue:(int16_t)value_ {
	[self setMinDefense:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveMinDefenseValue {
	NSNumber *result = [self primitiveMinDefense];
	return [result shortValue];
}

- (void)setPrimitiveMinDefenseValue:(int16_t)value_ {
	[self setPrimitiveMinDefense:[NSNumber numberWithShort:value_]];
}

@dynamic name;

@dynamic material;

- (NSMutableSet*)materialSet {
	[self willAccessValueForKey:@"material"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"material"];

	[self didAccessValueForKey:@"material"];
	return result;
}

@dynamic set;

@dynamic skilltree;

- (NSMutableSet*)skilltreeSet {
	[self willAccessValueForKey:@"skilltree"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"skilltree"];

	[self didAccessValueForKey:@"skilltree"];
	return result;
}

@end

