// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DamageZone.h instead.

#import <CoreData/CoreData.h>

extern const struct DamageZoneAttributes {
	__unsafe_unretained NSString *bodyPart;
	__unsafe_unretained NSString *cut;
	__unsafe_unretained NSString *dragon;
	__unsafe_unretained NSString *fire;
	__unsafe_unretained NSString *ice;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *impact;
	__unsafe_unretained NSString *ko;
	__unsafe_unretained NSString *shot;
	__unsafe_unretained NSString *thunder;
	__unsafe_unretained NSString *water;
} DamageZoneAttributes;

extern const struct DamageZoneRelationships {
	__unsafe_unretained NSString *monster;
} DamageZoneRelationships;

@class Monster;

@interface DamageZoneID : NSManagedObjectID {}
@end

@interface _DamageZone : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DamageZoneID* objectID;

@property (nonatomic, strong) NSString* bodyPart;

//- (BOOL)validateBodyPart:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* cut;

@property (atomic) int16_t cutValue;
- (int16_t)cutValue;
- (void)setCutValue:(int16_t)value_;

//- (BOOL)validateCut:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* dragon;

@property (atomic) int16_t dragonValue;
- (int16_t)dragonValue;
- (void)setDragonValue:(int16_t)value_;

//- (BOOL)validateDragon:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* fire;

@property (atomic) int16_t fireValue;
- (int16_t)fireValue;
- (void)setFireValue:(int16_t)value_;

//- (BOOL)validateFire:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* ice;

@property (atomic) int16_t iceValue;
- (int16_t)iceValue;
- (void)setIceValue:(int16_t)value_;

//- (BOOL)validateIce:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* id;

@property (atomic) int16_t idValue;
- (int16_t)idValue;
- (void)setIdValue:(int16_t)value_;

//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* impact;

@property (atomic) int16_t impactValue;
- (int16_t)impactValue;
- (void)setImpactValue:(int16_t)value_;

//- (BOOL)validateImpact:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* ko;

@property (atomic) int16_t koValue;
- (int16_t)koValue;
- (void)setKoValue:(int16_t)value_;

//- (BOOL)validateKo:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* shot;

@property (atomic) int16_t shotValue;
- (int16_t)shotValue;
- (void)setShotValue:(int16_t)value_;

//- (BOOL)validateShot:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* thunder;

@property (atomic) int16_t thunderValue;
- (int16_t)thunderValue;
- (void)setThunderValue:(int16_t)value_;

//- (BOOL)validateThunder:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSNumber* water;

@property (atomic) int16_t waterValue;
- (int16_t)waterValue;
- (void)setWaterValue:(int16_t)value_;

//- (BOOL)validateWater:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Monster *monster;

//- (BOOL)validateMonster:(id*)value_ error:(NSError**)error_;

@end

@interface _DamageZone (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveBodyPart;
- (void)setPrimitiveBodyPart:(NSString*)value;

- (NSNumber*)primitiveCut;
- (void)setPrimitiveCut:(NSNumber*)value;

- (int16_t)primitiveCutValue;
- (void)setPrimitiveCutValue:(int16_t)value_;

- (NSNumber*)primitiveDragon;
- (void)setPrimitiveDragon:(NSNumber*)value;

- (int16_t)primitiveDragonValue;
- (void)setPrimitiveDragonValue:(int16_t)value_;

- (NSNumber*)primitiveFire;
- (void)setPrimitiveFire:(NSNumber*)value;

- (int16_t)primitiveFireValue;
- (void)setPrimitiveFireValue:(int16_t)value_;

- (NSNumber*)primitiveIce;
- (void)setPrimitiveIce:(NSNumber*)value;

- (int16_t)primitiveIceValue;
- (void)setPrimitiveIceValue:(int16_t)value_;

- (NSNumber*)primitiveId;
- (void)setPrimitiveId:(NSNumber*)value;

- (int16_t)primitiveIdValue;
- (void)setPrimitiveIdValue:(int16_t)value_;

- (NSNumber*)primitiveImpact;
- (void)setPrimitiveImpact:(NSNumber*)value;

- (int16_t)primitiveImpactValue;
- (void)setPrimitiveImpactValue:(int16_t)value_;

- (NSNumber*)primitiveKo;
- (void)setPrimitiveKo:(NSNumber*)value;

- (int16_t)primitiveKoValue;
- (void)setPrimitiveKoValue:(int16_t)value_;

- (NSNumber*)primitiveShot;
- (void)setPrimitiveShot:(NSNumber*)value;

- (int16_t)primitiveShotValue;
- (void)setPrimitiveShotValue:(int16_t)value_;

- (NSNumber*)primitiveThunder;
- (void)setPrimitiveThunder:(NSNumber*)value;

- (int16_t)primitiveThunderValue;
- (void)setPrimitiveThunderValue:(int16_t)value_;

- (NSNumber*)primitiveWater;
- (void)setPrimitiveWater:(NSNumber*)value;

- (int16_t)primitiveWaterValue;
- (void)setPrimitiveWaterValue:(int16_t)value_;

- (Monster*)primitiveMonster;
- (void)setPrimitiveMonster:(Monster*)value;

@end
