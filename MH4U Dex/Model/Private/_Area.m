// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Area.m instead.

#import "_Area.h"

const struct AreaAttributes AreaAttributes = {
	.combinedName = @"combinedName",
	.name = @"name",
	.rank = @"rank",
};

const struct AreaRelationships AreaRelationships = {
	.drop = @"drop",
	.region = @"region",
};

@implementation AreaID
@end

@implementation _Area

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Area" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Area";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Area" inManagedObjectContext:moc_];
}

- (AreaID*)objectID {
	return (AreaID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic combinedName;

@dynamic name;

@dynamic rank;

@dynamic drop;

- (NSMutableSet*)dropSet {
	[self willAccessValueForKey:@"drop"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"drop"];

	[self didAccessValueForKey:@"drop"];
	return result;
}

@dynamic region;

@end

