//
//  Parser.m
//  hello
//
//  Created by Roberto Rey Magaña on 24/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "ParserHelper.h"

@implementation ParserHelper


/**********************************************************************************************/
#pragma mark - Parser methods
/**********************************************************************************************/

+ (void)parseGetAllMatchdays
{
    //get local all matchdays
    NSDictionary * jsonGetAllMatchdays = [MemoryServices getAllMatchdays];
    //NSLog(@"parsing all matchdays%@", jsonGetAllMatchdays);
    
    //check for valid value
    if(jsonGetAllMatchdays!=nil){
        
        // Using ObjectMapper Directly
        ObjectMapper *mapper = [[ObjectMapper alloc] init];
        mLeague = [mapper objectFromSource:jsonGetAllMatchdays toInstanceOfClass:[League class]];
    }
    
}

/**********************************************************************************************/
#pragma mark - alloc
/**********************************************************************************************/
+ (id)alloc {
    [NSException raise:@"Cannot be instantiated!" format:@"Static class 'ClassName' cannot be instantiated!"];
    return nil;
}

@end
