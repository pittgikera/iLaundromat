//
//  Profile.h
//  iLaundromat
//
//  Created by Wangari Gathagu on 05/10/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Profile : NSObject

@property (strong,nonatomic) NSString * fullname;
@property (strong,nonatomic) NSString * email;
@property (strong,nonatomic) NSString * phonenumber;
@property (strong,nonatomic) NSString * estate;


#pragma mark -
#pragma mark Class Methods

- (id)initWithOrderName: (NSString *)oName andOrderEmail: (NSString *)oEmail andOrderPhone: (NSString *)oPhone andOrderEstate: (NSString *)oEstate;


@end
