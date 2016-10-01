//
//  PlaceOrderViewController.m
//  iLaundromat
//
//  Created by Wangari Gathagu on 01/10/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import "PlaceOrderViewController.h"

@interface PlaceOrderViewController ()

@end

@implementation PlaceOrderViewController

@synthesize txtType = _type;
@synthesize txtQuantity = _quantity;
@synthesize txtLocation = _location;
//@synthesize txtDate= _date;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


- (IBAction)btnpost:(id)sender {
    
    [self placeOrder];
}

-(void) placeOrder {
    NSInteger success = 0;
    @try {
        //
        //        if([[self.txtUsername text] isEqualToString:@""] || [[self.txtPassword text] isEqualToString:@""] ) {
        //
        //            [self alertStatus:@"Please enter Email and Password" :@"Sign in Failed!" :0];
        //
        //        } else {
        NSString *post =[[NSString alloc] initWithFormat:@"type=%@&quantity=%@&location=%@",[self.txtType text],[self.txtQuantity text],[self.txtLocation text]];
        NSLog(@"PostData: %@",post);
        
        NSURL *url=[NSURL URLWithString:@"http://codeninja.co.ke/Betti/iOS/placeorder.php"];
        
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        
        //[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
        
        //NSError *error = [[NSError alloc] init];
        NSError *error = nil;
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        NSLog(@"Response code: %ld", (long)[response statusCode]);
        
        if ([response statusCode] >= 200 && [response statusCode] < 300)
        {
            NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
            NSLog(@"Response ==> %@", responseData);
            
            NSError *error = nil;
            NSDictionary *jsonData = [NSJSONSerialization
                                      JSONObjectWithData:urlData
                                      options:NSJSONReadingMutableContainers
                                      error:&error];
            
            success = [jsonData[@"success"] integerValue];
            NSLog(@"Success: %ld",(long)success);
            
            if(success == 1)
            {
                NSLog(@"Order Placed successful");
            } else {
                
                NSString *error_msg = (NSString *) jsonData[@"error_message"];
                [self alertStatus:error_msg :@"Order Placement Failed!" :0];
            }
            
        } else {
            //if (error) NSLog(@"Error: %@", error);
            [self alertStatus:@"Connection Failed" :@"Order Placement Failed!" :0];
        }
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Order Placement Failed." :@"Error!" :0];
    }
    if (success == 1) {
        //HomeViewController *controller=[[[segue destinationViewController]viewControllers]objectAtIndex:0];
        [self performSegueWithIdentifier:@"pushOrders" sender:self];
    }

}

- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}



@end
