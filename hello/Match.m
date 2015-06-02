//
//  Match.m
//  hello
//
//  Created by Roberto Rey Magaña on 22/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Match.h"

@implementation Match

- (void) calculatePercentages:(int *)pLocal forDraw: (int *)pDraw forAway: (int *)pAway{
    
    //sum up count
    int iSum  = self.homePoolCount + self.drawPoolCount + self.awayPoolCount;
    int iDif = 0;
    
    //check if count goes more than zero
    if (iSum > 0)
    {
        //calculate percentages
        *pLocal  = (int)((self.homePoolCount * 100)/iSum);
        *pDraw   = (int)((self.drawPoolCount * 100)/iSum);
        *pAway   = (int)((self.awayPoolCount * 100)/iSum);
        
        //sum percentages
        iDif     = *pLocal + *pDraw + *pAway;
        
        //check if it goes to 100%
        if (iDif != 100)
        {
            //complete 100% on local
            *pLocal = *pLocal + 100 - iDif;
        }
        
    }
    else
    {
        //init values
        *pLocal = 34;
        *pDraw  = 33;
        *pAway  = 33;
        
    }
    
}

@end
