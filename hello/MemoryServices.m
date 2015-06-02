//
//  MemoryServices.m
//  hello
//
//  Created by Roberto Rey Magaña on 22/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemoryServices.h"


@implementation MemoryServices


/**********************************************************************************************/
#pragma mark - Memory services methods
/**********************************************************************************************/

+(void)setAllMatchdays:(NSDictionary *)stAllMatchdaysData{
    
    
    NSUserDefaults *userDefaults       = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject: stAllMatchdaysData forKey: pjsonGetAllMatchdaysData];
    [userDefaults synchronize];

}
//----------------------------------------------------------------------------------------------

+(NSDictionary *)getAllMatchdays{
    
    NSUserDefaults *userDefaults       = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:pjsonGetAllMatchdaysData];
}

/**********************************************************************************************/
#pragma mark - alloc
/**********************************************************************************************/
+ (id)alloc {
    [NSException raise:@"Cannot be instantiated!" format:@"Static class 'ClassName' cannot be instantiated!"];
    return nil;
}

@end