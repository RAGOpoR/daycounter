//
//  CGCounter.m
//  DayCounter
//
//  Created by Puriphan Sawutudomphon on 6/14/2557 BE.
//  Copyright (c) 2557 Puriphan Sawutudomphon. All rights reserved.
//

#import "CGCounter.h"

@implementation CGCounter

@synthesize description = _description;
@synthesize done = _done;
@synthesize date = _date;
@synthesize time = _time;

- (id)initWithName:(NSString *)description done:(BOOL)done
{
    self = [super init];
    
    if (self) {
        self.description = description;
        self.done = done;
        self.date = _date;
        self.time = _time;
        
    }
    return self;
}

@end
