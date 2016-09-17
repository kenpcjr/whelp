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
    
    for (NSUInteger i = 0; i < sentenceAsArray.count; i++) {
        
        NSString *word = sentenceAsArray[i];
        
        if ([word hasSuffix:@"ing"] || [word hasSuffix:@"ing."]) {
            
            NSString *randomParticiple = [dataStore getRandomParticiple];
            NSLog(@"TRYS TO INSERT:%@", randomParticiple );
            
            [whelpedArray insertObject:randomParticiple atIndex:i];
            
        } else if ((i > 0 && [sentenceAsArray[i - 1] isEqualToString:@"a"]) || (i > 0 && [sentenceAsArray[i - 1] isEqualToString:@"the"])){
            
            NSString *randomNoun = [dataStore getRandomNoun];
        
            [whelpedArray insertObject: randomNoun atIndex:i];
        
        
        } else {
            
            [whelpedArray insertObject: word atIndex:i];
            
        }
    }
    
    NSString *whelpedString = [whelpedArray componentsJoinedByString:@" "];
    
    quote.whelpedQuote = whelpedString;
    
    NSLog(@"%@", whelpedString);
}

@end
