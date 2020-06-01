//
//  NewsListTableViewController.h
//  RSS Reader
//
//  Created by Vladan Randjelovic on 30/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Host.h"
#import "HostAndNewsCell.h"
#import "RSSEntry.h"
#import "NewsDetailsViewController.h"

@interface NewsListTableViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate, NSXMLParserDelegate>

@property(nonatomic, strong) Host *newsHost;
@property(nonatomic,strong) RSSEntry *newsEntry;

@property (strong, nonatomic) IBOutlet UITableView *rssFeed;
- (IBAction)goToDetails:(id)sender;

@end

