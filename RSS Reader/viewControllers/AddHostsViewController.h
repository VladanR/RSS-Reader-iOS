//
//  AddHostsViewController.h
//  RSS Reader
//
//  Created by Vladan Randjelovic on 30/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Host.h"

@interface AddHostsViewController : UIViewController

@property (nonatomic) Host *host;
@property (weak, nonatomic) IBOutlet UITextField *hostNameTF;
@property (weak, nonatomic) IBOutlet UITextField *hostURLTF;

- (IBAction)saveHost:(id)sender;

@end
