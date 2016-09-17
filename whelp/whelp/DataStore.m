//
//  DataStore.m
//  whelp
//
//  Created by Kenneth Cooke on 9/5/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

#import "DataStore.h"
#import "Quote.h"

@implementation DataStore


+ (instancetype)sharedInstance
{
    static DataStore *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DataStore alloc] init];
    });
    
    return sharedInstance;
}

-(void)loadLameWords {
    
    self.adjectives = @[@"adorbs"
                        ,@"stank"
                        ,@"epic"
                        ,@"ginormous"
                        ,@"crowdsourced"
                        ,@"peak"
                        ,@"gangnam style"
                        ,@"no filter"
                        ,@"adorkable"
                        ,@"carbon-neutral"
                        ,@"baeless"
                        ,@"nom"];
    
    self.nouns = @[@"carbs"
                   ,@"bromance"
                   ,@"man cave"
                   ,@"baby bump"
                   ,@"spoiler alert"
                   ,@"twittersphere"
                   ,@"secret sauce"
                   ,@"emoji"
                   ,@"tumblelog"
                   ,@"photobomb"
                   ,@"jeggings"
                   ,@"staycation"
                   ,@"double rainbow"
                   ,@"planking"
                   ,@"swag"
                   ,@"feels"
                   ,@"doge"
                   ,@"superfood"
                   ,@"drones"
                   ,@"hashtag"
                   ,@"frankenstorm"
                   ,@"trustafarians"
                   ,@"vuvuzela"
                   ,@"cronut"
                   ,@"twerking"
                   ,@"twerk"
                   ,@"meme"
                   ,@"the cloud"
                   ,@"selfie"
                   ,@"locavore"
                   ,@"fracking"
                   ,@"muffin top"
                   ,@"phablet"
                   ,@"brony"
                   ,@"gleek"
                   ,@"job creator"
                   ,@"sharknado"
                   ,@"sea kittens"
                   ,@"underbutt"
                   ,@"bae"];
    
    self.verbs = @[@"chillaxin'"
                   ,@"crowdsource"
                   ,@"photobomb"
                   ,@"vape"
                   ,@"mansplain"
                   ,@"binge-watch"
                   ,@"humblebrag"
                   ,@"nom-nom"];
    
    self.pastParticiple = @[@"planking"
                            ,@"tumbleblogging"
                            ,@"photobombing"
                            ,@"crowdsourcing"
                            ,@"staycationing"
                            ,@"fracking"
                            ,@"mansplaining"
                            ,@"binge-watching"
                            ,@"humblebragging"];
    
    
}

-(void)getRandomQuoteWith:(void (^)())completion {
    
    [QuotesAPI getRandomQuoteWith:^(NSString *quote) {
        
        Quote *receivedQuote = [[Quote alloc]initWithOriginalQuote:quote];
        self.quote = receivedQuote;
        NSLog(@"Quote from handler:%@", quote);
        NSLog(@"Quote from property:%@", self.quote.originalQuote);
        
        completion();
    }];
    
    NSLog(@"Property outside handler:%@", self.quote);
    
}

-(NSString *)getRandomParticiple {
    
    NSInteger randomNumber = arc4random_uniform(self.pastParticiple.count - 1);
    
    NSLog(@"THIS NUMBER PARTICIPLE %li", randomNumber);
    
    NSLog(@"THE FUNCTION RETURNS PARTICIPLE: %@", self.pastParticiple[randomNumber] );
    
    return self.pastParticiple[randomNumber];

    
}

-(NSString *)getRandomNoun {
    
    NSLog(@"Here's the array of nouns ffrom the dataStore: %@", self.nouns);
    
    NSInteger randomNumber = arc4random_uniform(self.nouns.count - 1);
    
    NSLog(@"THIS NUMBER NOUN %li", randomNumber);
    
    NSLog(@"THE FUNCTION RETURNS NOUN: %@", self.nouns[randomNumber] );
    
    return self.nouns[randomNumber];
    
}

@end
