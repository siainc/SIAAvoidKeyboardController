//
//  SIAAvoidKeyboardController.h
//  SIAAvoidKeyboardController
//
//  Created by KUROSAKI Ryota on 2011/11/24.
//  Copyright (c) 2011-2014 SI Agency Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SIAAvoidKeyboardController : NSObject

@property (nonatomic, strong) UIScrollView *scrollView;
- (void)start;
- (void)stop;

@end
