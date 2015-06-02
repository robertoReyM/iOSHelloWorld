//
//  Match.h
//  hello
//
//  Created by Roberto Rey Magaña on 22/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <Foundation/Foundation.h>


#define nMatchScheduled     0
#define nMatchLive          1
#define nMatchFinished      2

@interface Match : NSObject


//properties
@property (nonatomic) int awayID;
@property (nonatomic) int awayPoolCount;
@property (nonatomic) int awayScore;
@property (nonatomic) int drawPoolCount;
@property (nonatomic) int homeID;
@property (nonatomic) int homePoolCount;
@property (nonatomic) int homeScore;
@property (nonatomic) int leagueID;
@property (nonatomic) int mID;
@property (nonatomic) int minute;
@property (nonatomic) int result;
@property (nonatomic) int status;
@property (nonatomic,strong) NSString * date;
@property (nonatomic,strong) NSString * time;
@property (nonatomic,strong) NSString * currentState;
@property (nonatomic,strong) NSMutableArray * events;

- (void) calculatePercentages:(int *)pLocal forDraw: (int *)pDraw forAway: (int *)pAway;
@end
