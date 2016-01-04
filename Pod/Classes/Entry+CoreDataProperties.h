//
//  Entry+CoreDataProperties.h
//  Pods
//
//  Created by thanhhaitran on 12/31/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Entry.h"

NS_ASSUME_NONNULL_BEGIN

@interface Entry (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *key;
@property (nullable, nonatomic, retain) NSData *value;

@end

NS_ASSUME_NONNULL_END
