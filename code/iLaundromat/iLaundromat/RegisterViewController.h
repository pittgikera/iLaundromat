//
//  RegisterViewController.h
//  iLaundromat
//
//  Created by ilabafrica on 28/07/2016.
//  Copyright © 2016 wafuasiwatatu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtFullName;
@property (weak, nonatomic) IBOutlet UITextField *txtEmailAddress;
@property (weak, nonatomic) IBOutlet UITextField *txtPhoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)btnRegisterUser:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtRepassword;

@end
