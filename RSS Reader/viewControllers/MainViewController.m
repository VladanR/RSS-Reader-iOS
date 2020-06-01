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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.hostTable.allowsMultipleSelectionDuringEditing = NO;
    userDef = [NSUserDefaults standardUserDefaults];
    NSData *savedHosts = [userDef objectForKey:@"hostsAdded"];
    hosts = [NSMutableArray array];

    if (savedHosts && hosts == nil) {
        hosts = [self getSavedHosts];
    }
//    } else {
//    }
    if (_host) {
        [self addAndSaveHosts:_host];
    }
    
    if (hosts != nil && hosts.count > 0) {
        [_hostTable setHidden:NO];
    }
    [self.hostTable setDelegate:self];
    [self.hostTable setDataSource:self];
    [self.hostTable reloadData];
    // Do any additional setup after loading the view.
}


- (IBAction)goToFeeds:(id)sender {
    [self performSegueWithIdentifier:@"toFeed" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toFeed"]) {
        NewsListTableViewController * newsVC = segue.destinationViewController;
        // This is how you will pass the object or data you want for the next view
        newsVC.newsHost = self.host;
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return hosts.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    HostAndNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hostCell" forIndexPath:indexPath];
    cell.titleLabel.text = [[hosts objectAtIndex:indexPath.row] hostName];
    cell.descriptionLabel.text = [[hosts objectAtIndex:indexPath.row] dateAdded];
    return cell;
}

-(void)addAndSaveHosts:(Host *) host {
    
    [hosts addObject:host];
    NSData *hostsData = [NSKeyedArchiver archivedDataWithRootObject:hosts requiringSecureCoding:NO error:nil];
    [userDef setObject:hostsData forKey:@"hostsAdded"];
    [userDef synchronize];
    
}

-(NSMutableArray *)getSavedHosts {
    
    NSData *savedHosts = [userDef objectForKey:@"hostsAdded"];
    NSMutableArray *hostsFromData = [NSKeyedUnarchiver unarchivedObjectOfClass:NSMutableArray.class fromData:savedHosts error:nil];
    return hostsFromData;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [hosts removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
}


@end
