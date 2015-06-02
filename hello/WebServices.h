//
//  WebServices.h
//  hello
//
//  Created by Roberto Rey Magaña on 22/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#ifndef hello_WebServices_h
#define hello_WebServices_h


#import "SBJson.h"
#import "ObjectMapper.h"
#import "Declarations.h"
#import "ParserHelper.h"
#import "MemoryServices.h"


@interface WebServices : NSObject

//Methods declarations
+ (void) getAllMatchdays;


@end

#endif
