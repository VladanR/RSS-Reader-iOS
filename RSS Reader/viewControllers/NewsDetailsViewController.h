//
//  NewsDetailsViewController.h
//  RSS Reader
//
//  Created by Vladan Randjelovic on 30/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RSSEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailsViewController : UIViewController

@property(nonatomic,strong) RSSEntry *newsEntry;
@property (weak, nonatomic) IBOutlet UILabel *newsLink;
@property (weak, nonatomic) IBOutlet UITextView *newsDescription;

@end

NS_ASSUME_NONNULL_END
