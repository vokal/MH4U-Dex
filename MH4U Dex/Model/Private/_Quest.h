// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Quest.h instead.

#import <CoreData/CoreData.h>

extern const struct QuestAttributes {
	__unsafe_unretained NSString *caravan;
	__unsafe_unretained NSString *danger;
	__unsafe_unretained NSString *fee;
	__unsafe_unretained NSString *hrp;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *key;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *objective;
	__unsafe_unretained NSString *reward;
	__unsafe_unretained NSString *stars;
	__unsafe_unretained NSString *subObjective;
	__unsafe_unretained NSString *type;
	__unsafe_unretained NSString *urgent;
} QuestAttributes;

extern const struct QuestRelationships {
	__unsafe_unretained NSString *drop;
	__unsafe_unretained NSString *firstMonster;
	__unsafe_unretained NSString *fourthMonster;
	__unsafe_unretained NSString *region;
	__unsafe_unretained NSString *secondMonster;
	__unsafe_unretained NSString *thirdMonster;
} QuestRelationships;

@class QuestDrop;
@class Monster;
@class Monster;
@class Region;
@class Monster;
@class Monster;

@interface QuestID : NSManagedObjectID {}
@end

@interface _Quest : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) QuestID* objectID;

@property (nonatomic, strong) NSNumber* caravan;

@property (atomic) BOOL caravanValue;
- (BOOL)caravanValue;
- (void)setCaravanValue:(BOOL)value_;

//- (BOOL)validateCaravan:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* danger;

@property (atomic) BOOL dangerValue;
- (BOOL)dangerValue;
- (void)setDangerValue:(BOOL)value_;

//- (BOOL)validateDanger:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* fee;

@property (atomic) int16_t feeValue;
- (int16_t)feeValue;
- (void)setFeeValue:(int16_t)value_;

//- (BOOL)validateFee:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* hrp;

@property (atomic) int16_t hrpValue;
- (int16_t)hrpValue;
- (void)setHrpValue:(int16_t)value_;

//- (BOOL)validateHrp:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* id;

@property (atomic) int16_t idValue;
- (int16_t)idValue;
- (void)setIdValue:(int16_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* key;

@property (atomic) BOOL keyValue;
- (BOOL)keyValue;
- (void)setKeyValue:(BOOL)value_;

//- (BOOL)validateKey:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* objective;

//- (BOOL)validateObjective:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* reward;

@property (atomic) int16_t rewardValue;
- (int16_t)rewardValue;
- (void)setRewardValue:(int16_t)value_;

//- (BOOL)validateReward:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* stars;

@property (atomic) int16_t starsValue;
- (int16_t)starsValue;
- (void)setStarsValue:(int16_t)value_;

//- (BOOL)validateStars:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* subObjective;

//- (BOOL)validateSubObjective:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* type;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* urgent;

@property (atomic) BOOL urgentValue;
- (BOOL)urgentValue;
- (void)setUrgentValue:(BOOL)value_;

//- (BOOL)validateUrgent:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *drop;

- (NSMutableSet*)dropSet;

@property (nonatomic, strong) Monster *firstMonster;

//- (BOOL)validateFirstMonster:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Monster *fourthMonster;

//- (BOOL)validateFourthMonster:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Region *region;

//- (BOOL)validateRegion:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Monster *secondMonster;

//- (BOOL)validateSecondMonster:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Monster *thirdMonster;

//- (BOOL)validateThirdMonster:(id*)value_ error:(NSError**)error_;

@end

@interface _Quest (DropCoreDataGeneratedAccessors)
- (void)addDrop:(NSSet*)value_;
- (void)removeDrop:(NSSet*)value_;
- (void)addDropObject:(QuestDrop*)value_;
- (void)removeDropObject:(QuestDrop*)value_;

@end

@interface _Quest (CoreDataGeneratedPrimitiveAccessors)

- (NSNumber*)primitiveCaravan;
- (void)setPrimitiveCaravan:(NSNumber*)value;

- (BOOL)primitiveCaravanValue;
- (void)setPrimitiveCaravanValue:(BOOL)value_;

- (NSNumber*)primitiveDanger;
- (void)setPrimitiveDanger:(NSNumber*)value;

- (BOOL)primitiveDangerValue;
- (void)setPrimitiveDangerValue:(BOOL)value_;

- (NSNumber*)primitiveFee;
- (void)setPrimitiveFee:(NSNumber*)value;

- (int16_t)primitiveFeeValue;
- (void)setPrimitiveFeeValue:(int16_t)value_;

- (NSNumber*)primitiveHrp;
- (void)setPrimitiveHrp:(NSNumber*)value;

- (int16_t)primitiveHrpValue;
- (void)setPrimitiveHrpValue:(int16_t)value_;

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int16_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int16_t)value_;

- (NSNumber*)primitiveKey;
- (void)setPrimitiveKey:(NSNumber*)value;

- (BOOL)primitiveKeyValue;
- (void)setPrimitiveKeyValue:(BOOL)value_;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitiveObjective;
- (void)setPrimitiveObjective:(NSString*)value;

- (NSNumber*)primitiveReward;
- (void)setPrimitiveReward:(NSNumber*)value;

- (int16_t)primitiveRewardValue;
- (void)setPrimitiveRewardValue:(int16_t)value_;

- (NSNumber*)primitiveStars;
- (void)setPrimitiveStars:(NSNumber*)value;

- (int16_t)primitiveStarsValue;
- (void)setPrimitiveStarsValue:(int16_t)value_;

- (NSString*)primitiveSubObjective;
- (void)setPrimitiveSubObjective:(NSString*)value;

- (NSNumber*)primitiveUrgent;
- (void)setPrimitiveUrgent:(NSNumber*)value;

- (BOOL)primitiveUrgentValue;
- (void)setPrimitiveUrgentValue:(BOOL)value_;

- (NSMutableSet*)primitiveDrop;
- (void)setPrimitiveDrop:(NSMutableSet*)value;

- (Monster*)primitiveFirstMonster;
- (void)setPrimitiveFirstMonster:(Monster*)value;

- (Monster*)primitiveFourthMonster;
- (void)setPrimitiveFourthMonster:(Monster*)value;

- (Region*)primitiveRegion;
- (void)setPrimitiveRegion:(Region*)value;

- (Monster*)primitiveSecondMonster;
- (void)setPrimitiveSecondMonster:(Monster*)value;

- (Monster*)primitiveThirdMonster;
- (void)setPrimitiveThirdMonster:(Monster*)value;

@end
