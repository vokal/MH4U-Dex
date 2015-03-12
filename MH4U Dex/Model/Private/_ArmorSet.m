// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to ArmorSet.m instead.

#import "_ArmorSet.h"

const struct ArmorSetAttributes ArmorSetAttributes = {
	.name = @"name",
};

const struct ArmorSetRelationships ArmorSetRelationships = {
	.piece = @"piece",
};

@implementation ArmorSetID
@end

@implementation _ArmorSet

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"ArmorSet" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"ArmorSet";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"ArmorSet" inManagedObjectContext:moc_];
}

- (ArmorSetID*)objectID {
	return (ArmorSetID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic piece;

- (NSMutableSet*)pieceSet {
	[self willAccessValueForKey:@"piece"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"piece"];

	[self didAccessValueForKey:@"piece"];
	return result;
}

@end

