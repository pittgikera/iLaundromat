//
//  MyOrders.m
//  iLaundromat
//
//  Created by Wangari Gathagu on 18/08/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import "MyOrders.h"

@implementation MyOrders

@synthesize type, price, date, status;

- (id)initWithOrderType: (NSString *)oType andOrderPrice: (NSString *)oPrice andOrderDate: (NSString *)oDate andOrderStatus: (NSString *)oStatus
{
    self = [super init];
    if (self)
    {
        type = oType;
        price = oPrice;
        date = oDate;
        status = oStatus;
        
    }
    return self;
}

@end
