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
@synthesize lblName, lblPhone, lblEmail, lblEstate;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSError *error;
    NSString *url_string = [NSString stringWithFormat: @"http://www.codeninja.co.ke/Betti/iOS/getProfile.php?email=gmail.com"];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    NSLog(@"json: %@", json);
    
    ordersArray = [[NSMutableArray alloc] init];
    
    //  Loop through our jsonArray
    
    //NSDictionary *classDict  = [[NSDictionary alloc]init];
    NSDictionary *classDict = [json objectAtIndex:0];
    
        ordersArray =[classDict valueForKey:@"RestInfo"];

        lblName.text =[classDict valueForKey:@"fullname"];
        lblPhone.text = [classDict valueForKey:@"phonenumber"];
        lblEmail.text = [classDict valueForKey:@"email"];
        lblEstate.text = [classDict valueForKey:@"estate"];
        

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

@end
