// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Item.h instead.

#import <CoreData/CoreData.h>

extern const struct ItemAttributes {
	__unsafe_unretained NSString *name;
} ItemAttributes;

extern const struct ItemRelationships {
	__unsafe_unretained NSString *areaSource;
	__unsafe_unretained NSString *armorUse;
	__unsafe_unretained NSString *comboFirst;
	__unsafe_unretained NSString *comboSecond;
	__unsafe_unretained NSString *comboThird;
	__unsafe_unretained NSString *decorationUse;
	__unsafe_unretained NSString *monsterSource;
	__unsafe_unretained NSString *questSource;
	__unsafe_unretained NSString *tradeIn;
	__unsafe_unretained NSString *tradeOut;
	__unsafe_unretained NSString *weaponUse;
} ItemRelationships;

@class AreaDrop;
@class Armor;
@class Combination;
@class Combination;
@class Combination;
@class Decoration;
@class MonsterDrop;
@class QuestDrop;
@class Trade;
@class Trade;
@class Weapon;

@interface ItemID : NSManagedObjectID {}
@end

@interface _Item : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ItemID* objectID;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *areaSource;

- (NSMutableSet*)areaSourceSet;

@property (nonatomic, strong) NSSet *armorUse;

- (NSMutableSet*)armorUseSet;

@property (nonatomic, strong) NSSet *comboFirst;

- (NSMutableSet*)comboFirstSet;

@property (nonatomic, strong) NSSet *comboSecond;

- (NSMutableSet*)comboSecondSet;

@property (nonatomic, strong) NSSet *comboThird;

- (NSMutableSet*)comboThirdSet;

@property (nonatomic, strong) NSSet *decorationUse;

- (NSMutableSet*)decorationUseSet;

@property (nonatomic, strong) NSSet *monsterSource;

- (NSMutableSet*)monsterSourceSet;

@property (nonatomic, strong) NSSet *questSource;

- (NSMutableSet*)questSourceSet;

@property (nonatomic, strong) Trade *tradeIn;

//- (BOOL)validateTradeIn:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) Trade *tradeOut;

//- (BOOL)validateTradeOut:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *weaponUse;

- (NSMutableSet*)weaponUseSet;

@end

@interface _Item (AreaSourceCoreDataGeneratedAccessors)
- (void)addAreaSource:(NSSet*)value_;
- (void)removeAreaSource:(NSSet*)value_;
- (void)addAreaSourceObject:(AreaDrop*)value_;
- (void)removeAreaSourceObject:(AreaDrop*)value_;

@end

@interface _Item (ArmorUseCoreDataGeneratedAccessors)
- (void)addArmorUse:(NSSet*)value_;
- (void)removeArmorUse:(NSSet*)value_;
- (void)addArmorUseObject:(Armor*)value_;
- (void)removeArmorUseObject:(Armor*)value_;

@end

@interface _Item (ComboFirstCoreDataGeneratedAccessors)
- (void)addComboFirst:(NSSet*)value_;
- (void)removeComboFirst:(NSSet*)value_;
- (void)addComboFirstObject:(Combination*)value_;
- (void)removeComboFirstObject:(Combination*)value_;

@end

@interface _Item (ComboSecondCoreDataGeneratedAccessors)
- (void)addComboSecond:(NSSet*)value_;
- (void)removeComboSecond:(NSSet*)value_;
- (void)addComboSecondObject:(Combination*)value_;
- (void)removeComboSecondObject:(Combination*)value_;

@end

@interface _Item (ComboThirdCoreDataGeneratedAccessors)
- (void)addComboThird:(NSSet*)value_;
- (void)removeComboThird:(NSSet*)value_;
- (void)addComboThirdObject:(Combination*)value_;
- (void)removeComboThirdObject:(Combination*)value_;

@end

@interface _Item (DecorationUseCoreDataGeneratedAccessors)
- (void)addDecorationUse:(NSSet*)value_;
- (void)removeDecorationUse:(NSSet*)value_;
- (void)addDecorationUseObject:(Decoration*)value_;
- (void)removeDecorationUseObject:(Decoration*)value_;

@end

@interface _Item (MonsterSourceCoreDataGeneratedAccessors)
- (void)addMonsterSource:(NSSet*)value_;
- (void)removeMonsterSource:(NSSet*)value_;
- (void)addMonsterSourceObject:(MonsterDrop*)value_;
- (void)removeMonsterSourceObject:(MonsterDrop*)value_;

@end

@interface _Item (QuestSourceCoreDataGeneratedAccessors)
- (void)addQuestSource:(NSSet*)value_;
- (void)removeQuestSource:(NSSet*)value_;
- (void)addQuestSourceObject:(QuestDrop*)value_;
- (void)removeQuestSourceObject:(QuestDrop*)value_;

@end

@interface _Item (WeaponUseCoreDataGeneratedAccessors)
- (void)addWeaponUse:(NSSet*)value_;
- (void)removeWeaponUse:(NSSet*)value_;
- (void)addWeaponUseObject:(Weapon*)value_;
- (void)removeWeaponUseObject:(Weapon*)value_;

@end

@interface _Item (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSMutableSet*)primitiveAreaSource;
- (void)setPrimitiveAreaSource:(NSMutableSet*)value;

- (NSMutableSet*)primitiveArmorUse;
- (void)setPrimitiveArmorUse:(NSMutableSet*)value;

- (NSMutableSet*)primitiveComboFirst;
- (void)setPrimitiveComboFirst:(NSMutableSet*)value;

- (NSMutableSet*)primitiveComboSecond;
- (void)setPrimitiveComboSecond:(NSMutableSet*)value;

- (NSMutableSet*)primitiveComboThird;
- (void)setPrimitiveComboThird:(NSMutableSet*)value;

- (NSMutableSet*)primitiveDecorationUse;
- (void)setPrimitiveDecorationUse:(NSMutableSet*)value;

- (NSMutableSet*)primitiveMonsterSource;
- (void)setPrimitiveMonsterSource:(NSMutableSet*)value;

- (NSMutableSet*)primitiveQuestSource;
- (void)setPrimitiveQuestSource:(NSMutableSet*)value;

- (Trade*)primitiveTradeIn;
- (void)setPrimitiveTradeIn:(Trade*)value;

- (Trade*)primitiveTradeOut;
- (void)setPrimitiveTradeOut:(Trade*)value;

- (NSMutableSet*)primitiveWeaponUse;
- (void)setPrimitiveWeaponUse:(NSMutableSet*)value;

@end
