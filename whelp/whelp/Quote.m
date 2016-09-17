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
    
    NSMutableArray *sentenceAsArray = [[quote.originalQuote componentsSeparatedByString:@" "] mutableCopy];
    
    [self removeTrailingSpaces:sentenceAsArray];
    
    NSMutableString *whelpedString = [self replacePartsOfSpeechFrom:sentenceAsArray
                                                     UsingDataStore:dataStore];
    
    [self ensurePunctuation:whelpedString];
    
    quote.whelpedQuote = whelpedString;
    
    // NSLog(@"%@", whelpedString);
}

-(void)removeTrailingSpaces:(NSMutableArray *)array {
    
    while ([array.lastObject isEqualToString:@""]) {
        
        [array removeLastObject];
        
    }
    
    NSLog(@"%@", array);
    
}

-(NSMutableString *)replacePartsOfSpeechFrom:(NSMutableArray *)originalarray UsingDataStore:(DataStore *)dataStore {
    
    NSMutableArray *whelpedArray = [@[]mutableCopy];
    
    for (NSUInteger i = 0; i < originalarray.count; i++) {
        
        NSString *word = originalarray[i];
        
        if ([word hasSuffix:@"ing"] || [word hasSuffix:@"ing."]) {
            
            NSString *randomParticiple = [dataStore getRandomParticiple];
            //            NSLog(@"TRYS TO INSERT:%@", randomParticiple );
            
            [whelpedArray insertObject:randomParticiple atIndex:i];
            
        } else if ((i > 0 && [originalarray[i - 1] isEqualToString:@"a"]) || (i > 0 && [originalarray[i - 1] isEqualToString:@"the"])){
            
            NSString *randomNoun = [dataStore getRandomNoun];
            
            [whelpedArray insertObject: randomNoun atIndex:i];
            
            
        } else {
            
            [whelpedArray insertObject: word atIndex:i];
            
        }
        
    }
    
    return [[whelpedArray componentsJoinedByString:@" "] mutableCopy];
}


-(void)ensurePunctuation:(NSMutableString *)string {
    
    NSString *lastCharacter = [string substringFromIndex: string.length - 1];
    
    if (![@[@"!", @".", @"?",] containsObject:lastCharacter]) {
        
        [string appendString:@"."];
        
    }
    
}

@end
