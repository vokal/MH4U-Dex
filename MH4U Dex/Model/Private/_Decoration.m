// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Decoration.m instead.

#import "_Decoration.h"

const struct DecorationAttributes DecorationAttributes = {
	.name = @"name",
};

const struct DecorationRelationships DecorationRelationships = {
	.material = @"material",
	.skilltree = @"skilltree",
};

@implementation DecorationID
@end

@implementation _Decoration

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Decoration" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Decoration";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Decoration" inManagedObjectContext:moc_];
}

- (DecorationID*)objectID {
	return (DecorationID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic material;

- (NSMutableSet*)materialSet {
	[self willAccessValueForKey:@"material"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"material"];

	[self didAccessValueForKey:@"material"];
	return result;
}

@dynamic skilltree;

- (NSMutableSet*)skilltreeSet {
	[self willAccessValueForKey:@"skilltree"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"skilltree"];

	[self didAccessValueForKey:@"skilltree"];
	return result;
}

@end

