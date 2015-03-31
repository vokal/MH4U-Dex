// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Drop.h instead.

#import <CoreData/CoreData.h>

extern const struct DropAttributes {
	__unsafe_unretained NSString *percent;
	__unsafe_unretained NSString *quantity;
} DropAttributes;

@interface DropID : NSManagedObjectID {}
@end

@interface _Drop : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DropID* objectID;

@property (nonatomic, strong) NSNumber* percent;

@property (atomic) int16_t percentValue;
- (int16_t)percentValue;
- (void)setPercentValue:(int16_t)value_;

//- (BOOL)validatePercent:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* quantity;

@property (atomic) int16_t quantityValue;
- (int16_t)quantityValue;
- (void)setQuantityValue:(int16_t)value_;

//- (BOOL)validateQuantity:(id*)value_ error:(NSError**)error_;

@end

@interface _Drop (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitivePercent;
- (void)setPrimitivePercent:(NSNumber*)value;

- (int16_t)primitivePercentValue;
- (void)setPrimitivePercentValue:(int16_t)value_;

- (NSNumber*)primitiveQuantity;
- (void)setPrimitiveQuantity:(NSNumber*)value;

- (int16_t)primitiveQuantityValue;
- (void)setPrimitiveQuantityValue:(int16_t)value_;

@end
