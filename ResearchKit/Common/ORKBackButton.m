//
//  ORKBackButton.m
//  ResearchKit
//
//  Created by John Meeker on 5/18/18.
//  Copyright © 2018 researchkit.org. All rights reserved.
//

#import "ORKBackButton.h"

@implementation ORKBackButton {
    UIColor *_borderColor;
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

    _borderColor = [[self tintColor] colorWithAlphaComponent:1.0f];
    _normalTintColor = [UIColor whiteColor];
    _normalHighlightOrSelectTintColor = [[self tintColor] colorWithAlphaComponent:0.7f];
    _disableTintColor = [[UIColor blackColor] colorWithAlphaComponent:0.3f];

    [self setTitleColor:_borderColor forState:UIControlStateNormal];
    [self setTitleColor:_normalHighlightOrSelectTintColor forState:UIControlStateHighlighted];
    [self setTitleColor:_normalHighlightOrSelectTintColor forState:UIControlStateSelected];
    [self setTitleColor:_disableTintColor forState:UIControlStateDisabled];

    [self updateBorderColor];
}

- (void)fadeHighlightOrSelectColor {
    // Ignore if it's a race condition
    if (self.enabled && !(self.highlighted || self.selected)) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [_borderColor CGColor];
    }
}

- (void)updateBorderColor {
    [super updateBorderColor];

    if (self.enabled && (self.highlighted || self.selected)) {
        self.backgroundColor = _normalTintColor;
        self.layer.borderColor = [_normalHighlightOrSelectTintColor CGColor]; // move
    } else if(self.enabled && !(self.highlighted || self.selected)) {
        if (self.fadeDelay > 0) {
            [self performSelector:@selector(fadeHighlightOrSelectColor) withObject:nil afterDelay:self.fadeDelay];
        } else {
            [self fadeHighlightOrSelectColor];
        }
    } else {
        self.backgroundColor = _normalTintColor;
        self.layer.borderColor = [_disableTintColor CGColor];
    }
}

@end
