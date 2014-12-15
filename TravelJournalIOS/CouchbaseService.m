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
        
        NSURL* serverDbURL = [NSURL URLWithString: SYNC_DB_URL];
        _journalDBPush = [_database createPushReplication: serverDbURL];
        _journalDBPull = [_database createPullReplication: serverDbURL];
        
        _journalDBPull.continuous = _journalDBPush.continuous = YES;
        
        id<CBLAuthenticator> auth;
        auth = [CBLAuthenticator basicAuthenticatorWithName: @"test001"
                                                   password: @"111111"];
        _journalDBPush.authenticator = _journalDBPull.authenticator = auth;
        
        
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(replicationChanged)
                                                     name: kCBLReplicationChangeNotification
                                                   object: _journalDBPush];
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(replicationChanged)
                                                     name: kCBLReplicationChangeNotification
                                                   object: _journalDBPull];
        
        [_journalDBPush start];
        [_journalDBPull start];
        
    }
    return self;
}

- (void)replicationChanged{
    NSLog(@"replication changed!");
}

//创建旅游日志
- (void)createJournal:(NSString *)journalName{
    
    NSError *__autoreleasing *error;
    
    CBLDocument *journal = [_database documentWithID:journalName];
    
    NSDictionary *updatedProperts = [[NSDictionary alloc] init];
    [updatedProperts setValue:@"test001" forKey:@"username"];
    //[updatedProperts setValue: forKey:<#(NSString *)#>]
    [journal putProperties:updatedProperts error:error];
    
    
}

//保存旅游日志节点
- (void)recordJournalNode{
    
}

@end
