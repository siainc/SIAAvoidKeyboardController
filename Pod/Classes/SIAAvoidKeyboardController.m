//
//  SIAAvoidKeyboardController.m
//  SIAAvoidKeyboardController
//
//  Created by KUROSAKI Ryota on 2011/11/24.
//  Copyright (c) 2011-2014 SI Agency Inc. All rights reserved.
//

#if !__has_feature(objc_arc)
#error This code needs compiler option -fobjc_arc
#endif

#import "SIAAvoidKeyboardController.h"

@interface SIAAvoidKeyboardController ()

@property (nonatomic) NSValue *initialInsetsValue;

@end

@implementation SIAAvoidKeyboardController

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)dealloc
{
    [self stop];
}

- (void)start
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShowing:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHiding:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

- (void)stop
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    self.scrollView.contentInset = self.initialInsetsValue.UIEdgeInsetsValue;
    self.scrollView.scrollIndicatorInsets = self.initialInsetsValue.UIEdgeInsetsValue;
}

#pragma mark - Keyboard notification

- (void)keyboardWillShowing:(NSNotification *)aNotification
{
    if (self.scrollView == nil) {
        return;
    }
    
    NSDictionary *info = aNotification.userInfo;
    
    NSValue *keyboardWindowFrame = info[UIKeyboardFrameEndUserInfoKey];
    CGRect scrollWindowFrame = [self.scrollView.superview convertRect:self.scrollView.frame toView:self.scrollView.window];
    CGFloat bottomPadding = CGRectGetMaxY(self.scrollView.window.bounds) - CGRectGetMaxY(scrollWindowFrame);

    if (self.initialInsetsValue == nil) {
        self.initialInsetsValue = [NSValue valueWithUIEdgeInsets:self.scrollView.contentInset];
    }
    UIEdgeInsets contentInsets = self.initialInsetsValue.UIEdgeInsetsValue;
    contentInsets.bottom = CGRectGetHeight(keyboardWindowFrame.CGRectValue) - bottomPadding;
    
    NSNumber *duration = info[UIKeyboardAnimationDurationUserInfoKey];
    [UIView animateWithDuration:duration.doubleValue animations:^{
        self.scrollView.contentInset = contentInsets;
        self.scrollView.scrollIndicatorInsets = contentInsets;
    }];
}

- (void)keyboardWillHiding:(NSNotification *)aNotification
{
    if (self.scrollView == nil) {
        return;
    }

    UIEdgeInsets inset = self.initialInsetsValue.UIEdgeInsetsValue;
    NSNumber *duration = aNotification.userInfo[UIKeyboardAnimationDurationUserInfoKey];
    [UIView animateWithDuration:duration.doubleValue animations:^{
        self.scrollView.contentInset = inset;
        self.scrollView.scrollIndicatorInsets = inset;
    }];
    self.initialInsetsValue = nil;
}

@end
