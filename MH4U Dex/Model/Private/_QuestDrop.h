// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to QuestDrop.h instead.

#import <CoreData/CoreData.h>

extern const struct QuestDropRelationships {
	__unsafe_unretained NSString *quest;
} QuestDropRelationships;

@class Quest;

@interface QuestDropID : NSManagedObjectID {}
@end

@interface _QuestDrop : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) QuestDropID* objectID;

@property (nonatomic, strong) Quest *quest;

//- (BOOL)validateQuest:(id*)value_ error:(NSError**)error_;

@end

@interface _QuestDrop (CoreDataGeneratedPrimitiveAccessors)

- (Quest*)primitiveQuest;
- (void)setPrimitiveQuest:(Quest*)value;

@end
