// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to AreaDrop.m instead.

#import "_AreaDrop.h"

const struct AreaDropAttributes AreaDropAttributes = {
	.idDecimalString = @"idDecimalString",
	.method = @"method",
	.percent = @"percent",
	.quantity = @"quantity",
	.rank = @"rank",
};

const struct AreaDropRelationships AreaDropRelationships = {
	.area = @"area",
	.item = @"item",
};

@implementation AreaDropID
@end

@implementation _AreaDrop

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"AreaDrop" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"AreaDrop";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"AreaDrop" inManagedObjectContext:moc_];
}

- (AreaDropID*)objectID {
	return (AreaDropID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	if ([key isEqualToString:@"percentValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"percent"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"quantityValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"quantity"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}

@dynamic idDecimalString;

@dynamic method;

@dynamic percent;

- (int16_t)percentValue {
	NSNumber *result = [self percent];
	return [result shortValue];
}

- (void)setPercentValue:(int16_t)value_ {
	[self setPercent:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitivePercentValue {
	NSNumber *result = [self primitivePercent];
	return [result shortValue];
}

- (void)setPrimitivePercentValue:(int16_t)value_ {
	[self setPrimitivePercent:[NSNumber numberWithShort:value_]];
}

@dynamic quantity;

- (int16_t)quantityValue {
	NSNumber *result = [self quantity];
	return [result shortValue];
}

- (void)setQuantityValue:(int16_t)value_ {
	[self setQuantity:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveQuantityValue {
	NSNumber *result = [self primitiveQuantity];
	return [result shortValue];
}

- (void)setPrimitiveQuantityValue:(int16_t)value_ {
	[self setPrimitiveQuantity:[NSNumber numberWithShort:value_]];
}

@dynamic rank;

@dynamic area;

@dynamic item;

@end

