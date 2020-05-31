//
//  NewsListTableViewController.m
//  RSS Reader
//
//  Created by Vladan Randjelovic on 30/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import "NewsListTableViewController.h"

@interface NewsListTableViewController () {
    
    NSXMLParser *parser;
    NSMutableArray *news;
    NSMutableDictionary *newsItem;
    NSMutableString *newsTitle;
    NSMutableString *newsLink;
    NSString *element;

}

@end

@implementation NewsListTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    news = [[NSMutableArray alloc] init];
    NSURL *hostURl = [NSURL URLWithString:_newsHost.hostURL];
    
    parser = [[NSXMLParser alloc] initWithContentsOfURL:hostURl];
    [parser setDelegate:self];
    [parser setShouldResolveExternalEntities:NO];
    [parser parse];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return news.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCell" forIndexPath:indexPath];
//    if (cell.textLabel.tag == 0) {
        cell.textLabel.text = [[news objectAtIndex:indexPath.row] objectForKey:@"title"];
//    }
//    if (cell.textLabel.tag == 1) {
//        cell.textLabel.text = [[news objectAtIndex:indexPath.row] objectForKey:@"description"];
//    }
        
    return cell;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    
    element = elementName;
    if ([elementName isEqualToString:@"item"]) {
        newsItem = [[NSMutableDictionary alloc] init];
        newsTitle = [[NSMutableString alloc] init];
        newsLink = [[NSMutableString alloc] init];
    }
    
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"item"]) {
        [newsItem setObject:newsTitle forKey:@"title"];
        [newsItem setObject:newsLink forKey:@"link"];
        
        [news addObject:[newsItem copy]];
    }
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if ([element isEqualToString:@"title"]) {
        [newsTitle appendString:string];
    } else if ([element isEqualToString:@"link"]) {
        [newsLink appendString:string];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser {

    [self.rssFeed reloadData];
}

@end
