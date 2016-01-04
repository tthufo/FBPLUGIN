//
//  Entry.h
//  Pods
//
//  Created by thanhhaitran on 12/31/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface Entry : NSManagedObject

+ (void)addValue:(id)value andKey:(NSString*)key;

+ (id)getValue:(NSString*)key;

+ (void)removeValue:(NSString*)key;

+ (NSArray *)getFormat:(NSString *)format argument:(NSArray *)argument;

@end

NS_ASSUME_NONNULL_END

#import "Entry+CoreDataProperties.h"
