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

@interface NewsListTableViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate, NSXMLParserDelegate>

@property(nonatomic, strong) Host *newsHost;
    

@property (strong, nonatomic) IBOutlet UITableView *rssFeed;

@end

