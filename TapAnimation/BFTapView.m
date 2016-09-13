//
//  BFTapView.m
//  TapAnimation
//
//  Created by Dennis on 13/9/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import "BFTapView.h"
#import "BFTapPointSubView.h"

@implementation BFTapView

- (instancetype)initWithFrame:(CGRect)frame delegate:(id<BFTapViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedWithEvent:)];
        [self addGestureRecognizer:tapGesture];
        [self setUserInteractionEnabled:YES];
        
        self.clipsToBounds = YES;
        _delegate = delegate;
        _pointColor = [UIColor redColor];
        _pointRadius = BFTAPVIEW_INITIAL_POINT_RADIUS;
        _pointAnimationTime = BF_DEFAULT_DURATION;
    }
    
    return self;
}


- (void)tappedWithEvent:(UITapGestureRecognizer *)sender
{
    CGPoint point = [sender locationInView:self];
    BFTapPointSubView *pointView = [[BFTapPointSubView alloc] initWithFrame:CGRectMake(point.x - self.pointRadius, point.y - self.pointRadius, 2 * self.pointRadius, 2 * self.pointRadius) color:self.pointColor];
    [self addSubview:pointView];
    
    if (self.delegate && [self.delegate conformsToProtocol:@protocol(BFTapViewDelegate)]) {
        [self.delegate tapped];
    }
}

@end
