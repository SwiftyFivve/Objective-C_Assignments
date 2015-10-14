//
//  playerInfo.h
//  searchAssignment
//
//  Created by Jordan Weaver on 9/12/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* positionQuarter = @"Quarterbacks";
static NSString* positionRunning = @"Runningbacks";

@interface playerInfo : NSObject

@property NSString* name;
@property NSString* position;

-(id)initWithName:(NSString*)newName andPosition:(NSString*)newPosition;

@end
