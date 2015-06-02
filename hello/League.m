//
//  League.m
//  hello
//
//  Created by Roberto Rey Magaña on 22/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "League.h"

@implementation League


- (int) getSize{
    
    return (int)[self.matchdays count];
    
}
- (Matchday *) getMatchday: (int) index{
    
    return self.matchdays[index];
    
}

- (int) getCurrentMatchdayIndex{
    
    //get array size
    int size = (int)self.matchdays.count;
    
    //go though all matchdays
    for (int i = 0; i< size ; i++) {
        
        //get matchday
        Matchday * matchday = [self getMatchday:i];
        
        if(matchday.mdID == self.currentMatchday){
            
            return i;
        }
    }
    return 0;
}
@end
