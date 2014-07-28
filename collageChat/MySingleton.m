//
//  MySingleton.m
//  HeartIT
//
//  Created by Ryan Chan on 7/27/14.
//  Copyright (c) 2014 Ryan Chan. All rights reserved.
//

#import "MySingleton.h"

@implementation MySingleton



static MySingleton *singletonInstance;

+ (MySingleton*)getInstance{
    if (singletonInstance == nil) {
        singletonInstance = [[super alloc] init];
    }
    return singletonInstance;
}



@end
