//
//  Host.h
//  RSS Reader
//
//  Created by  Vladan Randjelovic on 31/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Host : NSObject <NSCoding>
    
@property (nonatomic, strong) NSString *hostName;
@property (nonatomic, strong) NSString *dateAdded;
@property (nonatomic, strong) NSString *hostURL;


@end

