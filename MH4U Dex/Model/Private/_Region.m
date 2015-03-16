// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Region.m instead.

#import "_Region.h"

const struct RegionAttributes RegionAttributes = {
	.id = @"id",
	.keyName = @"keyName",
	.name = @"name",
};

const struct RegionRelationships RegionRelationships = {
	.area = @"area",
	.quest = @"quest",
};

@implementation RegionID
@end

@implementation _Region

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Region" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Region";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Region" inManagedObjectContext:moc_];
}

- (RegionID*)objectID {
	return (RegionID*)[super objectID];
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

@dynamic keyName;

@dynamic name;

@dynamic area;

- (NSMutableSet*)areaSet {
	[self willAccessValueForKey:@"area"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"area"];

	[self didAccessValueForKey:@"area"];
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

