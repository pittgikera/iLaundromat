//
//  RegisterViewController.m
//  iLaundromat
//
//  Created by ilabafrica on 28/07/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController
@synthesize txtFullName = _fullNames;
@synthesize txtEmailAddress = _emailAddress;
@synthesize txtPhoneNumber = _phoneNumber;
@synthesize txtPassword= _password;
@synthesize txtRepassword = _rePassword;

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

- (IBAction)btnRegisterUser:(id)sender {
    if([_fullNames.text isEqualToString:@""] ||[_emailAddress.text isEqualToString:@""] ||[_phoneNumber.text isEqualToString:@""] ||[_password.text isEqualToString:@""] ||[_rePassword.text isEqualToString:@""] ){
        UIAlertView *error = [[UIAlertView alloc] initWithTitle:@"Oooooops" message:@"You must fill all fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
    }
    else {
        [self checkPasswordsMatch];
    }
}
-(void) checkPasswordsMatch {
    if ([_password.text isEqualToString:_rePassword.text]){
        NSLog(@"Passwords match!");
        [self registerNewUser];
    }
    else{
        NSLog(@"Passwords do not match");
        UIAlertView * error = [[UIAlertView alloc] initWithTitle:@"OOps!" message:@"The passwords you entered do not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [error show];
        
    }
}

-(void) registerNewUser {
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:_fullNames.text forKey:@"fullName"];
//    [defaults setObject:_emailAddress.text forKey:@"emailAddress"];
//    [defaults setObject:_phoneNumber.text forKey:@"phoneNumber"];
//    [defaults setObject:_password.text forKey:@"password"];
    
    
    NSInteger success = 0;
    @try {
//        
//        if([[self.txtUsername text] isEqualToString:@""] || [[self.txtPassword text] isEqualToString:@""] ) {
//            
//            [self alertStatus:@"Please enter Email and Password" :@"Sign in Failed!" :0];
//            
//        } else {
            NSString *post =[[NSString alloc] initWithFormat:@"fullname=%@&emailaddress=%@&phonenumber=%@&password=%@",[self.txtFullName text],[self.txtEmailAddress text],[self.txtPhoneNumber text],[self.txtPassword text]];
            NSLog(@"PostData: %@",post);
            
            NSURL *url=[NSURL URLWithString:@"http://codeninja.co.ke/Betti/iOS/register.php"];
            
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
            
            NSError *error = [[NSError alloc] init];
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
                    NSLog(@"Registration successful");
                } else {
                    
                    NSString *error_msg = (NSString *) jsonData[@"error_message"];
                    [self alertStatus:error_msg :@"Registration Failed!" :0];
                }
                
            } else {
                //if (error) NSLog(@"Error: %@", error);
                [self alertStatus:@"Connection Failed" :@"Registration Failed!" :0];
            }
        
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Registration Failed." :@"Error!" :0];
    }
    if (success == 1) {
        //HomeViewController *controller=[[[segue destinationViewController]viewControllers]objectAtIndex:0];
        [self performSegueWithIdentifier:@"register_success" sender:self];
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

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:(YES)];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;

    
//    [defaults synchronize];
//    UIAlertView *success = [[UIAlertView alloc] initWithTitle:@"Success" message:@"You have registered a new user" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
//    [success show];
//    [self performSegueWithIdentifier:@"register_success" sender:self];
    
}
@end
