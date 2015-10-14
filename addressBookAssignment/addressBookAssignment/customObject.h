//
//  customObject.h
//  addressBookAssignment
//
//  Created by Jordan Weaver on 9/24/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface customObject : NSObject

    @property NSString* sentStr;
    @property NSString* timeSent;

-(id)initWithEmail:(NSString*)newEmail andTime:(NSString*)newTime;

@end
