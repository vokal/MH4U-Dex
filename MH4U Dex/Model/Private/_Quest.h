// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Quest.h instead.

#import <CoreData/CoreData.h>

extern const struct QuestAttributes {
	__unsafe_unretained NSString *caravan;
	__unsafe_unretained NSString *danger;
	__unsafe_unretained NSString *fee;
	__unsafe_unretained NSString *hrp;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *keyQuest;
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
	__unsafe_unretained NSString *followUp;
	__unsafe_unretained NSString *monster;
	__unsafe_unretained NSString *prerequisite;
	__unsafe_unretained NSString *region;
} QuestRelationships;

@class QuestDrop;
@class Quest;
@class Monster;
@class Quest;
@class Region;

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

@property (nonatomic, strong) NSNumber* keyQuest;

@property (atomic) BOOL keyQuestValue;
- (BOOL)keyQuestValue;
- (void)setKeyQuestValue:(BOOL)value_;

//- (BOOL)validateKeyQuest:(id*)value_ error:(NSError**)error_;

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

@property (nonatomic, strong) NSSet *followUp;

- (NSMutableSet*)followUpSet;

@property (nonatomic, strong) NSSet *monster;

- (NSMutableSet*)monsterSet;

@property (nonatomic, strong) NSSet *prerequisite;

- (NSMutableSet*)prerequisiteSet;

@property (nonatomic, strong) Region *region;

//- (BOOL)validateRegion:(id*)value_ error:(NSError**)error_;

@end

@interface _Quest (DropCoreDataGeneratedAccessors)
- (void)addDrop:(NSSet*)value_;
- (void)removeDrop:(NSSet*)value_;
- (void)addDropObject:(QuestDrop*)value_;
- (void)removeDropObject:(QuestDrop*)value_;

@end

@interface _Quest (FollowUpCoreDataGeneratedAccessors)
- (void)addFollowUp:(NSSet*)value_;
- (void)removeFollowUp:(NSSet*)value_;
- (void)addFollowUpObject:(Quest*)value_;
- (void)removeFollowUpObject:(Quest*)value_;

@end

@interface _Quest (MonsterCoreDataGeneratedAccessors)
- (void)addMonster:(NSSet*)value_;
- (void)removeMonster:(NSSet*)value_;
- (void)addMonsterObject:(Monster*)value_;
- (void)removeMonsterObject:(Monster*)value_;

@end

@interface _Quest (PrerequisiteCoreDataGeneratedAccessors)
- (void)addPrerequisite:(NSSet*)value_;
- (void)removePrerequisite:(NSSet*)value_;
- (void)addPrerequisiteObject:(Quest*)value_;
- (void)removePrerequisiteObject:(Quest*)value_;

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

- (NSNumber*)primitiveKeyQuest;
- (void)setPrimitiveKeyQuest:(NSNumber*)value;

- (BOOL)primitiveKeyQuestValue;
- (void)setPrimitiveKeyQuestValue:(BOOL)value_;

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

- (NSMutableSet*)primitiveFollowUp;
- (void)setPrimitiveFollowUp:(NSMutableSet*)value;

- (NSMutableSet*)primitiveMonster;
- (void)setPrimitiveMonster:(NSMutableSet*)value;

- (NSMutableSet*)primitivePrerequisite;
- (void)setPrimitivePrerequisite:(NSMutableSet*)value;

- (Region*)primitiveRegion;
- (void)setPrimitiveRegion:(Region*)value;

@end
