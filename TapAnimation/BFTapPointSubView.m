//
//  BFTapPointSubView.m
//  TapAnimation
//
//  Created by Dennis on 13/9/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import "BFTapPointSubView.h"

@interface BFTapPointSubView ()

@property (readwrite, strong) CAShapeLayer *circleLayer;

@end


@implementation BFTapPointSubView


- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color
{
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = color;
        self.layer.cornerRadius = frame.size.width / 2;
        _duration = BF_DEFAULT_DURATION;
        self.clipsToBounds = YES;
    }
    
    return self;
}



- (void)didMoveToSuperview
{
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:50.0];
    scaleAnimation.duration = self.duration;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.autoreverses = NO;
    
    
    CABasicAnimation *opaqueAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opaqueAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opaqueAnimation.toValue = [NSNumber numberWithFloat:0.0];
    opaqueAnimation.duration = self.duration;
    opaqueAnimation.fillMode = kCAFillModeForwards;
    opaqueAnimation.autoreverses = NO;
    
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.removedOnCompletion = YES;
    groupAnimation.delegate = self;
    groupAnimation.duration = self.duration;
    groupAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    groupAnimation.fillMode = kCAFillModeForwards;
    groupAnimation.animations = [NSArray arrayWithObjects:scaleAnimation, opaqueAnimation, nil];
    
    [self.layer addAnimation:groupAnimation forKey:@"animationGroup"];
}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self removeFromSuperview];
}

@end
