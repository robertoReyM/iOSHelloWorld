//
//  Matchday.h
//  hello
//
//  Created by Roberto Rey Magaña on 22/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Match.h"

#define nMatchdayOpen      1

@interface Matchday : NSObject

//properties
@property (nonatomic) int mdID;
@property (nonatomic) int open;
@property (nonatomic) int active;
@property (nonatomic, strong) NSString *mdName;
@property (nonatomic, strong) NSMutableArray *matches;

//public methods
- (Match *) getMatch: (int) index;
- (NSUInteger) getSize;

@end
