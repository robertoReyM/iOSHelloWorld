//
//  Declarations.h
//  hello
//
//  Created by Roberto Rey Magaña on 21/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "League.h"


#define nArrayTeamNames             @"Santos,Veracruz,Morelia,Toluca,América,León,Puebla,Tijuana,Tigres,Atlas,Pachuca,Cruz Azul,Chiapas,Guadalajara,Pumas,Querétaro,Leones Negros,Monterrey"

//States
#define nPools              0
#define nPositions          1
#define nTable              2
#define nHistory            3
#define nRules              4
#define nNotifications      5
#define nSettings           6
#define nTicket             7
#define nProfile            8
#define nEditCard           9
#define nAbout              10
#define nSupport            11
#define nOtherUserTicket    12

//array variables
extern NSMutableArray *maTeams;

//data variables
extern League *mLeague;


//States
extern  unsigned int        mMenuState;
//-------------------------------------------------------------------------------


@interface Declarations : NSObject


@end
