//
//  BFTapPointSubView.h
//  TapAnimation
//
//  Created by Dennis on 13/9/2016.
//  Copyright © 2016 Dennis. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BF_DEFAULT_DURATION 0.3f

@interface BFTapPointSubView : UIView

@property (readwrite, assign) float duration;

- (instancetype) initWithFrame:(CGRect)frame color:(UIColor *)color;

@end
