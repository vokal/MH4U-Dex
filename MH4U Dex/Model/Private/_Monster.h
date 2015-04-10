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
	__unsafe_unretained NSString *quest;
} MonsterRelationships;

@class DamageZone;
@class MonsterDrop;
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

@property (nonatomic, strong) NSSet *quest;

- (NSMutableSet*)questSet;

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

@interface _Monster (QuestCoreDataGeneratedAccessors)
- (void)addQuest:(NSSet*)value_;
- (void)removeQuest:(NSSet*)value_;
- (void)addQuestObject:(Quest*)value_;
- (void)removeQuestObject:(Quest*)value_;

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

- (NSMutableSet*)primitiveQuest;
- (void)setPrimitiveQuest:(NSMutableSet*)value;

@end
