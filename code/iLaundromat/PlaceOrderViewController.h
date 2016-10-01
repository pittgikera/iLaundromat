//
//  PlaceOrderViewController.h
//  iLaundromat
//
//  Created by Wangari Gathagu on 01/10/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceOrderViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *txtType;
@property (weak, nonatomic) IBOutlet UITextField *txtQuantity;
@property (weak, nonatomic) IBOutlet UITextField *txtLocation;

//@property (weak, nonatomic) IBOutlet UIDatePicker *txtDate;
- (IBAction)btnpost:(id)sender;
@end
