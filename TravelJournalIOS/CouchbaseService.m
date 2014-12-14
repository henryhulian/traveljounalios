//
//  CouchbaseService.m
//  TravelJournalAppleCore
//
//  Created by hulian on 12/15/14.
//  Copyright (c) 2014 TravelJournal. All rights reserved.
//

#import "CouchbaseService.h"

@implementation CouchbaseService


+ (instancetype)init
{
    return nil;
}

- (void) initDB{
    _manager = [CBLManager sharedInstance];
    if (!_manager) {
        NSLog (@"Cannot create shared instance of CBLManager");
    }
    
    NSLog (@"Manager created");
}

@end
