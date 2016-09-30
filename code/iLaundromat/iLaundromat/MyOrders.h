//
//  MyOrders.h
//  iLaundromat
//
//  Created by Wangari Gathagu on 18/08/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyOrders : NSObject

@property (strong,nonatomic) NSString * type;
@property (strong,nonatomic) NSString * price;
@property (strong,nonatomic) NSString * quantity;
@property (strong,nonatomic) NSString * date;
@property (strong,nonatomic) NSString * status;
@property (strong,nonatomic) NSString * totalprice;


#pragma mark -
#pragma mark Class Methods

- (id)initWithOrderType: (NSString *)oType andOrderPrice: (NSString *)oPrice andOrderQuantity: (NSString *)oQuantity andOrderDate: (NSString *)oDate andOrderStatus: (NSString *)oStatus andOrderTotalprice: (NSString *)oTotalprice;

@end
