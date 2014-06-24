//
//  CGCounter.h
//  DayCounter
//
//  Created by Puriphan Sawutudomphon on 6/14/2557 BE.
//  Copyright (c) 2557 Puriphan Sawutudomphon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CGCounter : NSObject

@property (nonatomic, strong) NSString *description;

@property (nonatomic, strong) NSString *date;

@property (nonatomic, strong) NSString *time;

@property (nonatomic, assign) BOOL done;

- (id)initWithName:(NSString *)description done:(BOOL)done;

@end
