//
//  DetailViewController.h
//  iLaundromat
//
//  Created by ilabadmin on 29/09/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyOrders.h"

@interface DetailViewController : UIViewController

@property(nonatomic,strong) IBOutlet UILabel *orderTypeLabel;
@property(nonatomic,strong) IBOutlet UILabel *orderPriceLabel;
@property(nonatomic,strong) IBOutlet UILabel *orderQuantityLabel;
@property(nonatomic,strong) IBOutlet UILabel *orderDateLabel;
@property(nonatomic,strong) IBOutlet UILabel *orderStatusLabel;
@property(nonatomic,strong) IBOutlet UILabel *orderTotalpriceLabel;

@property(nonatomic, strong) MyOrders * currentOrder;

#pragma mark - 
#pragma mark Methods

- (void)getMyOrder:(id)myorderObject;
- (void)setLabels;

@end
