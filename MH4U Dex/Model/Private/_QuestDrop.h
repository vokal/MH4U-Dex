// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to QuestDrop.h instead.

#import <CoreData/CoreData.h>

extern const struct QuestDropAttributes {
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *percent;
	__unsafe_unretained NSString *quantity;
	__unsafe_unretained NSString *row;
} QuestDropAttributes;

extern const struct QuestDropRelationships {
	__unsafe_unretained NSString *item;
	__unsafe_unretained NSString *quest;
} QuestDropRelationships;

@class Item;
@class Quest;

@interface QuestDropID : NSManagedObjectID {}
@end

@interface _QuestDrop : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) QuestDropID* objectID;

@property (nonatomic, strong) NSNumber* id;

@property (atomic) int16_t idValue;
- (int16_t)idValue;
- (void)setIdValue:(int16_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* percent;

//- (BOOL)validatePercent:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* quantity;

@property (atomic) int16_t quantityValue;
- (int16_t)quantityValue;
- (void)setQuantityValue:(int16_t)value_;

//- (BOOL)validateQuantity:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* row;

//- (BOOL)validateRow:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Item *item;

//- (BOOL)validateItem:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Quest *quest;

//- (BOOL)validateQuest:(id*)value_ error:(NSError**)error_;

@end

@interface _QuestDrop (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int16_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int16_t)value_;

- (NSString*)primitivePercent;
- (void)setPrimitivePercent:(NSString*)value;

- (NSNumber*)primitiveQuantity;
- (void)setPrimitiveQuantity:(NSNumber*)value;

- (int16_t)primitiveQuantityValue;
- (void)setPrimitiveQuantityValue:(int16_t)value_;

- (NSString*)primitiveRow;
- (void)setPrimitiveRow:(NSString*)value;

- (Item*)primitiveItem;
- (void)setPrimitiveItem:(Item*)value;

- (Quest*)primitiveQuest;
- (void)setPrimitiveQuest:(Quest*)value;

@end
