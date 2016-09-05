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
    
    [QuotesAPI getRandomQuote];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
