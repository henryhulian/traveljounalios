//
//  CouchbaseService.h
//  TravelJournalAppleCore
//
//  Created by hulian on 12/15/14.
//  Copyright (c) 2014 TravelJournal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CouchbaseLite/CouchbaseLite.h>

@interface CouchbaseService : NSObject

// shared manager
@property (strong, nonatomic) CBLManager *manager;
// the database
@property (strong, nonatomic) CBLDatabase *database;


@property CBLReplication *journalDBPush;

@end
