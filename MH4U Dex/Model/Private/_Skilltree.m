// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Skilltree.m instead.

#import "_Skilltree.h"

const struct SkilltreeAttributes SkilltreeAttributes = {
	.name = @"name",
};

const struct SkilltreeRelationships SkilltreeRelationships = {
	.armor = @"armor",
	.decoration = @"decoration",
};

@implementation SkilltreeID
@end

@implementation _Skilltree

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Skilltree" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Skilltree";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Skilltree" inManagedObjectContext:moc_];
}

- (SkilltreeID*)objectID {
	return (SkilltreeID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic name;

@dynamic armor;

- (NSMutableSet*)armorSet {
	[self willAccessValueForKey:@"armor"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"armor"];

	[self didAccessValueForKey:@"armor"];
	return result;
}

@dynamic decoration;

- (NSMutableSet*)decorationSet {
	[self willAccessValueForKey:@"decoration"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"decoration"];

	[self didAccessValueForKey:@"decoration"];
	return result;
}

@end

