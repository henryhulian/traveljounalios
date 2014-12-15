//
//  ServiceDelegate.h
//  TravelJournalIOS
//
//  Created by hulian on 12/16/14.
//  Copyright (c) 2014 TravelJournal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CouchbaseService.h"

@interface ServiceDelegate : NSObject
+ (void)initServices;
@end

CouchbaseService *couchbaseService;

