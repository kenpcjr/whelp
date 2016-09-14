//
//  ViewController.h
//  whelp
//
//  Created by Kenneth Cooke on 9/5/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataStore.h"
#import "QuotesAPI.h"
#import "Quote.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) DataStore *dataStore;

-(void)insertWordInto:(NSString *)quote;


@end

