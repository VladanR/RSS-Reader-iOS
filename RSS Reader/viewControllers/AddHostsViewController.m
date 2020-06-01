//
//  AddHostsViewController.m
//  RSS Reader
//
//  Created by Vladan Randjelovic on 30/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import "AddHostsViewController.h"
#import "MainViewController.h"

@interface AddHostsViewController ()

@end

@implementation AddHostsViewController

@synthesize host;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    host = [[Host alloc] init];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveHost:(id)sender {
    NSDate *today = [NSDate date];
       NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
       [dateFormat setDateFormat:@"dd.MM.yyyy"];
       NSString *dateString = [dateFormat stringFromDate:today];
    
    if ([self checkTextfields]) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [host setHostName:self.hostNameTF.text];
        [host setHostURL:self.hostURLTF.text];
        [host setDateAdded:dateString];

        NSData *hostData = [NSKeyedArchiver archivedDataWithRootObject:host requiringSecureCoding:NO error:nil];
        [userDefaults setObject:hostData forKey:@"host"];
        [userDefaults synchronize];
    }
    [self performSegueWithIdentifier:@"toHostList" sender:self];
//    NewsListTableViewController *newsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"newsFeed"];
//    [self.navigationController pushViewController:newsViewController animated:NO];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"toHostList"]) {
        MainViewController * mainVC = segue.destinationViewController;
        // This is how you will pass the object or data you want for the next view
        [self addAndSaveHosts:host];
        mainVC.host = host;
    }

}

-(BOOL)checkTextfields {
    NSURL *validationURL = [NSURL URLWithString:self.hostURLTF.text];
   
    if ([self.hostNameTF.text isEqual:NULL] || [self.hostNameTF.text isEqualToString:@""]) {
        
        [self.hostNameTF setPlaceholder:@"This field can't be empty!"];
        return NO;
    } else if ([self.hostURLTF.text isEqual:NULL] || [self.hostURLTF.text isEqualToString:@""]) {
        
        [self.hostURLTF setPlaceholder:@"This field can't be empty!"];
        return NO;
    } else if(![validationURL scheme] && ![validationURL host]) {
        [self.hostURLTF setText:@"Host URL is not valid!"];
        self.hostURLTF.textColor = [UIColor redColor];
        return NO;
    } else {
        return YES;
    }
}

-(void)addAndSaveHosts:(Host *) host {
    NSMutableArray *hosts = [[NSMutableArray alloc] init];
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [hosts addObject:host];
    NSData *hostsData = [NSKeyedArchiver archivedDataWithRootObject:hosts requiringSecureCoding:NO error:nil];
    [userDef setObject:hostsData forKey:@"hostsAdded"];
    [userDef synchronize];
    
}

@end
