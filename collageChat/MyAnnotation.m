//
//  MyAnnotation.m
//  HeartIT
//
//  Created by Ryan Chan on 7/27/14.
//  Copyright (c) 2014 Ryan Chan. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate title:(NSString *)title {
    if ((self = [super init])) {
        self.coordinate =coordinate;
        self.title = title;
    }
    return self;
}


@end
