//
//  ViewController.h
//  RSS Reader
//
//  Created by Vladan Randjelovic on 30/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Host.h"

@interface MainViewController : UIViewController <UITableViewDataSource,UITableViewDelegate> {
    
    NSMutableArray<Host*> *hosts;
}

@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UITableView *hostTable;

- (IBAction)goToFeeds:(id)sender;

@end

