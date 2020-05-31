//
//  ViewController.m
//  RSS Reader
//
//  Created by Vladan Randjelovic on 30/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

NSUserDefaults *userDef;
Host *host;

- (void)viewDidLoad {
    [super viewDidLoad];
    userDef = [NSUserDefaults standardUserDefaults];
    NSData *hostData = [userDef objectForKey:@"host"];
    host = [NSKeyedUnarchiver unarchivedObjectOfClass:Host.class fromData:hostData error:nil];
    hosts = [NSMutableArray array];
    if (host) {
        [hosts addObject:host];
    }
    
    if (hosts != nil && hosts.count > 0) {
        [_hostTable setHidden:NO];
    }
    // Do any additional setup after loading the view.
}


- (IBAction)goToFeeds:(id)sender {
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return hosts.count;
}






@end
