//
//  ViewController.h
//  iLaundromat
//
//  Created by Peter Gikera on 19/07/2016.
//  Copyright (c) 2016 wafuasiwatatu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtUsername;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
- (IBAction)btnLogin:(id)sender;
- (IBAction)backgroundTap:(id)sender;


@end

