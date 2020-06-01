//
//  RSSEntry.h
//  RSS Reader
//
//  Created by Vladan Randjelovic on 31/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RSSEntry : NSObject {
    NSString *_hostTitle;
    NSString *_articleTitle;
    NSString *_articleUrl;
    NSString *_articleDescription;
    NSString *_fullArticle;
    NSDate *_articleDate;
}

@property (copy) NSString *hostTitle;
@property (copy) NSString *articleTitle;
@property (copy) NSString *articleUrl;
@property (copy) NSDate *articleDate;
@property (copy) NSString *articleDescription;
@property (copy) NSString *fullArticle;

- (id)initWithHostTitle:(NSString*)hostTitle articleTitle:(NSString*)articleTitle articleUrl:(NSString*)articleUrl articleDate:(NSDate*)articleDate articleDescription:(NSString *)articleDescription andFullArticle:(NSString *) fullArticle;

@end
