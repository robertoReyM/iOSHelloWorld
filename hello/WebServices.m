//
//  WebServices.m
//  hello
//
//  Created by Roberto Rey Magaña on 22/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WebServices.h"


/**********************************************************************************************/
#pragma mark - Definitions
/**********************************************************************************************/

//urls
#define nurlGetAllMatchdays             @"http://qc.api.smartplace.mx/index.php/get/all/matchdays"

//timestamp
#define nTimeStamp [NSString stringWithFormat:@"%lu",(long)[[NSDate date] timeIntervalSince1970] * 1]


@implementation WebServices

/**********************************************************************************************/
#pragma mark - Web services methods
/**********************************************************************************************/
+ (void)getAllMatchdays
{
    
    //get timestamp
    NSString    *strTimestamp = nTimeStamp;
    
    //init data dictionary
    NSMutableDictionary *diGetAllMatchdays = [[NSMutableDictionary alloc]init];
    
    //add parameters to dictionary
    [diGetAllMatchdays setValue:strTimestamp forKey:@"timestamp"];
    
    //convert to json string
    NSString  *dataGetAllMatchdays = [diGetAllMatchdays JSONRepresentation];
    
    //send post
    NSDictionary * jsonGetAllMatchdays = [self sendPost:nurlGetAllMatchdays forData:dataGetAllMatchdays];
    
    if(jsonGetAllMatchdays !=nil){
        
        //save in memory
        [MemoryServices setAllMatchdays:jsonGetAllMatchdays];
    
        //parse data into global variable
        [ParserHelper parseGetAllMatchdays];
    
    }
    
}


/**********************************************************************************************/
#pragma mark - common method
/**********************************************************************************************/

+ (NSDictionary *) sendPost:(NSString *) postUrl forData:(NSString *) data
{
    @try
    {
        NSString *post = [[NSString alloc] initWithFormat:@"data=%@", data];
        NSLog(@"post parameters: %@",post);
        NSURL *url = [NSURL URLWithString:postUrl];
        NSLog(@"URL post = %@", url);
        NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"iOS QC 1.0" forHTTPHeaderField:@"User-Agent"];
        [request setHTTPBody:postData];
        [NSURLRequest requestWithURL:url];
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        //Check response
        if ([response statusCode] >=200 && [response statusCode] <300)
        {
            //get json response
            NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:urlData options:kNilOptions error:&error];
            NSLog(@"response received %@",jsonResponse);
        
            //return response
            return jsonResponse;
            
        }
        else { if (error) { NSLog(@"Error response");return nil; } else { NSLog(@"Conect Fail");return nil;}
            return nil;
        }
    }
    @catch (NSException * e) { NSLog(@"Exception"); return nil;}
}


/**********************************************************************************************/
#pragma mark - alloc
/**********************************************************************************************/
+ (id)alloc {
    [NSException raise:@"Cannot be instantiated!" format:@"Static class 'ClassName' cannot be instantiated!"];
    return nil;
}

@end
