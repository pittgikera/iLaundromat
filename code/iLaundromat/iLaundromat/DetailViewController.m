//
//  DetailViewController.m
//  iLaundromat
//
//  Created by ilabadmin on 29/09/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize orderTypeLabel, orderPriceLabel, orderQuantityLabel, orderDateLabel, orderStatusLabel, orderTotalpriceLabel, currentOrder;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Load up the UI
    [self setLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark Methods

- (void)getMyOrder:(id)myorderObject
{
    //MyOrders * object = orderTypeLabel;
    currentOrder = myorderObject;
}

- (void)setLabels
{
    orderTypeLabel.text = currentOrder.type;
    orderPriceLabel.text = currentOrder.price;
    orderQuantityLabel.text = currentOrder.quantity;
    orderDateLabel.text = currentOrder.date;
    orderStatusLabel.text = currentOrder.status;
    orderTotalpriceLabel.text = currentOrder.totalprice;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
