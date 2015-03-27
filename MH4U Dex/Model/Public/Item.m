#import "Item.h"

@interface Item ()

- (NSString *)firstLetter;

@end

@implementation Item

- (NSString *)firstLetter
{
    return [self.name substringToIndex:1];
}

@end
