//
//  DataStore.m
//  whelp
//
//  Created by Kenneth Cooke on 9/5/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

#import "DataStore.h"

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
        self.quote = quote;
        NSLog(@"Quote from handler:%@", quote);
        NSLog(@"Quote from property:%@", self.quote);
        
        completion();
    }];
    
    NSLog(@"Property outside handler:%@", self.quote);
    
    
}

@end
