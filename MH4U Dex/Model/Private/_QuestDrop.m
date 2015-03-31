// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to QuestDrop.m instead.

#import "_QuestDrop.h"

const struct QuestDropAttributes QuestDropAttributes = {
	.id = @"id",
	.row = @"row",
};

const struct QuestDropRelationships QuestDropRelationships = {
	.item = @"item",
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

@dynamic row;

@dynamic item;

@dynamic quest;

@end

