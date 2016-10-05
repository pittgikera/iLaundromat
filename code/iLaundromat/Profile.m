//
//  Profile.m
//  iLaundromat
//
//  Created by Wangari Gathagu on 05/10/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import "Profile.h"

@implementation Profile

@synthesize fullname, email, phonenumber, estate;

- (id)initWithOrderName: (NSString *)oName andOrderEmail: (NSString *)oEmail andOrderPhone: (NSString *)oPhone andOrderEstate: (NSString *)oEstate
{
    self = [super init];
    if (self)
    {
        fullname = oName;
        email = oEmail;
        phonenumber = oPhone;
        estate = oEstate;
        
    }
    return self;
}


@end
