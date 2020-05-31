//
//  Host.m
//  RSS Reader
//
//  Created by Vladan Randjelovic on 31/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import "Host.h"

@implementation Host

@synthesize hostName;
@synthesize hostURL;
@synthesize dateAdded;



- (void)encodeWithCoder:(nonnull NSCoder *)encoder {
    [encoder encodeObject:hostName forKey:@"hostName"];
    [encoder encodeObject:hostURL forKey:@"hostUrl"];
    [encoder encodeObject:dateAdded forKey:@"date"];
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)decoder {
    if (self = [super init]) {
        self.hostName = [decoder decodeObjectForKey:@"hostName"];
        self.hostURL = [decoder decodeObjectForKey:@"hostUrl"];
        self.dateAdded = [decoder decodeObjectForKey:@"date"];
    }
    return self;
}

@end
