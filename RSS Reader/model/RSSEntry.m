//
//  RSSEntry.m
//  RSS Reader
//
//  Created by Vladan Randjelovic on 31/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import "RSSEntry.h"

@implementation RSSEntry

@synthesize hostTitle = _hostTitle;
@synthesize articleTitle = _articleTitle;
@synthesize articleUrl = _articleUrl;
@synthesize articleDate = _articleDate;

- (id)initWithHostTitle:(NSString*)hostTitle articleTitle:(NSString*)articleTitle articleUrl:(NSString*)articleUrl articleDate:(NSDate*)articleDate
{
    if ((self = [super init])) {
        _hostTitle = [hostTitle copy];
        _articleTitle = [articleTitle copy];
        _articleUrl = [articleUrl copy];
        _articleDate = [articleDate copy];
    }
    return self;
}

- (void)dealloc {
    _hostTitle = nil;
    _articleTitle = nil;
    _articleUrl = nil;
    _articleDate = nil;
}

@end
