//
//  MyOrdersViewController.h
//  iLaundromat
//
//  Created by Wangari Gathagu on 18/08/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrdersViewController : UITableViewController
//{
//    
//    IBOutlet UITableView  *MyTableView;
//}
//@property(nonatomic,strong)IBOutlet UITableView *MyTableView;

@property (nonatomic,strong) NSMutableArray * jsonArray;
@property (nonatomic, strong) NSMutableArray * ordersArray;

#pragma mark -
#pragma mark Class Methods

- (void) retrieveData;

@end
