// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to QuestDrop.m instead.

#import "_QuestDrop.h"

const struct QuestDropRelationships QuestDropRelationships = {
	.quest = @"quest",
};

@implementation QuestDropID
@end

@implementation _QuestDrop

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"QuestDrop" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"QuestDrop";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"QuestDrop" inManagedObjectContext:moc_];
}

- (QuestDropID*)objectID {
	return (QuestDropID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic quest;

@end

