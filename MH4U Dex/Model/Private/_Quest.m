// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Quest.m instead.

#import "_Quest.h"

const struct QuestAttributes QuestAttributes = {
	.name = @"name",
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

	return keyPaths;
}

@dynamic name;

@end

