//
//  BFTapView.h
//  TapAnimation
//
//  Created by Dennis on 13/9/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BFTapViewDelegate <NSObject>

- (void)tapped;

@end


#define BFTAPVIEW_INITIAL_POINT_RADIUS   20.0f


@interface BFTapView : UIView

@property (readwrite, weak) id<BFTapViewDelegate> delegate;
@property (readwrite, assign) float pointRadius;
@property (readwrite, assign) float pointAnimationTime;
@property (readwrite, strong) UIColor *pointColor;

- (instancetype) initWithFrame:(CGRect)frame delegate:(id<BFTapViewDelegate>)delegate;

@end
