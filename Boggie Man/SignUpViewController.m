//
//  SignUpViewController.m
//  Boggie Man
//
//  Created by Collin Hartigan on 2/15/14.
//  Copyright (c) 2014 Collin Hartigan. All rights reserved.
//

#import "SignUpViewController.h"
#import <Parse/Parse.h>

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
   
}


- (IBAction)signup:(id)sender {
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] == 0 || [password length] == 0 || [email length] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Ahhh"
                                                            message:@"Make sure you enter a username, password, and email!"
                                                           delegate: nil
                                                            cancelButtonTitle:@"Ok"
                                                            otherButtonTitles:nil];
        [alertView show];
    }
    
    else {
        PFUser *newUser = [PFUser user];
        newUser.username = username;
        newUser.password = password;
        newUser.email = email;
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alertView show];
            }
            
            else {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }

}

- (IBAction)dismiss:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



@end
