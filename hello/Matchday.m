//
//  Matchday.m
//  hello
//
//  Created by Roberto Rey Magaña on 22/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Matchday.h"

@implementation Matchday


- (NSUInteger) getSize{
    
    return self.matches.count;
    
}
- (Match *) getMatch: (int) index{
    
    return self.matches[index];
    
}


@end
