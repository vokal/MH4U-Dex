// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Monster.h instead.

#import <CoreData/CoreData.h>

extern const struct MonsterAttributes {
	__unsafe_unretained NSString *icon;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *jpn_name;
	__unsafe_unretained NSString *monster_class;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *sort_name;
	__unsafe_unretained NSString *trait;
	__unsafe_unretained NSString *url;
} MonsterAttributes;

extern const struct MonsterRelationships {
	__unsafe_unretained NSString *damageZone;
	__unsafe_unretained NSString *drop;
} MonsterRelationships;

@class DamageZone;
@class MonsterDrop;

@interface MonsterID : NSManagedObjectID {}
@end

@interface _Monster : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) MonsterID* objectID;

@property (nonatomic, strong) NSString* icon;

//- (BOOL)validateIcon:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* id;

@property (atomic) int16_t idValue;
- (int16_t)idValue;
- (void)setIdValue:(int16_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* jpn_name;

//- (BOOL)validateJpn_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* monster_class;

//- (BOOL)validateMonster_class:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* sort_name;

//- (BOOL)validateSort_name:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* trait;

//- (BOOL)validateTrait:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* url;

//- (BOOL)validateUrl:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *damageZone;

- (NSMutableSet*)damageZoneSet;

@property (nonatomic, strong) NSSet *drop;

- (NSMutableSet*)dropSet;

@end

@interface _Monster (DamageZoneCoreDataGeneratedAccessors)
- (void)addDamageZone:(NSSet*)value_;
- (void)removeDamageZone:(NSSet*)value_;
- (void)addDamageZoneObject:(DamageZone*)value_;
- (void)removeDamageZoneObject:(DamageZone*)value_;

@end

@interface _Monster (DropCoreDataGeneratedAccessors)
- (void)addDrop:(NSSet*)value_;
- (void)removeDrop:(NSSet*)value_;
- (void)addDropObject:(MonsterDrop*)value_;
- (void)removeDropObject:(MonsterDrop*)value_;

@end

@interface _Monster (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveIcon;
- (void)setPrimitiveIcon:(NSString*)value;

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int16_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int16_t)value_;

- (NSString*)primitiveJpn_name;
- (void)setPrimitiveJpn_name:(NSString*)value;

- (NSString*)primitiveMonster_class;
- (void)setPrimitiveMonster_class:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitiveSort_name;
- (void)setPrimitiveSort_name:(NSString*)value;

- (NSString*)primitiveTrait;
- (void)setPrimitiveTrait:(NSString*)value;

- (NSString*)primitiveUrl;
- (void)setPrimitiveUrl:(NSString*)value;

- (NSMutableSet*)primitiveDamageZone;
- (void)setPrimitiveDamageZone:(NSMutableSet*)value;

- (NSMutableSet*)primitiveDrop;
- (void)setPrimitiveDrop:(NSMutableSet*)value;

@end
