//
//  Quote.m
//  whelp
//
//  Created by Kenneth Cooke on 9/6/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

#import "Quote.h"

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

@end
