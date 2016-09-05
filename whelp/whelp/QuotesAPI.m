//
//  QuotesAPI.m
//  whelp
//
//  Created by Kenneth Cooke on 9/5/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

#import "QuotesAPI.h"

@implementation QuotesAPI

+(void)getRandomQuote {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSDictionary *parameters = @{@"method" : @"getQuote", @"format" : @"json", @"key" : @"123456", @"lang" :@"en"};
    
   // NSURL *forismaticURL = [NSURL URLWithString:@"http://api.forismatic.com/api/1.0/"];
    NSURLRequest *quoteRequest = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString: @"http://api.forismatic.com/api/1.0/" parameters:parameters error:nil];
    
    NSURLSessionTask *getQuote = [manager dataTaskWithRequest:quoteRequest completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        
        if (error) {
            
            NSLog(@"ERROR: %@", error);
            
        } else {
            
            NSLog(@"%@, %@", response, responseObject);
            
        }
        
        
    }];
    
    [getQuote resume];
    
}

@end


