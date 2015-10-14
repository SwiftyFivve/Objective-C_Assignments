//
//  playerInfo.m
//  searchAssignment
//
//  Created by Jordan Weaver on 9/12/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "playerInfo.h"

@implementation playerInfo

-(id)initWithName:(NSString*)newName andPosition:(NSString*)newPosition
{
    self = [super init];
    if (self) {
        self.name = [NSString stringWithString:newName];
        self.position = [NSString stringWithString:newPosition];
    }
    return self;
}

-(NSString *)description
{
    return self.name;
}

@end
