//
//  CFIXNewItem.h
//  CaffeineFix
//
//  Created by Fuggle on 20/04/2014.
//  Copyright (c) 2014 ___COFFEENINE___. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CFIXNewItem : NSObject

@property NSString *itemName;
@property NSString *itemType;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
