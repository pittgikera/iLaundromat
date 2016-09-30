//
//  MyOrdersViewController.m
//  iLaundromat
//
//  Created by Wangari Gathagu on 18/08/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import "MyOrdersViewController.h"
#import "MyOrders.h"
#import "DetailViewController.h"

#define getDataURL @"http://www.codeninja.co.ke/Betti/iOS/myorders.php"

@interface MyOrdersViewController ()

@end

@implementation MyOrdersViewController
@synthesize jsonArray, ordersArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Set the title of our VC
    self.title = @"My Orders";
    
    //Load data
    [self retrieveData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    
    //Return the number of rows in the section
    return ordersArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    MyOrders * myorderObject;
    myorderObject = [ordersArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = myorderObject.type;
    
    
    
    //Accessory
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"pushDetailView"])
    {
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        
        //Get the object for the selected row
        MyOrders * object = [ordersArray objectAtIndex:indexPath.row];
        
        [[segue destinationViewController] getMyOrder:object];
    }
}


#pragma mark -
#pragma mark Class Methods

- (void) retrieveData
{
    NSURL * url = [NSURL URLWithString:getDataURL];
    NSData * data = [NSData dataWithContentsOfURL:url];
    
    jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    //Set up our Orders array
    ordersArray = [[NSMutableArray alloc] init];
    
    //  Loop through our jsonArray
    for (int i = 0; i < jsonArray.count; i++)
    {
        //Create our Orders object
        NSString * oType = [[jsonArray objectAtIndex:i] objectForKey:@"type"];
        NSString * oPrice = [[jsonArray objectAtIndex:i] objectForKey:@"price"];
        NSString * oQuantity = [[jsonArray objectAtIndex:i] objectForKey:@"quantity"];
        NSString * oDate = [[jsonArray objectAtIndex:i] objectForKey:@"orderdate"];
        NSString * oStatus = [[jsonArray objectAtIndex:i] objectForKey:@"status"];
        NSString * oTotalprice = [[jsonArray objectAtIndex:i] objectForKey:@"totalprice"];
        
        //Add the orders object to our orders array
        [ordersArray addObject:[[MyOrders alloc] initWithOrderType:oType andOrderPrice:oPrice andOrderQuantity:oQuantity andOrderDate:oDate andOrderStatus:oStatus andOrderTotalprice:oTotalprice]];
    }
    
    //Reload our table view
    
    [self.tableView reloadData];
    //[self.MyTableView reloadData];
    
}

@end
