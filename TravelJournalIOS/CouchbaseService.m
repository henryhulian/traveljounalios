//
//  CouchbaseService.m
//  TravelJournalAppleCore
//
//  Created by hulian on 12/15/14.
//  Copyright (c) 2014 TravelJournal. All rights reserved.
//

#import "CouchbaseService.h"

@implementation CouchbaseService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _manager = [CBLManager sharedInstance];
        if (!_manager) {
            NSLog (@"Cannot create shared instance of CBLManager");
        }
        
        NSLog (@"Manager created");
        
        NSError *error;
        
        // create a name for the database and make sure the name is legal
        NSString *dbname = @"journals";
        if (![CBLManager isValidDatabaseName: dbname]) {
            NSLog (@"Bad database name");
        }
        
        // create a new database
        _database = [_manager databaseNamed: dbname error: &error];
        if (!_database) {
            NSLog (@"Cannot create database. Error message: %@",
                   error.localizedDescription);
        }
        
        // log the database location
        NSString *databaseLocation =
        [[[[NSBundle mainBundle] bundlePath] stringByDeletingLastPathComponent]
         stringByAppendingString: @"/Library/Application Support/CouchbaseLite"];
        NSLog(@"Database %@ created at %@", dbname,
              [NSString stringWithFormat:@"%@/%@%@", databaseLocation, dbname, @".cblite"]);
    }
    return self;
}


@end
