//
//  customClass.m
//  collectionAssignment
//
//  Created by Jordan Weaver on 9/10/14.
//  Copyright (c) 2014 Jordan Weaver. All rights reserved.
//

#import "customClass.h"

@implementation customClass
@synthesize cellImage, cellText;

-(id)initWithImage: (UIImage*)image string:(NSString*)name
{
    if (self = [super init]) {
        cellImage = image;
        cellText = name;
    }
    return self;
}

@end
