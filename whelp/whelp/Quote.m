//
//  Quote.m
//  whelp
//
//  Created by Kenneth Cooke on 9/6/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

#import "Quote.h"
#import "DataStore.h"

@implementation Quote


-(instancetype)init {
    
    return [self initWithOriginalQuote:@""];
    
}

-(instancetype)initWithOriginalQuote:(NSString *)quote {
    
    self = [super init];
    if (self) {
        
        _originalQuote = quote;
        _whelpedQuote = @"";
        
    }
    
    return self;
    
}

-(void)whelpQuote:(Quote *)quote {
    
    DataStore *dataStore = [DataStore sharedInstance];
    
    NSMutableArray *sentenceAsArray = [[quote.originalQuote componentsSeparatedByString:@" "]mutableCopy];
    
    NSMutableArray *whelpedArray = [@[]mutableCopy];
    
    for (NSString *word in sentenceAsArray) {
        
        if ([word hasSuffix:@"ing"] || [word hasSuffix:@"ing."]) {
            
            NSString *randomParticiple = [dataStore getRandomParticiple];
            NSLog(@"TRYS TO INSERT:%@", randomParticiple );
            
            [whelpedArray insertObject:randomParticiple atIndex:[sentenceAsArray indexOfObject:word]];
            
        } else {
            
            [whelpedArray insertObject: word atIndex:[sentenceAsArray indexOfObject:word]];
            
        }
    }
    
    NSString *whelpedString = [whelpedArray componentsJoinedByString:@" "];
    
    quote.whelpedQuote = whelpedString;
    
    NSLog(@"%@", whelpedString);
}

@end
