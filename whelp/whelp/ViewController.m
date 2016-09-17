//
//  ViewController.m
//  whelp
//
//  Created by Kenneth Cooke on 9/5/16.
//  Copyright © 2016 kencooke. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataStore = [DataStore sharedInstance];
    
    [self.dataStore loadLameWords];
    
//    NSLog(@"Here's the Array of nouns from VC: %@",self.dataStore.nouns);
    
    [self.dataStore getRandomQuoteWith:^{
        NSLog(@"From VC:%@", self.dataStore.quote.originalQuote);
        
        [self.dataStore.quote whelpQuote:self.dataStore.quote];
        
        NSLog(@"Whelped Quote: %@", self.dataStore.quote.whelpedQuote);
        
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
