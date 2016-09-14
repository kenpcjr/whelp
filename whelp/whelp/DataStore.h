//
//  DataStore.h
//  whelp
//
//  Created by Kenneth Cooke on 9/5/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuotesAPI.h"
@class Quote;


@interface DataStore : NSObject

@property (strong, nonatomic) NSArray *nouns;
@property (strong, nonatomic) NSArray *adjectives;
@property (strong, nonatomic) NSArray *verbs;
@property (strong, nonatomic) NSArray *pastParticiple;
@property (strong, nonatomic) Quote *quote;

+ (instancetype)sharedInstance;

-(void)loadLameWords;

-(void)getRandomQuoteWith:(void (^)())completion;

-(NSString*)getRandomParticiple;

@end
