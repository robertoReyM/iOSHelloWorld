//
//  League.h
//  hello
//
//  Created by Roberto Rey Magaña on 22/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Matchday.h"

@interface League : NSObject


//properties
@property (nonatomic) int currentMatchday;
@property (nonatomic) int inProgressMatchday;
@property (nonatomic) BOOL responseStatus;
@property (nonatomic, strong) NSMutableArray *matchdays;


//public methods
- (Matchday *) getMatchday: (int) index;
- (int) getSize;
- (int) getCurrentMatchdayIndex;

@end
