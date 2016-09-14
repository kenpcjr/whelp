//
//  Quote.h
//  whelp
//
//  Created by Kenneth Cooke on 9/6/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DataStore;

@interface Quote : NSObject

@property (strong, nonatomic) NSString* originalQuote;
@property (strong, nonatomic) NSString* whelpedQuote;


-(instancetype)init;
-(instancetype)initWithOriginalQuote:(NSString*)quote;

-(void)whelpQuote:(Quote *)quote;

@end
