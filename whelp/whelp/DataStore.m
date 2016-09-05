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

@end
