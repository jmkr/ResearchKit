//
//  ORKBackButton.m
//  ResearchKit
//
//  Created by John Meeker on 5/18/18.
//  Copyright © 2018 researchkit.org. All rights reserved.
//

#import "ORKBackButton.h"

@implementation ORKBackButton {
    UIColor *_normalTintColor;
    UIColor *_normalHighlightOrSelectTintColor;
    UIColor *_disableTintColor;
    NSLayoutConstraint *_heightConstraint;
    NSLayoutConstraint *_widthConstraint;
}

- (instancetype)initWithTitle:(NSString *)title {
    self = [super initWithTitle:title isDoneButton:NO];
    return self;
}

- (void)tintColorDidChange {
    [super tintColorDidChange];
    
    _normalTintColor = [[self tintColor] colorWithAlphaComponent:1.0f];
    _normalHighlightOrSelectTintColor = _normalTintColor;
    _disableTintColor = [[UIColor blackColor] colorWithAlphaComponent:0.3f];
    
    [self setTitleColor:_normalTintColor forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self setTitleColor:_disableTintColor forState:UIControlStateDisabled];
    
    [super updateBorderColor];
}

@end
