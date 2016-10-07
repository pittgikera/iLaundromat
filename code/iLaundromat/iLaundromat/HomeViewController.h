//
//  HomeViewController.h
//  iLaundromat
//
//  Created by ilabafrica on 27/07/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblPhone;
@property (weak, nonatomic) IBOutlet UILabel *lblEstate;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (nonatomic,strong) NSMutableArray * jsonArray;
@property (nonatomic, strong) NSMutableArray * ordersArray;

#pragma mark -
#pragma mark Class Methods


@end
