//
//  customObject.m
//  addressBookAssignment
//
//  Created by Jordan Weaver on 9/24/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "customObject.h"

@implementation customObject

-(id)initWithEmail:(NSString *)newEmail andTime:(NSString *)newTime
{
    self = [super init];
    if (self) {
        self.sentStr = [NSString stringWithString:newEmail];
        self.timeSent = [NSString stringWithString:newTime];
    }
    return self;
}


@end
