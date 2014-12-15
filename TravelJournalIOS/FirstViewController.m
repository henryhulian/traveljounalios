//
//  FirstViewController.m
//  TravelJournalIOS
//
//  Created by hulian on 12/15/14.
//  Copyright (c) 2014 TravelJournal. All rights reserved.
//

#import "FirstViewController.h"
#import "ServiceDelegate.h"

@interface FirstViewController ()
- (IBAction)createJournal:(id)sender;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createJournal:(id)sender {
    [couchbaseService createJournal:@"journal"];
}
@end
