//
//  HomeViewController.m
//  iLaundromat
//
//  Created by ilabafrica on 27/07/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import "HomeViewController.h"
#import "Profile.h"

#define getDataURL @"http://www.codeninja.co.ke/Betti/iOS/getProfile.php"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize jsonArray, ordersArray;
@synthesize lblName, lblPhone, lblEmail, lblEstate, currentOrder;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"http://www.codeninja.co.ke/Betti/iOS/getProfile.php"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"json: %@", json);
    
    ordersArray = [[NSMutableArray alloc] init];
    
    //  Loop through our jsonArray
    
    //NSDictionary *classDict  = [[NSDictionary alloc]init];
    NSDictionary *classDict = [json objectAtIndex:0];
    
        //for (int i=0; i<[jsonArray count]; i++) {
        //arr = [Class_location objectForKey:@"class_image"];
        //classDict =[jsonArray objectAtIndex:i];
        // NSLog(@"the  dict Values are  are: %@",classDict);
        //NSMutableArray  *dict1 =[[NSMutableArray alloc]init];
        ordersArray =[classDict valueForKey:@"RestInfo"];
        //NSLog(@"the result :%@",dict1);
        //NSLog(@"json: %@", json);
        lblName.text =[classDict valueForKey:@"fullname"];
        lblPhone.text = [classDict valueForKey:@"phonenumber"];
        lblEmail.text = [classDict valueForKey:@"email"];
        lblEstate.text = [classDict valueForKey:@"estate"];
        
    //}
    
    
    //[self setLabels];
    //[self retrieveData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)getMyOrder:(id)myorderObject
{
    //MyOrders * object = orderTypeLabel;
    currentOrder = myorderObject;
}

- (void)setLabels
{
    lblName.text = currentOrder.fullname;
    lblPhone.text = currentOrder.phonenumber;
    lblEmail.text = currentOrder.email;
    lblEstate.text = currentOrder.estate;
}


- (void) retrieveData
{
    NSURL * url = [NSURL URLWithString:getDataURL];
    NSData * data = [NSData dataWithContentsOfURL:url];
    
    jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    //Set up our Orders array
    ordersArray = [[NSMutableArray alloc] init];
    
   
        //Create our Orders object
        NSString * oName = @"fullname";
        NSString * oEmail = @"email";
        NSString * oPhone = @"phonenumber";
        NSString * oEstate =@"estate";
        
        //Add the orders object to our orders array
        [ordersArray addObject:[[Profile alloc] initWithOrderName: (NSString *)oName andOrderEmail: (NSString *)oEmail andOrderPhone: (NSString *)oPhone andOrderEstate: (NSString *)oEstate]];
    
    
    //Reload our table view
    
    //[self.tableView reloadData];
    //[self.MyTableView reloadData];
    
}

@end
