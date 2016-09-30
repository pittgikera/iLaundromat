//
//  MyOrders.m
//  iLaundromat
//
//  Created by Wangari Gathagu on 18/08/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import "MyOrders.h"

@implementation MyOrders

@synthesize type, price, quantity, date, status, totalprice;

- (id)initWithOrderType: (NSString *)oType andOrderPrice: (NSString *)oPrice andOrderQuantity: (NSString *)oQuantity andOrderDate: (NSString *)oDate andOrderStatus: (NSString *)oStatus andOrderTotalprice: (NSString *)oTotalprice
{
    self = [super init];
    if (self)
    {
        type = oType;
        price = oPrice;
        quantity = oQuantity;
        date = oDate;
        status = oStatus;
        totalprice = oTotalprice;
        
    }
    return self;
}

@end