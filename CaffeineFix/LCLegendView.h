//
//  LCLegendView.h
//  ios-linechart
//
//  Created by Huang Jiewei on 27/04/14.
//  Copyright (c) 2014 ___COFFEENINE___. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LCLegendView : UIView

@property (nonatomic, strong) UIFont *titlesFont;
@property (strong) NSArray *titles;
@property (strong) NSDictionary *colors; // maps titles to UIColors

@end
