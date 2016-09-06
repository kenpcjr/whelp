//
//  QuotesAPI.h
//  whelp
//
//  Created by Kenneth Cooke on 9/5/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface QuotesAPI : NSObject

+(void)getRandomQuoteWith:(void (^)(NSString* quote))completion;

@end
