//
//  SIAViewController.m
//  SIAAvoidKeyboardController
//
//  Created by KUROSAKI Ryota on 09/10/2014.
//  Copyright (c) 2014 KUROSAKI Ryota. All rights reserved.
//

#import "SIAViewController.h"

#import <SIAAvoidKeyboardController.h>

@interface SIAViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) SIAAvoidKeyboardController *avoidKeyboardController;

@end

@implementation SIAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.avoidKeyboardController = [[SIAAvoidKeyboardController alloc] init];
    self.avoidKeyboardController.scrollView = self.scrollView;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.avoidKeyboardController start];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.avoidKeyboardController stop];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
