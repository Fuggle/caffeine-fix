//
//  Log.h
//  CaffeineFix
//
//  Created by Fuggle on 24/05/2014.
//  Copyright (c) 2014 ___COFFEENINE___. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Log : NSManagedObject

@property (nonatomic, retain) NSString * drink;
@property (nonatomic, retain) NSDate * time;
@property (nonatomic, retain) NSString * drinkType;
@property (nonatomic, retain) NSNumber * caffMg;

@end
