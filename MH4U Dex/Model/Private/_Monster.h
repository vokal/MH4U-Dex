// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Monster.h instead.

#import <CoreData/CoreData.h>

extern const struct MonsterAttributes {
	__unsafe_unretained NSString *monster_class;
	__unsafe_unretained NSString *monster_description;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *sort_name;
} MonsterAttributes;

extern const struct MonsterRelationships {
	__unsafe_unretained NSString *damageZone;
	__unsafe_unretained NSString *monsterDrop;
	__unsafe_unretained NSString *questFirstTarget;
	__unsafe_unretained NSString *questFourthTarget;
	__unsafe_unretained NSString *questSecondTarget;
	__unsafe_unretained NSString *questThirdTarget;
} MonsterRelationships;

@class DamageZone;
@class MonsterDrop;
@class Quest;
@class Quest;
@class Quest;
@class Quest;

@interface MonsterID : NSManagedObjectID {}
@end

@interface _Monster : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) MonsterID* objectID;

@property (nonatomic, strong) NSString* monster_class;

//- (BOOL)validateMonster_class:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* monster_description;

//- (BOOL)validateMonster_description:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* sort_name;

//- (BOOL)validateSort_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *damageZone;

- (NSMutableSet*)damageZoneSet;

@property (nonatomic, strong) NSSet *monsterDrop;

- (NSMutableSet*)monsterDropSet;

@property (nonatomic, strong) NSSet *questFirstTarget;

- (NSMutableSet*)questFirstTargetSet;

@property (nonatomic, strong) NSSet *questFourthTarget;

- (NSMutableSet*)questFourthTargetSet;

@property (nonatomic, strong) NSSet *questSecondTarget;

- (NSMutableSet*)questSecondTargetSet;

@property (nonatomic, strong) NSSet *questThirdTarget;

- (NSMutableSet*)questThirdTargetSet;

@end

@interface _Monster (DamageZoneCoreDataGeneratedAccessors)
- (void)addDamageZone:(NSSet*)value_;
- (void)removeDamageZone:(NSSet*)value_;
- (void)addDamageZoneObject:(DamageZone*)value_;
- (void)removeDamageZoneObject:(DamageZone*)value_;

@end

@interface _Monster (MonsterDropCoreDataGeneratedAccessors)
- (void)addMonsterDrop:(NSSet*)value_;
- (void)removeMonsterDrop:(NSSet*)value_;
- (void)addMonsterDropObject:(MonsterDrop*)value_;
- (void)removeMonsterDropObject:(MonsterDrop*)value_;

@end

@interface _Monster (QuestFirstTargetCoreDataGeneratedAccessors)
- (void)addQuestFirstTarget:(NSSet*)value_;
- (void)removeQuestFirstTarget:(NSSet*)value_;
- (void)addQuestFirstTargetObject:(Quest*)value_;
- (void)removeQuestFirstTargetObject:(Quest*)value_;

@end

@interface _Monster (QuestFourthTargetCoreDataGeneratedAccessors)
- (void)addQuestFourthTarget:(NSSet*)value_;
- (void)removeQuestFourthTarget:(NSSet*)value_;
- (void)addQuestFourthTargetObject:(Quest*)value_;
- (void)removeQuestFourthTargetObject:(Quest*)value_;

@end

@interface _Monster (QuestSecondTargetCoreDataGeneratedAccessors)
- (void)addQuestSecondTarget:(NSSet*)value_;
- (void)removeQuestSecondTarget:(NSSet*)value_;
- (void)addQuestSecondTargetObject:(Quest*)value_;
- (void)removeQuestSecondTargetObject:(Quest*)value_;

@end

@interface _Monster (QuestThirdTargetCoreDataGeneratedAccessors)
- (void)addQuestThirdTarget:(NSSet*)value_;
- (void)removeQuestThirdTarget:(NSSet*)value_;
- (void)addQuestThirdTargetObject:(Quest*)value_;
- (void)removeQuestThirdTargetObject:(Quest*)value_;

@end

@interface _Monster (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveMonster_class;
- (void)setPrimitiveMonster_class:(NSString*)value;

- (NSString*)primitiveMonster_description;
- (void)setPrimitiveMonster_description:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitiveSort_name;
- (void)setPrimitiveSort_name:(NSString*)value;

- (NSMutableSet*)primitiveDamageZone;
- (void)setPrimitiveDamageZone:(NSMutableSet*)value;

- (NSMutableSet*)primitiveMonsterDrop;
- (void)setPrimitiveMonsterDrop:(NSMutableSet*)value;

- (NSMutableSet*)primitiveQuestFirstTarget;
- (void)setPrimitiveQuestFirstTarget:(NSMutableSet*)value;

- (NSMutableSet*)primitiveQuestFourthTarget;
- (void)setPrimitiveQuestFourthTarget:(NSMutableSet*)value;

- (NSMutableSet*)primitiveQuestSecondTarget;
- (void)setPrimitiveQuestSecondTarget:(NSMutableSet*)value;

- (NSMutableSet*)primitiveQuestThirdTarget;
- (void)setPrimitiveQuestThirdTarget:(NSMutableSet*)value;

@end
