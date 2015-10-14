//
//  customClass.h
//  collectionAssignment
//
//  Created by Jordan Weaver on 9/10/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface customClass : NSObject

@property UIImage* cellImage;
@property NSString* cellText;

-(id)initWithImage: (UIImage*)image string:(NSString*)name;


@end
