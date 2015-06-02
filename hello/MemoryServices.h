//
//  MemoryServices.h
//  hello
//
//  Created by Roberto Rey Magaña on 22/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#ifndef hello_MemoryServices_h
#define hello_MemoryServices_h



#define pjsonGetAllMatchdaysData              @"pjsonGetAllMatchdaysData"


@interface MemoryServices : NSObject

+ (NSDictionary*) getAllMatchdays;
+ (void) setAllMatchdays:(NSDictionary*)stAllMatchdaysData;

@end


#endif
