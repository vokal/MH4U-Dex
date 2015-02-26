// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to MonsterDrop.h instead.

#import <CoreData/CoreData.h>

extern const struct MonsterDropAttributes {
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *method;
	__unsafe_unretained NSString *percent;
	__unsafe_unretained NSString *quantity;
	__unsafe_unretained NSString *rank;
} MonsterDropAttributes;

extern const struct MonsterDropRelationships {
	__unsafe_unretained NSString *item;
	__unsafe_unretained NSString *monsterSource;
} MonsterDropRelationships;

@class Item;
@class Monster;

@interface MonsterDropID : NSManagedObjectID {}
@end

@interface _MonsterDrop : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) MonsterDropID* objectID;

@property (nonatomic, strong) NSNumber* id;

@property (atomic) int16_t idValue;
- (int16_t)idValue;
- (void)setIdValue:(int16_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* method;

//- (BOOL)validateMethod:(id*)value_ error:(NSError**)error_;

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

@property (nonatomic, strong) NSString* rank;

//- (BOOL)validateRank:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Item *item;

//- (BOOL)validateItem:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Monster *monsterSource;

//- (BOOL)validateMonsterSource:(id*)value_ error:(NSError**)error_;

+ (NSArray*)fetchFetchRequest:(NSManagedObjectContext*)moc_ ;
+ (NSArray*)fetchFetchRequest:(NSManagedObjectContext*)moc_ error:(NSError**)error_;

@end

@interface _MonsterDrop (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int16_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int16_t)value_;

- (NSString*)primitiveMethod;
- (void)setPrimitiveMethod:(NSString*)value;

- (NSNumber*)primitivePercent;
- (void)setPrimitivePercent:(NSNumber*)value;

- (int16_t)primitivePercentValue;
- (void)setPrimitivePercentValue:(int16_t)value_;

- (NSNumber*)primitiveQuantity;
- (void)setPrimitiveQuantity:(NSNumber*)value;

- (int16_t)primitiveQuantityValue;
- (void)setPrimitiveQuantityValue:(int16_t)value_;

- (NSString*)primitiveRank;
- (void)setPrimitiveRank:(NSString*)value;

- (Item*)primitiveItem;
- (void)setPrimitiveItem:(Item*)value;

- (Monster*)primitiveMonsterSource;
- (void)setPrimitiveMonsterSource:(Monster*)value;

@end
